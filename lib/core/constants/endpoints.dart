class Endpoints {
  Endpoints._();
  //Auth
  static String login = "auth/login";
  static String users = "/users";

  static String setUp = "/setup";
  static String register = "/register";
  static String logOut = "/logout";
  //Store
  static String products = "/products";
  static String categories = "/products/categories";
  static String allCarts = "/carts/";
  static String carts = "/carts/user/";
  //BaseUrl
  static String baseUrlStaging = "https://fakestoreapi.com";
  static String baseUrlDev = "https://fakestoreapi.com";
  static String baseUrlProd = "https://fakestoreapi.com";
}
