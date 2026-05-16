class Comment {
  final String id;
  final String postId;  
  final String name;   
  final String email;  
  final String body;

  const Comment({
    required this.id,
    required this.postId,
    required this.name,
    required this.email,
    required this.body,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Comment &&
        other.id == id &&
        other.postId == postId &&
        other.name == name &&
        other.email == email &&
        other.body == body;
  }

  @override
  int get hashCode =>
      id.hashCode ^ postId.hashCode ^ name.hashCode ^ email.hashCode ^ body.hashCode;
}