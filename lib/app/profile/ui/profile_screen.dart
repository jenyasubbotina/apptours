import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:apptours/app/home/controllers/profile_controller.dart';
import 'package:apptours/app/main/ui/apptours.dart';
import 'package:apptours/core/model/profile_support_data.dart';
import 'package:apptours/core/services/api_service.dart';
import 'package:apptours/core/theme/default/theme.dart';
import 'package:apptours/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _store = ProfileStore();

  ProfileSupportData? supportData;

  @override
  void initState() {
    super.initState();
    _store.load(null);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _store.loadStaticData().then((value) {
        setState(() {
          supportData = value;
        });
      });
    });
  }

  void _onLogout() {
    ApiService().logout().then((_) => Navigator.of(context, rootNavigator: true).popAndPushNamed(AppRoute.auth));
  }

  void _sendEmail(String email) {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {'subject': 'Apptours App Support', 'body': 'I have a question about the app.'},
    );
    launchUrl(emailLaunchUri);
  }

  void _showModal(BuildContext context, Widget content) {
    showDialog(
        context: context,
        useRootNavigator: false,
        barrierColor: AppColors.dark15,
        builder: (context) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.light,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: content,
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    final aboutThisAppPopUp = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              s.label_about_this_app,
              style: const TextStyle(
                color: AppColors.primary,
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
            IconButton(
              onPressed: Navigator.of(context).pop,
              icon: const Icon(Icons.close, size: 20),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          supportData?.about_text ?? '',
          style: const TextStyle(
            color: AppColors.secondary,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 40),
        GestureDetector(
          onTap: () {
            if (supportData != null) {
              _sendEmail(supportData!.email);
            }
          },
          child: Container(
            height: 40,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              color: AppColors.accentGreen,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                s.label_feedback,
                style: const TextStyle(
                  color: AppColors.textGreen,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ],
    );
    final supportPopUp = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              s.label_support,
              style: const TextStyle(
                color: AppColors.primary,
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
            IconButton(
              onPressed: Navigator.of(context).pop,
              icon: const Icon(Icons.close, size: 20),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          supportData?.support_text ?? '',
          style: const TextStyle(
            color: AppColors.secondary,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            const Icon(
              Icons.headphones,
              color: AppColors.iconsGreen,
              size: 18,
            ),
            const SizedBox(width: 14),
            Text(
              supportData?.phone ?? '',
              style: const TextStyle(
                color: AppColors.primary,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 40),
        GestureDetector(
          onTap: () {
            if (supportData != null) {
              _sendEmail(supportData!.email);
            }
          },
          child: Container(
            height: 40,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              color: AppColors.accentGreen,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                s.label_feedback,
                style: const TextStyle(
                  color: AppColors.textGreen,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ],
    );

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Text(
                s.label_my_profile,
                style: const TextStyle(
                  color: AppColors.text,
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 24),
              const SizedBox(height: 16),
              Observer(builder: (context) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 35,
                      child: ClipOval(
                        child: Image.network(
                          _store.data?.avatar ??
                              'https://static.vecteezy.com/system/resources/thumbnails/002/002/403/small/man-with-beard-avatar-character-isolated-icon-free-vector.jpg',
                        ),
                      ),
                    ),
                    const SizedBox(width: 24),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _store.data?.full_name ?? "",
                            style: const TextStyle(
                              color: AppColors.primary,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            _store.data?.email ?? "",
                            style: const TextStyle(
                              color: AppColors.secondary,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
              const SizedBox(height: 24),
              InkWell(
                onTap: () {
                  Navigator.of(context, rootNavigator: true).pushNamed(AppRoute.favs);
                },
                child: ListTile(
                  leading: const Icon(
                    Icons.favorite_border_outlined,
                    color: AppColors.iconsGreen,
                  ),
                  title: Text(
                    s.label_saved_tours,
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
              ),
              const Divider(height: 1),
              Observer(builder: (context) {
                if (_store.isLoading) {
                  return const SizedBox();
                } else {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        onTap: () => _showModal(context, aboutThisAppPopUp),
                        leading: const Icon(
                          Icons.info_outlined,
                          color: AppColors.iconsGreen,
                        ),
                        title: Text(
                          s.label_about_this_app,
                          style: const TextStyle(
                            color: AppColors.primary,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                      const Divider(height: 1),
                      ListTile(
                        onTap: () => _showModal(context, supportPopUp),
                        leading: const Icon(
                          Icons.headphones,
                          color: AppColors.iconsGreen,
                        ),
                        title: Text(
                          s.label_support,
                          style: const TextStyle(
                            color: AppColors.primary,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                      const Divider(height: 1),
                    ],
                  );
                }
              }),
              ListTile(
                onTap: _onLogout,
                leading: const Icon(
                  Icons.logout,
                  color: AppColors.iconsGreen,
                ),
                title: Text(
                  s.label_logout,
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              const Divider(height: 1),
            ],
          ),
        ),
      ),
    );
  }
}
