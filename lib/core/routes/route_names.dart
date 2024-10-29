class RouteNames{
  static const String home = "/";
  static const String splash = "splash";
  static const String getAllPosts = "/getAll";
  static const String getPost = "/getPost";
  static const String updatePost = "/update";
  static const String deletePost = "/delete";
  static const String addPost="/add";
  static const String login = "/login";

    static const Map<String , String> appRoutes = {
    "splash":splash,
    "home":home,
    "login":login,
    "getAllPosts":getAllPosts,
    "getPost":getPost,
    "addPost":addPost,
    "updatePost":updatePost,
    "deletePost":deletePost
  };
  
}