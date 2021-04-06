import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

import 'web_interceptors/web_interceptor.dart';

Client client = HttpClientWithInterceptor.build(
  interceptors: [LoggingInterceptor()],
  requestTimeout: Duration(seconds: 5),
);
var url = Uri.parse('http://192.168.18.5:8080/transactions');
