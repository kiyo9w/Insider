enum MessageRole {
  user,
  assistant,
}

enum ReportStyle {
  academic,
  popularScience,
  news,
  socialMedia,
  strategicInvestment,
}

/// Workflow mode for unified chat endpoint
enum ChatMode {
  simpleQa,
  deepQa,
  proSearch,
}

class ChatMessage {
  final String content;
  final MessageRole role;
  final List<String>? relatedQueries;
  final List<SearchResult>? sources;
  final List<String>? images;
  final bool isErrorMessage;
  final AgentSearchFullResponse? agentResponse;

  ChatMessage({
    required this.content,
    required this.role,
    this.relatedQueries,
    this.sources,
    this.images,
    this.isErrorMessage = false,
    this.agentResponse,
  });

  Map<String, dynamic> toJson() => {
        'content': content,
        'role': role.name,
        if (relatedQueries != null) 'related_queries': relatedQueries,
        if (sources != null)
          'sources': sources?.map((s) => s.toJson()).toList(),
        if (images != null) 'images': images,
        'is_error_message': isErrorMessage,
        if (agentResponse != null) 'agent_response': agentResponse?.toJson(),
      };

  /// Returns a JSON map suitable for API requests, excluding client-only fields
  Map<String, dynamic> toApiJson() => {
        'content': content,
        'role': role.name,
        // Only include fields expected by the backend
      };

  factory ChatMessage.fromJson(Map<String, dynamic> json) => ChatMessage(
        content: json['content'] as String,
        role: MessageRole.values.firstWhere(
          (e) => e.name == json['role'],
          orElse: () => MessageRole.user,
        ),
        relatedQueries: (json['related_queries'] as List?)?.cast<String>(),
        sources: (json['sources'] as List?)
            ?.map((s) => SearchResult.fromJson(s))
            .toList(),
        images: (json['images'] as List?)?.cast<String>(),
        isErrorMessage: json['is_error_message'] as bool? ?? false,
        agentResponse: json['agent_response'] != null
            ? AgentSearchFullResponse.fromJson(json['agent_response'])
            : null,
      );
}

class ChatRequest {
  final List<ChatMessage> messages;
  final String conversationId;
  final String threadId;
  final WorkflowConfig? workflowConfig;
  final ReportStyle? reportStyle;
  final IntraInfoConfig? intraInfoConfig;
  final ExtraInfoConfig? extraInfoConfig;
  final ChatMode? mode;

  ChatRequest({
    required this.messages,
    required this.conversationId,
    required this.threadId,
    this.workflowConfig,
    this.reportStyle,
    this.intraInfoConfig,
    this.extraInfoConfig,
    this.mode,
  });

  Map<String, dynamic> toJson() => {
        'messages': messages.map((m) => m.toApiJson()).toList(),
        'conversation_id': conversationId,
        'thread_id': threadId,
        if (workflowConfig != null) 'workflow_config': workflowConfig?.toJson(),
        if (reportStyle != null)
          'report_style': _reportStyleToJson(reportStyle!),
        if (intraInfoConfig != null)
          'intra_info_config': intraInfoConfig?.toJson(),
        if (extraInfoConfig != null)
          'extra_info_config': extraInfoConfig?.toJson(),
        if (mode != null) 'mode': _chatModeToJson(mode!),
      };

  String _chatModeToJson(ChatMode mode) {
    switch (mode) {
      case ChatMode.simpleQa:
        return 'simple_qa';
      case ChatMode.deepQa:
        return 'deep_qa';
      case ChatMode.proSearch:
        return 'provider';
    }
  }

  String _reportStyleToJson(ReportStyle style) {
    switch (style) {
      case ReportStyle.academic:
        return 'academic';
      case ReportStyle.popularScience:
        return 'popular_science';
      case ReportStyle.news:
        return 'news';
      case ReportStyle.socialMedia:
        return 'social_media';
      case ReportStyle.strategicInvestment:
        return 'strategic_investment';
    }
  }
}

class SearchResult {
  final String title;
  final String url;
  final String content;

  SearchResult({
    required this.title,
    required this.url,
    required this.content,
  });

  Map<String, dynamic> toJson() => {
        'title': title,
        'url': url,
        'content': content,
      };

  factory SearchResult.fromJson(Map<String, dynamic> json) => SearchResult(
        title: json['title'] as String,
        url: json['url'] as String,
        content: json['content'] as String,
      );
}

class AgentSearchFullResponse {
  final List<String> steps;
  final List<AgentSearchStep> stepsDetails;

  AgentSearchFullResponse({
    required this.steps,
    required this.stepsDetails,
  });

  Map<String, dynamic> toJson() => {
        'steps': steps,
        'steps_details': stepsDetails.map((s) => s.toJson()).toList(),
      };

  factory AgentSearchFullResponse.fromJson(Map<String, dynamic> json) =>
      AgentSearchFullResponse(
        steps: (json['steps'] as List).cast<String>(),
        stepsDetails: (json['steps_details'] as List)
            .map((s) => AgentSearchStep.fromJson(s))
            .toList(),
      );
}

class AgentSearchStep {
  final int stepNumber;
  final String step;
  final List<String>? queries;
  final List<SearchResult>? results;
  final List<String>? images;
  final String status;

  AgentSearchStep({
    required this.stepNumber,
    required this.step,
    this.queries,
    this.results,
    this.images,
    this.status = 'default',
  });

  Map<String, dynamic> toJson() => {
        'step_number': stepNumber,
        'step': step,
        if (queries != null) 'queries': queries,
        if (results != null)
          'results': results?.map((r) => r.toJson()).toList(),
        if (images != null) 'images': images,
        'status': status,
      };

  factory AgentSearchStep.fromJson(Map<String, dynamic> json) =>
      AgentSearchStep(
        stepNumber: json['step_number'] as int,
        step: json['step'] as String,
        queries: (json['queries'] as List?)?.cast<String>(),
        results: (json['results'] as List?)
            ?.map((r) => SearchResult.fromJson(r))
            .toList(),
        images: (json['images'] as List?)?.cast<String>(),
        status: json['status'] as String? ?? 'default',
      );
}

class WorkflowConfig {
  final bool? debug;
  final int? maxPlanIterations;
  final int? maxStepNum;
  final bool? autoAcceptedPlan;
  final bool? enableBackgroundInvestigation;
  final bool? enableDeepThinking;

  const WorkflowConfig({
    this.debug = false,
    this.maxPlanIterations = 1,
    this.maxStepNum = 3,
    this.autoAcceptedPlan = false,
    this.enableBackgroundInvestigation = true,
    this.enableDeepThinking = false,
  });

  Map<String, dynamic> toJson() => {
        'debug': debug,
        'max_plan_iterations': maxPlanIterations,
        'max_step_num': maxStepNum,
        'auto_accepted_plan': autoAcceptedPlan,
        'enable_background_investigation': enableBackgroundInvestigation,
        'enable_deep_thinking': enableDeepThinking,
      };
}

class Resource {
  final String uri;
  final String title;
  final String? description;

  const Resource({
    required this.uri,
    required this.title,
    this.description,
  });

  factory Resource.fromJson(Map<String, dynamic> json) => Resource(
        uri: json['uri'] as String,
        title: json['title'] as String,
        description: json['description'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'uri': uri,
        'title': title,
        if (description != null) 'description': description,
      };
}

class IntraInfoConfig {
  final bool enabled;
  final int maxResults;
  final List<Resource> resources;

  const IntraInfoConfig({
    this.enabled = false,
    this.maxResults = 5,
    this.resources = const [],
  });

  Map<String, dynamic> toJson() => {
        'enabled': enabled,
        'max_results': maxResults,
        'resources': resources.map((r) => r.toJson()).toList(),
      };
}

class ExtraInfoConfig {
  final bool enabled;
  final int maxResults;
  final List<Resource> resources;

  const ExtraInfoConfig({
    this.enabled = true,
    this.maxResults = 5,
    this.resources = const [],
  });

  Map<String, dynamic> toJson() => {
        'enabled': enabled,
        'max_results': maxResults,
        'resources': resources.map((r) => r.toJson()).toList(),
      };
}
