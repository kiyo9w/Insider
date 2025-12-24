// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workflow_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SearchResult _$SearchResultFromJson(Map<String, dynamic> json) =>
    _SearchResult(
      title: json['title'] as String,
      url: json['url'] as String,
      content: json['content'] as String,
    );

Map<String, dynamic> _$SearchResultToJson(_SearchResult instance) =>
    <String, dynamic>{
      'title': instance.title,
      'url': instance.url,
      'content': instance.content,
    };

_ChatSnapshot _$ChatSnapshotFromJson(Map<String, dynamic> json) =>
    _ChatSnapshot(
      id: json['id'] as String,
      title: json['title'] as String,
      date: DateTime.parse(json['date'] as String),
      preview: json['preview'] as String,
    );

Map<String, dynamic> _$ChatSnapshotToJson(_ChatSnapshot instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'date': instance.date.toIso8601String(),
      'preview': instance.preview,
    };

_ListChatHistoriesResponse _$ListChatHistoriesResponseFromJson(
  Map<String, dynamic> json,
) => _ListChatHistoriesResponse(
  snapshots: (json['snapshots'] as List<dynamic>)
      .map((e) => ChatSnapshot.fromJson(e as Map<String, dynamic>))
      .toList(),
  total: (json['total'] as num).toInt(),
);

Map<String, dynamic> _$ListChatHistoriesResponseToJson(
  _ListChatHistoriesResponse instance,
) => <String, dynamic>{
  'snapshots': instance.snapshots,
  'total': instance.total,
};

_ChatHistoryResponse _$ChatHistoryResponseFromJson(Map<String, dynamic> json) =>
    _ChatHistoryResponse(
      id: json['id'] as String,
      title: json['title'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      messages: (json['messages'] as List<dynamic>)
          .map((e) => ChatMessage.fromJson(e as Map<String, dynamic>))
          .toList(),
      threadId: json['thread_id'] as String,
      userId: json['user_id'] as String,
    );

Map<String, dynamic> _$ChatHistoryResponseToJson(
  _ChatHistoryResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'messages': instance.messages,
  'thread_id': instance.threadId,
  'user_id': instance.userId,
};

_AgentSearchStep _$AgentSearchStepFromJson(Map<String, dynamic> json) =>
    _AgentSearchStep(
      stepNumber: (json['step_number'] as num).toInt(),
      step: json['step'] as String,
      queries: (json['queries'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => SearchResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      status:
          $enumDecodeNullable(_$AgentSearchStepStatusEnumMap, json['status']) ??
          AgentSearchStepStatus.defaultValue,
      thought: json['thought'] as String?,
    );

Map<String, dynamic> _$AgentSearchStepToJson(_AgentSearchStep instance) =>
    <String, dynamic>{
      'step_number': instance.stepNumber,
      'step': instance.step,
      'queries': instance.queries,
      'results': instance.results,
      'status': _$AgentSearchStepStatusEnumMap[instance.status]!,
      'thought': instance.thought,
    };

const _$AgentSearchStepStatusEnumMap = {
  AgentSearchStepStatus.done: 'done',
  AgentSearchStepStatus.current: 'current',
  AgentSearchStepStatus.defaultValue: 'default',
};

_AgentSearchFullResponse _$AgentSearchFullResponseFromJson(
  Map<String, dynamic> json,
) => _AgentSearchFullResponse(
  steps: (json['steps'] as List<dynamic>?)?.map((e) => e as String).toList(),
  stepsDetails: (json['steps_details'] as List<dynamic>?)
      ?.map((e) => AgentSearchStep.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$AgentSearchFullResponseToJson(
  _AgentSearchFullResponse instance,
) => <String, dynamic>{
  'steps': instance.steps,
  'steps_details': instance.stepsDetails,
};

_ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) => _ChatMessage(
  content: json['content'] as String,
  role: $enumDecode(_$MessageRoleEnumMap, json['role']),
  relatedQueries: (json['related_queries'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  sources: (json['sources'] as List<dynamic>?)
      ?.map((e) => SearchResult.fromJson(e as Map<String, dynamic>))
      .toList(),
  images: (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
  isErrorMessage: json['is_error_message'] as bool? ?? false,
  agentResponse: json['agent_response'] == null
      ? null
      : AgentSearchFullResponse.fromJson(
          json['agent_response'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$ChatMessageToJson(_ChatMessage instance) =>
    <String, dynamic>{
      'content': instance.content,
      'role': _$MessageRoleEnumMap[instance.role]!,
      'related_queries': ?instance.relatedQueries,
      'sources': ?instance.sources,
      'images': ?instance.images,
      'is_error_message': instance.isErrorMessage,
      'agent_response': ?instance.agentResponse,
    };

const _$MessageRoleEnumMap = {
  MessageRole.user: 'user',
  MessageRole.assistant: 'assistant',
};

_Resource _$ResourceFromJson(Map<String, dynamic> json) => _Resource(
  uri: json['uri'] as String,
  title: json['title'] as String,
  description: json['description'] as String? ?? '',
);

Map<String, dynamic> _$ResourceToJson(_Resource instance) => <String, dynamic>{
  'uri': instance.uri,
  'title': instance.title,
  'description': instance.description,
};

_IntraInfoConfig _$IntraInfoConfigFromJson(Map<String, dynamic> json) =>
    _IntraInfoConfig(
      enabled: json['enabled'] as bool? ?? false,
      maxResults: (json['max_results'] as num?)?.toInt() ?? 3,
      resources:
          (json['resources'] as List<dynamic>?)
              ?.map((e) => Resource.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$IntraInfoConfigToJson(_IntraInfoConfig instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'max_results': instance.maxResults,
      'resources': instance.resources,
    };

_ExtraInfoConfig _$ExtraInfoConfigFromJson(Map<String, dynamic> json) =>
    _ExtraInfoConfig(
      enabled: json['enabled'] as bool? ?? true,
      maxResults: (json['max_results'] as num?)?.toInt() ?? 3,
      resources:
          (json['resources'] as List<dynamic>?)
              ?.map((e) => Resource.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ExtraInfoConfigToJson(_ExtraInfoConfig instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'max_results': instance.maxResults,
      'resources': instance.resources,
    };

_WorkflowConfig _$WorkflowConfigFromJson(Map<String, dynamic> json) =>
    _WorkflowConfig(
      debug: json['debug'] as bool? ?? false,
      maxPlanIterations: (json['max_plan_iterations'] as num?)?.toInt() ?? 1,
      maxStepNum: (json['max_step_num'] as num?)?.toInt() ?? 3,
      autoAcceptedPlan: json['auto_accepted_plan'] as bool? ?? false,
      enableBackgroundInvestigation:
          json['enable_background_investigation'] as bool? ?? true,
      interruptFeedback: json['interrupt_feedback'] as String?,
      mcpSettings: json['mcp_settings'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$WorkflowConfigToJson(_WorkflowConfig instance) =>
    <String, dynamic>{
      'debug': instance.debug,
      'max_plan_iterations': instance.maxPlanIterations,
      'max_step_num': instance.maxStepNum,
      'auto_accepted_plan': instance.autoAcceptedPlan,
      'enable_background_investigation': instance.enableBackgroundInvestigation,
      'interrupt_feedback': instance.interruptFeedback,
      'mcp_settings': instance.mcpSettings,
    };

_ChatRequest _$ChatRequestFromJson(Map<String, dynamic> json) => _ChatRequest(
  messages: (json['messages'] as List<dynamic>)
      .map((e) => ChatMessage.fromJson(e as Map<String, dynamic>))
      .toList(),
  conversationId: json['conversation_id'] as String,
  threadId: json['thread_id'] as String,
  workflowConfig: json['workflow_config'] == null
      ? null
      : WorkflowConfig.fromJson(
          json['workflow_config'] as Map<String, dynamic>,
        ),
  reportStyle: $enumDecodeNullable(_$ReportStyleEnumMap, json['report_style']),
  intraInfoConfig: json['intra_info_config'] == null
      ? null
      : IntraInfoConfig.fromJson(
          json['intra_info_config'] as Map<String, dynamic>,
        ),
  extraInfoConfig: json['extra_info_config'] == null
      ? null
      : ExtraInfoConfig.fromJson(
          json['extra_info_config'] as Map<String, dynamic>,
        ),
  provider: json['provider'] as String?,
  mode: $enumDecodeNullable(_$ChatModeEnumMap, json['mode']),
);

Map<String, dynamic> _$ChatRequestToJson(_ChatRequest instance) =>
    <String, dynamic>{
      'messages': instance.messages,
      'conversation_id': instance.conversationId,
      'thread_id': instance.threadId,
      'workflow_config': ?instance.workflowConfig,
      'report_style': ?_$ReportStyleEnumMap[instance.reportStyle],
      'intra_info_config': ?instance.intraInfoConfig,
      'extra_info_config': ?instance.extraInfoConfig,
      'provider': ?instance.provider,
      'mode': ?_$ChatModeEnumMap[instance.mode],
    };

const _$ReportStyleEnumMap = {
  ReportStyle.academic: 'academic',
  ReportStyle.popularScience: 'popular_science',
  ReportStyle.news: 'news',
  ReportStyle.socialMedia: 'social_media',
  ReportStyle.strategicInvestment: 'strategic_investment',
};

const _$ChatModeEnumMap = {
  ChatMode.simpleQa: 'simple_qa',
  ChatMode.deepQa: 'deep_qa',
  ChatMode.provider: 'provider',
};

_EnhancePromptRequest _$EnhancePromptRequestFromJson(
  Map<String, dynamic> json,
) => _EnhancePromptRequest(
  prompt: json['prompt'] as String,
  context: json['context'] as String? ?? '',
  reportStyle: json['report_style'] as String? ?? 'academic',
);

Map<String, dynamic> _$EnhancePromptRequestToJson(
  _EnhancePromptRequest instance,
) => <String, dynamic>{
  'prompt': instance.prompt,
  'context': instance.context,
  'report_style': instance.reportStyle,
};

_RAGConfigResponse _$RAGConfigResponseFromJson(Map<String, dynamic> json) =>
    _RAGConfigResponse(provider: json['provider'] as String?);

Map<String, dynamic> _$RAGConfigResponseToJson(_RAGConfigResponse instance) =>
    <String, dynamic>{'provider': instance.provider};

_ConfigResponse _$ConfigResponseFromJson(Map<String, dynamic> json) =>
    _ConfigResponse(
      rag: RAGConfigResponse.fromJson(json['rag'] as Map<String, dynamic>),
      models: (json['models'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
    );

Map<String, dynamic> _$ConfigResponseToJson(_ConfigResponse instance) =>
    <String, dynamic>{'rag': instance.rag, 'models': instance.models};

_RAGResourcesResponse _$RAGResourcesResponseFromJson(
  Map<String, dynamic> json,
) => _RAGResourcesResponse(
  resources: (json['resources'] as List<dynamic>)
      .map((e) => Resource.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$RAGResourcesResponseToJson(
  _RAGResourcesResponse instance,
) => <String, dynamic>{'resources': instance.resources};

_MCPServerMetadataRequest _$MCPServerMetadataRequestFromJson(
  Map<String, dynamic> json,
) => _MCPServerMetadataRequest(
  transport: json['transport'] as String,
  command: json['command'] as String?,
  args: (json['args'] as List<dynamic>?)?.map((e) => e as String).toList(),
  url: json['url'] as String?,
  env: (json['env'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String),
  ),
  headers: (json['headers'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String),
  ),
  timeoutSeconds: (json['timeout_seconds'] as num?)?.toInt(),
);

Map<String, dynamic> _$MCPServerMetadataRequestToJson(
  _MCPServerMetadataRequest instance,
) => <String, dynamic>{
  'transport': instance.transport,
  'command': instance.command,
  'args': instance.args,
  'url': instance.url,
  'env': instance.env,
  'headers': instance.headers,
  'timeout_seconds': instance.timeoutSeconds,
};

_MCPServerMetadataResponse _$MCPServerMetadataResponseFromJson(
  Map<String, dynamic> json,
) => _MCPServerMetadataResponse(
  transport: json['transport'] as String,
  command: json['command'] as String?,
  args: (json['args'] as List<dynamic>?)?.map((e) => e as String).toList(),
  url: json['url'] as String?,
  env: (json['env'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String),
  ),
  headers: (json['headers'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, e as String),
  ),
  tools: json['tools'] as List<dynamic>?,
);

Map<String, dynamic> _$MCPServerMetadataResponseToJson(
  _MCPServerMetadataResponse instance,
) => <String, dynamic>{
  'transport': instance.transport,
  'command': instance.command,
  'args': instance.args,
  'url': instance.url,
  'env': instance.env,
  'headers': instance.headers,
  'tools': instance.tools,
};
