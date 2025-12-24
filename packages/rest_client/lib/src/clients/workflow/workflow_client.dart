import 'package:dio/dio.dart';
import 'package:rest_client/src/models/workflow/workflow_models.dart';
import 'package:retrofit/retrofit.dart';

part 'workflow_client.g.dart';

@RestApi()
abstract class WorkflowClient {
  factory WorkflowClient(Dio dio, {String baseUrl}) = _WorkflowClient;

  /// Unified chat completions endpoint supporting multiple workflow modes
  /// The mode parameter in ChatRequest determines the workflow (simple_qa or deep_qa)
  @POST('/api/v1/chat/completions')
  @DioResponseType(ResponseType.stream)
  Future<HttpResponse<dynamic>> chatCompletions(@Body() ChatRequest request);

  @POST('/api/v1/workflow/simple_qa/completions')
  @DioResponseType(ResponseType.stream)
  Future<HttpResponse<dynamic>> simpleQa(@Body() ChatRequest request);

  @POST('/api/v1/workflow/prompt_enhancer/completions')
  Future<String> promptEnhancer(@Body() EnhancePromptRequest request);

  @POST('/api/v1/workflow/deep_qa/completions')
  @DioResponseType(ResponseType.stream)
  Future<HttpResponse<dynamic>> deepQa(@Body() ChatRequest request);

  @GET('/api/v1/config')
  Future<ConfigResponse> getConfig();

  @POST('/api/v1/mcp/server/metadata')
  Future<MCPServerMetadataResponse> getMcpServerMetadata(
    @Body() MCPServerMetadataRequest request,
  );

  @GET('/api/v1/rag/config')
  Future<RAGConfigResponse> getRagConfig();

  @GET('/api/v1/rag/resources')
  Future<RAGResourcesResponse> getRagResources(@Query('query') String? query);

  @GET('/api/v1/chat/history')
  Future<ListChatHistoriesResponse> getChatHistory({
    @Query('limit') int limit = 50,
    @Query('offset') int offset = 0,
  });

  @GET('/api/v1/chat/history/{history_id}')
  Future<ChatHistoryResponse> getChatHistoryDetail(
    @Path('history_id') String historyId,
  );

  @DELETE('/api/v1/chat/history/{history_id}')
  Future<void> deleteChatHistory(@Path('history_id') String historyId);
}
