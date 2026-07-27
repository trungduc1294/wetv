import 'package:get/route_manager.dart';
import 'package:wetv/app/routes/app_routes.dart';
import 'package:wetv/app/modules/home/home_view.dart';
import 'package:wetv/app/modules/home/home_binding.dart';
import 'package:wetv/app/modules/movie_detail/movie_detail_view.dart';
import 'package:wetv/app/modules/movie_detail/movie_detail_binding.dart';
import 'package:wetv/app/modules/coins/coins_view.dart';
import 'package:wetv/app/modules/coins/coins_binding.dart';
import 'package:wetv/app/modules/vip_gift/vip_gift_card_view.dart';
import 'package:wetv/app/modules/vip_gift/vip_gift_card_binding.dart';

class AppPages {
  static const INITIAL = AppRoutes.HOME;

  static void register() {
    Get.clearRouteTree();
    Get.addPages(routes);
  }

  static final routes = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.MOVIE_DETAIL,
      page: () => const MovieDetailView(),
      binding: MovieDetailBinding(),
    ),
    GetPage(
      name: AppRoutes.COINS,
      page: () => const CoinsView(),
      binding: CoinsBinding(),
    ),
    GetPage(
      name: AppRoutes.VIP_GIFT,
      page: () => const VipGiftCardView(),
      binding: VipGiftCardBinding(),
    ),
  ];
}
