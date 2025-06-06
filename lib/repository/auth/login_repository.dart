import 'package:blocstructure/configs/app_urls.dart';
import 'package:blocstructure/models/user/user_model.dart';
import 'package:blocstructure/network/network_service_api.dart';

class LoginRepository {
  final _api = NetworkServiceApi();

  Future<UserModel> loginApi(dynamic data) async {
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'x-api-key': 'reqres-free-v1',
    };
    final response = await _api.postApi(
      needHeader: true,
      headers: header,
      AppUrls.login,
      data,
    );

    return UserModel.fromJson(response);
  }
}
