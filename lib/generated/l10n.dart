// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Apptours App`
  String get app_title {
    return Intl.message(
      'AppTours',
      name: 'app_title',
      desc: '',
      args: [],
    );
  }

  /// `Ташкент`
  String get city_tashkent {
    return Intl.message(
      'Ташкент',
      name: 'city_tashkent',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get action_ok {
    return Intl.message(
      'OK',
      name: 'action_ok',
      desc: '',
      args: [],
    );
  }

  /// `Да`
  String get label_yes {
    return Intl.message(
      'Да',
      name: 'label_yes',
      desc: '',
      args: [],
    );
  }

  /// `Нет`
  String get label_no {
    return Intl.message(
      'Нет',
      name: 'label_no',
      desc: '',
      args: [],
    );
  }

  /// `Ошибка`
  String get label_error {
    return Intl.message(
      'Ошибка',
      name: 'label_error',
      desc: '',
      args: [],
    );
  }

  /// `Настройки`
  String get label_settings {
    return Intl.message(
      'Настройки',
      name: 'label_settings',
      desc: '',
      args: [],
    );
  }

  /// `Главная`
  String get label_home {
    return Intl.message(
      'Главная',
      name: 'label_home',
      desc: '',
      args: [],
    );
  }

  /// `Места`
  String get label_places {
    return Intl.message(
      'Места',
      name: 'label_places',
      desc: '',
      args: [],
    );
  }

  /// `Профиль`
  String get label_profile {
    return Intl.message(
      'Профиль',
      name: 'label_profile',
      desc: '',
      args: [],
    );
  }

  /// `Мой профиль`
  String get label_my_profile {
    return Intl.message(
      'Мой профиль',
      name: 'label_my_profile',
      desc: '',
      args: [],
    );
  }

  /// `Маршруты`
  String get label_tours {
    return Intl.message(
      'Маршруты',
      name: 'label_tours',
      desc: '',
      args: [],
    );
  }

  /// `Маршрут`
  String get label_tour {
    return Intl.message(
      'Маршрут',
      name: 'label_tour',
      desc: '',
      args: [],
    );
  }

  /// `Изменить город`
  String get label_change_city {
    return Intl.message(
      'Изменить город',
      name: 'label_change_city',
      desc: '',
      args: [],
    );
  }

  /// `Исследовать маршруты`
  String get label_discover_tours {
    return Intl.message(
      'Исследовать маршруты',
      name: 'label_discover_tours',
      desc: '',
      args: [],
    );
  }

  /// `Лучшие маршруты`
  String get label_best_tours {
    return Intl.message(
      'Лучшие маршруты',
      name: 'label_best_tours',
      desc: '',
      args: [],
    );
  }

  /// `Сохраненные маршруты`
  String get label_saved_tours {
    return Intl.message(
      'Сохраненные маршруты',
      name: 'label_saved_tours',
      desc: '',
      args: [],
    );
  }

  /// `Начать маршрут`
  String get label_start_this_tour {
    return Intl.message(
      'Начать маршрут',
      name: 'label_start_this_tour',
      desc: '',
      args: [],
    );
  }

  /// `Места на этом маршруте`
  String get label_places_in_this_tour {
    return Intl.message(
      'Места на этом маршруте',
      name: 'label_places_in_this_tour',
      desc: '',
      args: [],
    );
  }

  /// `Назад к маршруту`
  String get label_back_to_tour {
    return Intl.message(
      'Назад к маршруту',
      name: 'label_back_to_tour',
      desc: '',
      args: [],
    );
  }

  /// `Маршруты с этим местом`
  String get label_tours_including_this_place {
    return Intl.message(
      'Маршруты с этим местом',
      name: 'label_tours_including_this_place',
      desc: '',
      args: [],
    );
  }

  /// `Очень легкий`
  String get label_very_easy {
    return Intl.message(
      'Очень легкий',
      name: 'label_very_easy',
      desc: '',
      args: [],
    );
  }

  /// `Легкий`
  String get label_easy {
    return Intl.message(
      'Легкий',
      name: 'label_easy',
      desc: '',
      args: [],
    );
  }

  /// `Средний`
  String get label_medium {
    return Intl.message(
      'Средний',
      name: 'label_medium',
      desc: '',
      args: [],
    );
  }

  /// `Сложный`
  String get label_hard {
    return Intl.message(
      'Сложный',
      name: 'label_hard',
      desc: '',
      args: [],
    );
  }

  /// `Очень сложный`
  String get label_very_hard {
    return Intl.message(
      'Очень сложный',
      name: 'label_very_hard',
      desc: '',
      args: [],
    );
  }

  /// `Экстремальный`
  String get label_extreme {
    return Intl.message(
      'Экстремальный',
      name: 'label_extreme',
      desc: '',
      args: [],
    );
  }

  /// `Локация`
  String get label_location {
    return Intl.message(
      'Локация',
      name: 'label_location',
      desc: '',
      args: [],
    );
  }

  /// `из {value} пройдено`
  String label_of_completed(Object value) {
    return Intl.message(
      'из $value пройдено',
      name: 'label_of_completed',
      desc: '',
      args: [value],
    );
  }

  /// `{value} мин`
  String label_mins(Object value) {
    return Intl.message(
      '$value мин',
      name: 'label_mins',
      desc: '',
      args: [value],
    );
  }

  /// `до финиша`
  String get label_to_finish {
    return Intl.message(
      'до финиша',
      name: 'label_to_finish',
      desc: '',
      args: [],
    );
  }

  /// `Sights`
  String get label_sights {
    return Intl.message(
      'Sights',
      name: 'label_sights',
      desc: '',
      args: [],
    );
  }

  /// `Arts & Crafts`
  String get label_arts_and_crafts {
    return Intl.message(
      'Arts & Crafts',
      name: 'label_arts_and_crafts',
      desc: '',
      args: [],
    );
  }

  /// `Coffeeshops`
  String get label_coffeeshops {
    return Intl.message(
      'Coffeeshops',
      name: 'label_coffeeshops',
      desc: '',
      args: [],
    );
  }

  /// `Аудиогид`
  String get label_audioguide {
    return Intl.message(
      'Аудиогид',
      name: 'label_audioguide',
      desc: '',
      args: [],
    );
  }

  /// `Поддержка`
  String get label_support {
    return Intl.message(
      'Поддержка',
      name: 'label_support',
      desc: '',
      args: [],
    );
  }

  /// `Поддержка`
  String get label_about_this_app {
    return Intl.message(
      'Поддержка',
      name: 'label_about_this_app',
      desc: '',
      args: [],
    );
  }

  /// `Выйти`
  String get label_logout {
    return Intl.message(
      'Выйти',
      name: 'label_logout',
      desc: '',
      args: [],
    );
  }

  /// `Пароль`
  String get label_password {
    return Intl.message(
      'Пароль',
      name: 'label_password',
      desc: '',
      args: [],
    );
  }

  /// `Войти`
  String get label_sign_in {
    return Intl.message(
      'Войти',
      name: 'label_sign_in',
      desc: '',
      args: [],
    );
  }

  /// `Имя`
  String get label_fullname {
    return Intl.message(
      'Имя',
      name: 'label_fullname',
      desc: '',
      args: [],
    );
  }

  /// `Создать аккаунт`
  String get label_create_an_account {
    return Intl.message(
      'Создать аккаунт',
      name: 'label_create_an_account',
      desc: '',
      args: [],
    );
  }

  /// `Избранное`
  String get label_favorites {
    return Intl.message(
      'Избранное',
      name: 'label_favorites',
      desc: '',
      args: [],
    );
  }

  /// `Свяжитесь с нами`
  String get label_contact_us {
    return Intl.message(
      'Свяжитесь с нами',
      name: 'label_contact_us',
      desc: '',
      args: [],
    );
  }

  /// `Обратная связь`
  String get label_feedback {
    return Intl.message(
      'Обратная связь',
      name: 'label_feedback',
      desc: '',
      args: [],
    );
  }

  /// `Написать`
  String get label_text_us {
    return Intl.message(
      'Написать',
      name: 'label_text_us',
      desc: '',
      args: [],
    );
  }

  /// `Позвонить`
  String get label_call_us {
    return Intl.message(
      'Позвонить',
      name: 'label_call_us',
      desc: '',
      args: [],
    );
  }

  /// `Здесь ничего нет`
  String get text_empty {
    return Intl.message(
      'Здесь ничего нет',
      name: 'text_empty',
      desc: '',
      args: [],
    );
  }

  /// `Добро пожаловать в`
  String get text_welcome_to {
    return Intl.message(
      'Добро пожаловать в',
      name: 'text_welcome_to',
      desc: '',
      args: [],
    );
  }

  /// `Войдите в свою учетную запись, чтобы продолжить:`
  String get text_sign_in_to_proceed {
    return Intl.message(
      'Войдите в свою учетную запись, чтобы продолжить:',
      name: 'text_sign_in_to_proceed',
      desc: '',
      args: [],
    );
  }

  /// `Создайте учетную запись, чтобы продолжить:`
  String get text_create_account_to_proceed {
    return Intl.message(
      'Создайте учетную запись, чтобы продолжить:',
      name: 'text_create_account_to_proceed',
      desc: '',
      args: [],
    );
  }

  /// `Еще не зарегистрированы?`
  String get text_dont_have_an_account_yet {
    return Intl.message(
      'Еще не зарегистрированы?',
      name: 'text_dont_have_an_account_yet',
      desc: '',
      args: [],
    );
  }

  /// `Уже зарегистрированы?`
  String get text_already_have_an_account {
    return Intl.message(
      'Уже зарегистрированы?',
      name: 'text_already_have_an_account',
      desc: '',
      args: [],
    );
  }

  /// `{value} Ч`
  String text_hrs(Object value) {
    return Intl.message(
      '$value Ч',
      name: 'text_hrs',
      desc: '',
      args: [value],
    );
  }

  /// `{value} КМ`
  String text_km(Object value) {
    return Intl.message(
      '$value КМ',
      name: 'text_km',
      desc: '',
      args: [value],
    );
  }

  /// `В текст`
  String get text_in_text {
    return Intl.message(
      'В текст',
      name: 'text_in_text',
      desc: '',
      args: [],
    );
  }

  /// `Acceptance middletons me if discretion boisterous travelling an. She prosperous son. Acceptance middletons me if discretion boisterous travelling an. She prosperous son.`
  String get text_about_this_app_description {
    return Intl.message(
      'Acceptance middletons me if discretion boisterous travelling an. She prosperous son. Acceptance middletons me if discretion boisterous travelling an. She prosperous son.',
      name: 'text_about_this_app_description',
      desc: '',
      args: [],
    );
  }

  /// `Acceptance middletons me if discretion boisterous travelling an. She prosperous son. Acceptance middletons me if discretion boisterous travelling an. She prosperous son.`
  String get text_support_description {
    return Intl.message(
      'Acceptance middletons me if discretion boisterous travelling an. She prosperous son. Acceptance middletons me if discretion boisterous travelling an. She prosperous son.',
      name: 'text_support_description',
      desc: '',
      args: [],
    );
  }

  /// `Не найдено`
  String get error_not_found {
    return Intl.message(
      'Не найдено',
      name: 'error_not_found',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
