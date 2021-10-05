import 'package:dio/dio.dart';

String handleDioError(DioError error) {
  String errorDescription = "";

  switch (error.type) {
    case DioErrorType.cancel:
      errorDescription = "Request to API server was cancelled";
      break;
    case DioErrorType.connectTimeout:
      errorDescription = "Connection timeout with API server";
      break;
    case DioErrorType.other:
      errorDescription =
          "Connection to API server failed due to internet connection";
      break;
    case DioErrorType.receiveTimeout:
      errorDescription = "Receive timeout in connection with API server";
      break;
    case DioErrorType.response:
      {
        // if (error.response.statusCode == 403) {
        //   errorDescription = S.current.dontHavePermission;
        //   AppSnackBar.show(null, S.current.dontHavePermission, ToastType.Error);
        // } else
      
        errorDescription =
            "Received invalid status code: ${error.response?.statusCode}";
        break;
      }

    case DioErrorType.sendTimeout:
      errorDescription = "Send timeout in connection with API server";
      break;
  }

  return errorDescription;
}
