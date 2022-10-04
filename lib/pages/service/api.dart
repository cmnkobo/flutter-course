import 'dart:io';

class AdeAPI {
  var baseurl;

  AdeAPI() {
    //check platform
    if (Platform.isAndroid) {
      baseurl = "http://10.0.2.2:8888/php_beginner/";
    } else {
      baseurl = "http://localhost:8888/php_beginner/";
    }
  }
}
