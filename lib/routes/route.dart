import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kexie_app/ui/book_borrow_system/book_borrow_page.dart';
import 'package:kexie_app/ui/detail_profile/detail_profile_page.dart';
import 'package:kexie_app/ui/login/login.dart';
import 'package:kexie_app/ui/sign_rank/sign_rank_page.dart';
import 'package:kexie_app/ui/sign_record/sign_record_page.dart';
import 'package:kexie_app/ui/sign_system/sign_page.dart';
import 'package:kexie_app/ui/sign_up/signup_page.dart';

import '../widgets/main_struct/main_struct_page.dart';

class AppRoute {
  static final GlobalKey<NavigatorState> navigatorKey =
  GlobalKey<NavigatorState>();

  static const String loginPage = "/login";
  static const String homePage = "/";
  static const String sign = "/sign";
  static const String themeMode = "/theme";
  static const String signRecord = "/sign_record";
  static const String bookBorrow = "/borrow_book";
  static const String signUp = "/sign_up";
  static const String detailProfile = '/detail_profile';
  static const String signRank = '/sign_rank';

  static List<GetPage> routes = [
    GetPage(
        name: loginPage,
        page: () => const Login(),
        transition: Transition.cupertino),
    GetPage(
        name: homePage,
        page: () => const MainStruct(),
        transition: Transition.cupertino),
    GetPage(
        name: sign,
        page: () => const SignPage(),
        transition: Transition.cupertino),
    GetPage(
        name: signRecord,
        page: () => const SignRecordPage(),
        transition: Transition.cupertino),
    GetPage(
        name: signRank,
        page: () => const SignRankPage(),
        transition: Transition.cupertino),
    GetPage(
        name: signUp,
        page: () => const SignUpPage(),
        transition: Transition.cupertino),
    GetPage(
        name: detailProfile,
        page: () => const DetailProfilePage(),
        transition: Transition.cupertino),
    GetPage(
        name: bookBorrow,
        page: () => const BookBorrowPage(),
        transition: Transition.cupertino),
    // GetPage(
    //     name: themeMode,
    //     page: () => const ThemeSelect(),
    //     transition: Transition.cupertino),
    // GetPage(
    //     name: language_select,
    //     page: () => const Language(),
    //     transition: Transition.cupertino),
    // GetPage(
    //     name: praise_author,
    //     page: () =>
    //     transition: Transition.cupertino),
    // GetPage(
    //     name: about_our_app,
    //     page: () => const Information(),
    //     transition: Transition.cupertino),
  ];
}