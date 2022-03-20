import 'package:flutter/cupertino.dart';
import 'user_state.dart';
import '../widget/toast_message.dart';
import 'package:provider/provider.dart';

import '../../core/enums/dio_request_enum.dart';
import '../manager/network/network_manager.dart';
import '../model/user_model.dart';

class UserService {
  get context => null;

  Future<UserModel> fetchUserInfos(BuildContext context) async {
    final response = await NetworkManager.instance.dioRequest(path: 'Account/Get', method: DioRequestTypes.GET.name);
    final responseModel = UserModel.fromJson(response.data);
    Provider.of<UserProvider>(context, listen: false).setUser(user: responseModel);

    return responseModel;
  }

  Future<void> updateUserInfo(BuildContext context, position) async {
    final response =
        await NetworkManager.instance.dioRequest(path: 'Account/Update', method: DioRequestTypes.POST.name, queryJson: {
      "Location": {"Longtitude": position.longitude.toString(), "Latitude": position.latitude.toString()}
    });
    if (response.statusCode == 200) {
      return CallMessage.callToastMessage(text: response.data['Message'], context: context);
    }
  }
}
