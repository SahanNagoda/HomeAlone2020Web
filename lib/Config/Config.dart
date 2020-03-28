class Config {
  // static final String url = "https://class-manager-backend.herokuapp.com";
  // static final String url = "http://192.168.1.100:3005";
  // static final String url = "http://18.204.203.62:3005";
  static final String deploy = "Production";
  static String getURL() {
    switch (deploy) {
      case "Production":
        return "https://homealonebackend.firebaseapp.com";
        break;
      case "Local":
        return "http://localhost:5000";
        break;
      case "QA":
        return "https://class-manager-backend.herokuapp.com";
        break;
      default:
        return "http://192.168.1.100:3005";
    }
  }
}
