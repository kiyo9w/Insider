import 'package:freezed_annotation/freezed_annotation.dart';

part 'workflow_models.freezed.dart';
part 'workflow_models.g.dart';

enum MessageRole { user, assistant }

enum ReportStyle {
  academic,
  @JsonValue('popular_science')
  popularScience,
  news,
  @JsonValue('social_media')
  socialMedia,
  @JsonValue('strategic_investment')
  strategicInvestment,
}

enum AgentSearchStepStatus {
  done,
  current,
  @JsonValue('default')
  defaultValue,
}

/// Workflow mode for unified chat endpoint
enum ChatMode {
  @JsonValue('simple_qa')
  simpleQa,
  @JsonValue('deep_qa')
  deepQa,
  @JsonValue('provider')
  provider,
}

@freezed
abstract class SearchResult with _$SearchResult {
  const factory SearchResult({
    required String title,
    required String url,
    required String content,
  }) = _SearchResult;

  factory SearchResult.fromJson(Map<String, dynamic> json) =>
      _$SearchResultFromJson(json);
}

@freezed
abstract class ChatSnapshot with _$ChatSnapshot {
  const factory ChatSnapshot({
    required String id,
    required String title,
    required DateTime date,
    required String preview,
  }) = _ChatSnapshot;

  factory ChatSnapshot.fromJson(Map<String, dynamic> json) =>
      _$ChatSnapshotFromJson(json);
}

@freezed
abstract class ListChatHistoriesResponse with _$ListChatHistoriesResponse {
  const factory ListChatHistoriesResponse({
    required List<ChatSnapshot> snapshots,
    required int total,
  }) = _ListChatHistoriesResponse;

  factory ListChatHistoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListChatHistoriesResponseFromJson(json);
}

@freezed
abstract class ChatHistoryResponse with _$ChatHistoryResponse {
  const factory ChatHistoryResponse({
    required String id,
    required String title,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    required List<ChatMessage> messages,
    @JsonKey(name: 'thread_id') required String threadId,
    @JsonKey(name: 'user_id') required String userId,
  }) = _ChatHistoryResponse;

  factory ChatHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatHistoryResponseFromJson(json);
}

@freezed
abstract class AgentSearchStep with _$AgentSearchStep {
  const factory AgentSearchStep({
    @JsonKey(name: 'step_number') required int stepNumber,
    required String step,
    List<String>? queries,
    List<SearchResult>? results,
    @Default(AgentSearchStepStatus.defaultValue) AgentSearchStepStatus status,
    String? thought,
  }) = _AgentSearchStep;

  factory AgentSearchStep.fromJson(Map<String, dynamic> json) =>
      _$AgentSearchStepFromJson(json);
}

@freezed
abstract class AgentSearchFullResponse with _$AgentSearchFullResponse {
  const factory AgentSearchFullResponse({
    List<String>? steps,
    @JsonKey(name: 'steps_details') List<AgentSearchStep>? stepsDetails,
  }) = _AgentSearchFullResponse;

  factory AgentSearchFullResponse.fromJson(Map<String, dynamic> json) =>
      _$AgentSearchFullResponseFromJson(json);
}

@freezed
abstract class ChatMessage with _$ChatMessage {
  const factory ChatMessage({
    required String content,
    required MessageRole role,
    @JsonKey(name: 'related_queries', includeIfNull: false) List<String>? relatedQueries,
    @JsonKey(includeIfNull: false) List<SearchResult>? sources,
    @JsonKey(includeIfNull: false) List<String>? images,
    @JsonKey(name: 'is_error_message', includeIfNull: false) @Default(false) bool isErrorMessage,
    @JsonKey(name: 'agent_response', includeIfNull: false) AgentSearchFullResponse? agentResponse,
  }) = _ChatMessage;

  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);
}

@freezed
abstract class Resource with _$Resource {
  const factory Resource({
    required String uri,
    required String title,
    @Default('') String? description,
  }) = _Resource;

  factory Resource.fromJson(Map<String, dynamic> json) =>
      _$ResourceFromJson(json);
}

@freezed
abstract class IntraInfoConfig with _$IntraInfoConfig {
  const factory IntraInfoConfig({
    @Default(false) bool enabled,
    @JsonKey(name: 'max_results') @Default(3) int maxResults,
    @Default([]) List<Resource> resources,
  }) = _IntraInfoConfig;

  factory IntraInfoConfig.fromJson(Map<String, dynamic> json) =>
      _$IntraInfoConfigFromJson(json);
}

@freezed
abstract class ExtraInfoConfig with _$ExtraInfoConfig {
  const factory ExtraInfoConfig({
    @Default(true) bool enabled,
    @JsonKey(name: 'max_results') @Default(3) int maxResults,
    @Default([]) List<Resource> resources,
  }) = _ExtraInfoConfig;

  factory ExtraInfoConfig.fromJson(Map<String, dynamic> json) =>
      _$ExtraInfoConfigFromJson(json);
}

@freezed
abstract class WorkflowConfig with _$WorkflowConfig {
  const factory WorkflowConfig({
    @Default(false) bool? debug,
    @JsonKey(name: 'max_plan_iterations') @Default(1) int? maxPlanIterations,
    @JsonKey(name: 'max_step_num') @Default(3) int? maxStepNum,
    @JsonKey(name: 'auto_accepted_plan') @Default(false) bool? autoAcceptedPlan,
    @JsonKey(name: 'enable_background_investigation')
    @Default(true)
    bool? enableBackgroundInvestigation,
    @JsonKey(name: 'interrupt_feedback') String? interruptFeedback,
    @JsonKey(name: 'mcp_settings') Map<String, dynamic>? mcpSettings,
  }) = _WorkflowConfig;

  factory WorkflowConfig.fromJson(Map<String, dynamic> json) =>
      _$WorkflowConfigFromJson(json);
}

@freezed
abstract class ChatRequest with _$ChatRequest {
  const factory ChatRequest({
    required List<ChatMessage> messages,
    @JsonKey(name: 'conversation_id') required String conversationId,
    @JsonKey(name: 'thread_id') required String threadId,
    @JsonKey(name: 'workflow_config', includeIfNull: false) WorkflowConfig? workflowConfig,
    @JsonKey(name: 'report_style', includeIfNull: false) ReportStyle? reportStyle,
    @JsonKey(name: 'intra_info_config', includeIfNull: false) IntraInfoConfig? intraInfoConfig,
    @JsonKey(name: 'extra_info_config', includeIfNull: false) ExtraInfoConfig? extraInfoConfig,
    @JsonKey(includeIfNull: false) String? provider,

    /// Workflow mode for unified chat endpoint (simple_qa or deep_qa)
    @JsonKey(includeIfNull: false) ChatMode? mode,
  }) = _ChatRequest;

  factory ChatRequest.fromJson(Map<String, dynamic> json) =>
      _$ChatRequestFromJson(json);
}

@freezed
abstract class EnhancePromptRequest with _$EnhancePromptRequest {
  const factory EnhancePromptRequest({
    required String prompt,
    @Default('') String? context,
    @JsonKey(name: 'report_style') @Default('academic') String? reportStyle,
  }) = _EnhancePromptRequest;

  factory EnhancePromptRequest.fromJson(Map<String, dynamic> json) =>
      _$EnhancePromptRequestFromJson(json);
}

@freezed
abstract class RAGConfigResponse with _$RAGConfigResponse {
  const factory RAGConfigResponse({String? provider}) = _RAGConfigResponse;

  factory RAGConfigResponse.fromJson(Map<String, dynamic> json) =>
      _$RAGConfigResponseFromJson(json);
}

@freezed
abstract class ConfigResponse with _$ConfigResponse {
  const factory ConfigResponse({
    required RAGConfigResponse rag,
    required Map<String, List<String>> models,
  }) = _ConfigResponse;

  factory ConfigResponse.fromJson(Map<String, dynamic> json) =>
      _$ConfigResponseFromJson(json);
}

@freezed
abstract class RAGResourcesResponse with _$RAGResourcesResponse {
  const factory RAGResourcesResponse({required List<Resource> resources}) =
      _RAGResourcesResponse;

  factory RAGResourcesResponse.fromJson(Map<String, dynamic> json) =>
      _$RAGResourcesResponseFromJson(json);
}

@freezed
abstract class MCPServerMetadataRequest with _$MCPServerMetadataRequest {
  const factory MCPServerMetadataRequest({
    required String transport,
    String? command,
    List<String>? args,
    String? url,
    Map<String, String>? env,
    Map<String, String>? headers,
    @JsonKey(name: 'timeout_seconds') int? timeoutSeconds,
  }) = _MCPServerMetadataRequest;

  factory MCPServerMetadataRequest.fromJson(Map<String, dynamic> json) =>
      _$MCPServerMetadataRequestFromJson(json);
}

@freezed
abstract class MCPServerMetadataResponse with _$MCPServerMetadataResponse {
  const factory MCPServerMetadataResponse({
    required String transport,
    String? command,
    List<String>? args,
    String? url,
    Map<String, String>? env,
    Map<String, String>? headers,
    List<dynamic>? tools,
  }) = _MCPServerMetadataResponse;

  factory MCPServerMetadataResponse.fromJson(Map<String, dynamic> json) =>
      _$MCPServerMetadataResponseFromJson(json);
}
