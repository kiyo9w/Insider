import 'package:insider/features/chat/data/models/chat_models.dart';

/// Represents an agent search step for deep_qa mode
class AgentStep {
  final int stepNumber;
  final String title;
  final List<String> queries;
  final List<AgentStepResult> results;
  final AgentStepStatus status;
  final String? thought;

  const AgentStep({
    required this.stepNumber,
    required this.title,
    this.queries = const [],
    this.results = const [],
    this.status = AgentStepStatus.pending,
    this.thought,
  });

  AgentStep copyWith({
    int? stepNumber,
    String? title,
    List<String>? queries,
    List<AgentStepResult>? results,
    AgentStepStatus? status,
    String? thought,
  }) {
    return AgentStep(
      stepNumber: stepNumber ?? this.stepNumber,
      title: title ?? this.title,
      queries: queries ?? this.queries,
      results: results ?? this.results,
      status: status ?? this.status,
      thought: thought ?? this.thought,
    );
  }
}

enum AgentStepStatus { pending, searching, reading, thinking, done }

/// Represents a search result within an agent step
class AgentStepResult {
  final String title;
  final String url;
  final String? content;
  final String? favicon;

  const AgentStepResult({
    required this.title,
    required this.url,
    this.content,
    this.favicon,
  });
}

class ConversationMessage {
  final String id;
  final String content;
  final MessageRole role;
  final bool isStreaming;
  final List<String>? relatedQueries;
  final int? sourcesCount;
  final List<dynamic>? sources;
  final List<AgentStep>? agentSteps;
  final bool isError;
  final List<String>? queryPlan;
  final List<String>? images;

  ConversationMessage({
    required this.id,
    required this.content,
    required this.role,
    this.isStreaming = false,
    this.isError = false,
    this.relatedQueries,
    this.sourcesCount,
    this.sources,
    this.agentSteps,
    this.queryPlan,
    this.images,
  });
}
