# Pro Search & Deep QA Fix

## Problem

Pro Search and Deep QA workflows were not working in the mobile app, even though the backend API was functioning correctly.

## Root Cause

In `lib/data/repositories/chat/chat_repository_impl.dart`, the `_handleStream` method was using the **local** `ChatRequest` model to serialize the request body for EventFlux SSE connections:

```dart
final connectionFuture = _connectEventFlux(
  path: path,
  body: request.toJson(),  // ❌ Using local ChatRequest
  ...
);
```

The local `ChatRequest` model (`lib/features/chat/data/models/chat_models.dart`) **does not have a `provider` field**, which is required by the backend API for Pro Search mode to work.

The app has two ChatRequest models:
1. **Local model**: `lib/features/chat/data/models/chat_models.dart` - missing `provider` field
2. **REST client model**: `packages/rest_client/lib/src/models/workflow/workflow_models.dart` - has `provider` field

### API Requirements (from API_Specs.json)

For **Pro Search** mode:
```json
{
  "mode": "provider",
  "provider": "perplexity"
}
```

For **Deep QA** mode:
```json
{
  "mode": "deep_qa"
}
```

## Solution

Modified `_handleStream` to map the local `ChatRequest` to the rest_client `ChatRequest` **before** serialization:

```dart
// Map to rest_client ChatRequest to ensure proper serialization (includes provider field)
final mappedRequest = _mapRequest(request);

final connectionFuture = _connectEventFlux(
  path: path,
  body: mappedRequest.toJson(),  // ✅ Using mapped rest_client ChatRequest
  ...
);
```

This ensures that:
- The `provider: "perplexity"` field is included for Pro Search requests
- All other fields are correctly serialized according to the API spec
- The backend receives the proper request format

## Verification

### Backend API Test (using curl)

**Pro Search** - Working ✅
```bash
curl -N -X POST "https://api-dev.trinq.site/api/v1/chat/completions" \
  -H "Authorization: Bearer <token>" \
  -H "Content-Type: application/json" \
  -d '{
    "messages": [{"role": "user", "content": "What is AI?"}],
    "conversation_id": "aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa",
    "thread_id": "bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb",
    "mode": "provider",
    "provider": "perplexity"
  }'
```

Received expected SSE events:
- `StreamEvent.AGENT_QUERY_PLAN`
- `StreamEvent.AGENT_SEARCH_QUERIES`
- `StreamEvent.AGENT_READ_RESULTS`
- `StreamEvent.SEARCH_RESULTS`
- `StreamEvent.BEGIN_STREAM`
- `StreamEvent.TEXT_CHUNK`

**Deep QA** - Working ✅
```bash
curl -N -X POST "https://api-dev.trinq.site/api/v1/chat/completions" \
  -H "Authorization: Bearer <token>" \
  -H "Content-Type: application/json" \
  -d '{
    "messages": [{"role": "user", "content": "Who is the president of USA?"}],
    "conversation_id": "cccccccc-cccc-cccc-cccc-cccccccccccc",
    "thread_id": "dddddddd-dddd-dddd-dddd-dddddddddddd",
    "mode": "deep_qa"
  }'
```

Received expected SSE events:
- `StreamEvent.AGENT_CALLS_TOOL`

## Files Modified

1. **`lib/data/repositories/chat/chat_repository_impl.dart`**
   - Line 151-152: Added mapping of local ChatRequest to rest_client ChatRequest
   - Line 156: Updated to use `mappedRequest.toJson()`
   - Line 160: Updated to use `mappedRequest.toJson()`

2. **`packages/rest_client/lib/src/models/workflow/workflow_models.dart`**
   - Added `@JsonKey(includeIfNull: false)` to ChatMessage optional fields (relatedQueries, sources, images, isErrorMessage, agentResponse)
   - Added `@JsonKey(includeIfNull: false)` to ChatRequest optional fields (workflowConfig, reportStyle, intraInfoConfig, extraInfoConfig, provider, mode)

3. **`packages/rest_client/lib/src/models/workflow/workflow_models.g.dart`**
   - Modified `_$ChatMessageToJson` to conditionally exclude null values
   - Modified `_$ChatRequestToJson` to conditionally exclude null values

## Testing Steps

1. Open the app
2. Select **Pro Search** mode from the chat interface
3. Send a query (e.g., "What is artificial intelligence?")
4. Verify:
   - Agent search queries are displayed
   - Search results are shown
   - Final answer streams correctly
5. Select **Deep QA** mode
6. Send a query (e.g., "Who is the president of USA?")
7. Verify:
   - Agent processing indicators appear
   - Final answer streams correctly

## Related Files

- `lib/features/chat/view/conversation_screen.dart` - Chat UI that initiates requests
- `lib/features/chat/data/models/chat_models.dart` - Local ChatRequest model
- `packages/rest_client/lib/src/models/workflow/workflow_models.dart` - REST client models
- `packages/rest_client/lib/src/clients/workflow/workflow_client.dart` - API client
- `sse_events_guide.md.resolved` - SSE event documentation
- `API_Specs.json` - Backend API specification

