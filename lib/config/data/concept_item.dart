enum ConceptLevel { basic, intermediate, advanced }

class ConceptTopic {
  final String id;
  final String title;
  final String description;

  const ConceptTopic({
    required this.id,
    required this.title,
    required this.description,
  });
}

class ConceptCategory {
  final String id;
  final String title;
  final String description;
  final ConceptLevel level;
  final List<ConceptTopic> topics;

  ConceptCategory({
    required this.id, 
    required this.title, 
    required this.description, 
    required this.level, 
    required this.topics,
  });
}