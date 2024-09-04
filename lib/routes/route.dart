import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kexie_app/ui/about_app/about_app_page.dart';
import 'package:kexie_app/ui/book_borrow_system/book_borrow_main_page/book_display_page.dart';
import 'package:kexie_app/ui/detail_profile/detail_profile_page.dart';
import 'package:kexie_app/ui/forum/forum_page.dart';
import 'package:kexie_app/ui/forum/post_detail_page.dart';
import 'package:kexie_app/ui/forum/send_post_page.dart';
import 'package:kexie_app/ui/kexie_members/kexie_members_page.dart';
import 'package:kexie_app/ui/login/login.dart';
import 'package:kexie_app/ui/recruit/recruit_page.dart';
import 'package:kexie_app/ui/school_map/school_map.dart';
import 'package:kexie_app/ui/sign_rank/sign_rank_page.dart';
import 'package:kexie_app/ui/sign_record/sign_record_page.dart';
import 'package:kexie_app/ui/sign_system/sign_page.dart';

import '../ui/book_borrow_system/book_borrow_record/book_borrow_record_page.dart';
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
  static const String recruit = "/recruit";
  static const String detailProfile = '/detail_profile';
  static const String signRank = '/sign_rank';
  static const String kexieMembers = '/kexie_members';
  static const String schoolMap = '/school_map';
  static const String bookBorrowRecord = '/book_borrow_record';
  static const String aboutApp = '/about_app';
  static const String detailPost = '/detail_post';
  static const String sendPostPage = '/send_post';

  static List<GetPage> routes = [
    GetPage(
        name: loginPage,
        page: () => const LoginPage(),
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
        name: recruit,
        page: () => const RecruitPage(),
        transition: Transition.cupertino),
    GetPage(
        name: detailProfile,
        page: () => const DetailProfilePage(),
        transition: Transition.cupertino),
    GetPage(
        name: bookBorrow,
        page: () => const BookBorrowPage(),
        transition: Transition.cupertino),
    GetPage(
        name: schoolMap,
        page: () => const SchoolMap(),
        transition: Transition.cupertino),
    GetPage(
        name: kexieMembers,
        page: () => const KexieMembersPage(),
        transition: Transition.cupertino),
    GetPage(
        name: bookBorrowRecord,
        page: () => const BookBorrowRecordPage(),
        transition: Transition.cupertino),
    GetPage(
        name: sendPostPage,
        page: () => const SendPostPage(),
        transition: Transition.cupertino),
    GetPage(
        name: detailPost,
        page: () => PostDetailPage(args: Get.arguments),
        transition: Transition.cupertino),
    GetPage(
        name: aboutApp,
        page: () => const AboutAppPage(),
        transition: Transition.cupertino),
  ];
}