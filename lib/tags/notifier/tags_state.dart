part of 'tags_notifier.dart';

enum TagsStatus {
  initial,
  loading,
  success,
  failure,
}

class TagsState extends Equatable {
  const TagsState(
      {this.tags = const [],
      this.status = TagsStatus.initial,
      this.errorMessage = ''});

  TagsState copyWith({
    TagsStatus? status,
    List<Tag>? tags,
    String? errorMessage,
  }) {
    return TagsState(
      status: status ?? this.status,
      tags: tags ?? this.tags,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  final TagsStatus status;
  final List<Tag> tags;
  final String errorMessage;

  @override
  List<Object?> get props => [status, tags, errorMessage];
}
