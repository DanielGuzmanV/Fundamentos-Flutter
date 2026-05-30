
class ApiConstants {
  static const String randomUserBaseUrl = 'https://randomuser.me/api/';
  static const String jsonPlaceholderBaseUrl = 'https://jsonplaceholder.typicode.com/';
  static const String picsumBaseUrl = 'https://picsum.photos/';

  // Endpoints específicos
  static const String randomUserEndpoint = '${randomUserBaseUrl}?results=';
  static const String jsonPlaceholderPostsEndpoint = '${jsonPlaceholderBaseUrl}posts';
  static const String jsonPlaceholderCommentsEndpoint = '${jsonPlaceholderBaseUrl}comments';
  
  // Tamaños de imagen específicos para Picsum
  static String picsumImage(int id, int width, int height) => 
      '${picsumBaseUrl}id/$id/$width/$height';
}