class User {
  final String id;
  final String username;
  final String profilePictureUrl;

  const User({
    required this.id,
    required this.username,
    required this.profilePictureUrl,
  });

  // Método para comparar usuarios, importante en listas
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is User &&
        other.id == id &&
        other.username == username &&
        other.profilePictureUrl == profilePictureUrl;
  }

  @override
  int get hashCode =>
      id.hashCode ^ username.hashCode ^ profilePictureUrl.hashCode;
}
