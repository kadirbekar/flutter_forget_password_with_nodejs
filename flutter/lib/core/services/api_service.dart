import 'package:dio/dio.dart';
import 'package:forget_password/core/constants/app_constants.dart';
import 'package:forget_password/core/models/request/forget_password_request_model.dart';
import 'package:forget_password/core/models/response/response_model.dart';
import 'package:forget_password/core/models/response/user_model.dart';
import 'package:forget_password/core/states/request_state.dart';
import 'package:forget_password/locator.dart';

class ApiService {
  final requestState = locator<RequestState>();

  late final Dio _dio;

  ApiService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.API_URL,
        contentType: AppConstants.CONTENT_TYPE,
      ),
    );
  }

  //  add new user
  Future<ResponseModel> saveUser(UserModel user) async {
    late ResponseModel response;
    try {
      requestState.makeStateBusy();

      final request = await _dio.post(
        AppConstants.ADD_NEW_USER,
        data: user.toJson(),
      );

      response = ResponseModel.fromJson(request.data);
    } catch (e) {
      ResponseModel.commonErrorMessage();
    }

    requestState.makeStateNormal();
    return response;
  }

  //  make a request to get new password
  Future<ResponseModel> forgetPassword(String mail) async {
    late ResponseModel response;

    try {
      requestState.makeStateBusy();
      final request = await _dio.post(
        '${AppConstants.FORGET_PASSWORD + "/$mail"}',
        data: ForgetPasswordRequestModel(mail: mail).toJson(),
      );

      response = ResponseModel.fromJson(request.data);
    } catch (e) {
      return ResponseModel.commonErrorMessage();
    }

    requestState.makeStateNormal();

    return response;
  }

  //  try to check the user if exist or not
  Future<ResponseModel> checkUser(UserModel user) async {
    late ResponseModel response;
    try {
      requestState.makeStateBusy();

      final request = await _dio.post(
        AppConstants.CHECK_USER,
        data: user.toJson(),
      );

      response = ResponseModel.fromJson(request.data);
    } catch (e) {
      return ResponseModel.commonErrorMessage();
    }

    requestState.makeStateNormal();
    return response;
  }
}
