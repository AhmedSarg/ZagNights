import 'package:cloud_firestore/cloud_firestore.dart';

import '../network/app_api.dart';

abstract class RemoteDataSource {
  Future<bool> getAppStatus();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppServiceClient _appServiceClient;

  RemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<bool> getAppStatus() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    late bool appStatus;
    await firestore.collection('GlobalVariables').doc('variables').get().then((value) {
      appStatus = value.data()?['appStatus'];
    });
    return appStatus;
  }

}
