import 'package:apptours/core/controllers/commands.dart';
import 'package:apptours/core/controllers/controllers.dart';
import 'package:apptours/core/model/profile_support_data.dart';
import 'package:apptours/core/model/user.dart';
import 'package:apptours/core/services/api_service.dart';
import 'package:apptours/main.dart';

class LoadProfileCommand implements AsyncCommand<void, User> {
  @override
  Future<User> execute(_) {
    return di.get<ApiService>().authMe();
  }
}

class ProfileStore extends ItemStore<void, User> {
  ProfileStore() : super(LoadProfileCommand());

  @override
  bool get canReload => true;

  Future<ProfileSupportData> loadStaticData() {
    return di.get<ApiService>().fetchProfileData();
  }
}
