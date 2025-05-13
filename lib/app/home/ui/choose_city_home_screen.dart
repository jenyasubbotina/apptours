import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:apptours/app/auth/repository/user_repository.dart';
import 'package:apptours/app/home/controllers/cities_controller.dart';
import 'package:apptours/app/home/controllers/places_controller.dart';
import 'package:apptours/app/home/controllers/routes_controller.dart';

import 'package:apptours/app/main/ui/apptours.dart';
import 'package:apptours/core/model/city.dart';
import 'package:apptours/core/theme/default/theme.dart';
import 'package:apptours/core/ui/blurred_container.dart';
import 'package:apptours/generated/assets/assets.gen.dart';
import 'package:apptours/generated/l10n.dart';
import 'package:apptours/main.dart';

class ChooseCityHomeScreen extends StatefulWidget {
  const ChooseCityHomeScreen({super.key});

  @override
  State<ChooseCityHomeScreen> createState() => _ChooseCityHomeScreenState();
}

class _ChooseCityHomeScreenState extends State<ChooseCityHomeScreen> {
  final _store = CitiesListStore();
  bool isExpanded = false;
  final _userRepository = di.get<UserRepository>();

  City? _selectedCity;

  @override
  void initState() {
    super.initState();
    _store.load(null).then(
          (_) => _userRepository.getCity().then((city) {
            if (city != null) {
              _selectedCity = city;
            } else {
              _selectedCity = _store.data.first;
            }
            if (_selectedCity != null) {
              _userRepository.setCity(_selectedCity!);
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                setState(() {});
              });
            }
          }),
        );
  }

  void _onCityChoosed(City city) {
    _userRepository.setCity(city);
    di.get<RoutesListStore>().load(null);
    di.get<PlacesListStore>().load(null);
    setState(() {
      _selectedCity = city;
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Stack(
      children: [
        Observer(builder: (context) {
          if (_store.isLoading || _selectedCity == null) {
            return Image.asset(
              Assets.images.tashkentBackground.path,
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              fit: BoxFit.cover,
            );
          }
          return Image.network(
            _selectedCity!.image,
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            fit: BoxFit.cover,
          );
        }),
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black.withOpacity(.74), Colors.transparent],
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 80),
                  Text(
                    s.text_welcome_to,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      color: AppColors.light,
                      fontWeight: FontWeight.w800,
                      fontSize: 48,
                    ),
                  ),
                  Observer(builder: (context) {
                    if (_store.isLoading) {
                      return const SizedBox(height: 80);
                    }
                    return FittedBox(
                      alignment: Alignment.topCenter,
                      fit: BoxFit.scaleDown,
                      child: Text(
                        _selectedCity?.name ?? s.city_tashkent,
                        textAlign: TextAlign.start,
                        softWrap: false,
                        maxLines: 2,
                        style: const TextStyle(
                          color: AppColors.light,
                          fontWeight: FontWeight.w800,
                          fontSize: 66,
                        ),
                      ),
                    );
                  }),
                  const SizedBox(height: 62),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    child: BlurredContainer(
                      height: 58,
                      width: MediaQuery.sizeOf(context).width,
                      borderRadius: 10,
                      horizontalPadding: 24,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              s.label_change_city,
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Icon(
                              isExpanded ? CupertinoIcons.chevron_down : CupertinoIcons.chevron_right,
                              color: AppColors.light,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  if (isExpanded && _store.data.isNotEmpty)
                    Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, _) => const SizedBox(height: 0),
                        itemCount: _store.data.length,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () => _onCityChoosed(_store.data[index]),
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width,
                            child: BlurredContainer(
                              height: 49,
                              width: MediaQuery.sizeOf(context).width,
                              borderRadius: index > 0 || index < _store.data.length ? 0 : 10,
                              horizontalPadding: 24,
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      _store.data[index].name,
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  const SizedBox(height: 24),
                  InkWell(
                    onTap: () {
                      if (_selectedCity != null) {
                        Navigator.pushNamed(context, AppRoute.home);
                      }
                    },
                    child: Container(
                      height: 58,
                      width: MediaQuery.sizeOf(context).width,
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      decoration: BoxDecoration(
                        gradient: AppColors.greenGradient,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            s.label_discover_tours,
                            style: const TextStyle(
                              color: AppColors.textGreen,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const Icon(
                            CupertinoIcons.arrow_right,
                            color: AppColors.textGreen,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
