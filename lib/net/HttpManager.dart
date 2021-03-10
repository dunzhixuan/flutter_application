class HttpManager {
  factory HttpManager() => _getInstance();
  static HttpManager get instance => _getInstance();
  static HttpManager _instance;

  static HttpManager _getInstance() {
    if (_instance == null) {
      _instance = new HttpManager();
    }
    return _instance;
  }

  void setCommonHeader(String name, String value) {}

  void setCommonParams(String name, String value) {}
}
