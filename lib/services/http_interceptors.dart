import 'package:http_interceptor/http_interceptor.dart';
import 'package:logger/logger.dart';

class LoggingInterceptor implements InterceptorContract {
  Logger logger = Logger();

  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    logger.v(
        "Requisição: ${data.baseUrl}\nCabeçalhos: ${data.headers}\nbody: ${data.body}");
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    if (data.statusCode ~/100 == 2) {
      logger.i(
          "Status: ${data.statusCode}\nResposta: ${data.url}\nCabeçalhos: ${data.headers}\nbody: ${data.body}");
    } else {
      logger.e(
          "Status: ${data.statusCode}\nResposta: ${data.url}\nCabeçalhos: ${data.headers}\nbody: ${data.body}");
    }
    return data;
  }
}
