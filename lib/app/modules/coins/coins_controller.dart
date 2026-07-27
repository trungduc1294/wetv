import 'package:get/get.dart';
import 'package:wetv/app/data/models/movie_model.dart';
import 'package:wetv/app/data/models/wallet_models.dart';

// [VN] Controller màn Coins của tôi
class CoinsController extends GetxController {
  final balance = 0.obs;
  final packages = <CoinPackage>[].obs;
  final watchMovies = <MovieModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadSample();
  }

  void _loadSample() {
    packages.assignAll(const [
      CoinPackage(id: '1', amount: 25, priceLabel: '8000đ'),
      CoinPackage(id: '2', amount: 99, priceLabel: '19000đ'),
      CoinPackage(id: '3', amount: 299, priceLabel: '49000đ'),
      CoinPackage(id: '4', amount: 699, priceLabel: '99000đ'),
      CoinPackage(id: '5', amount: 1099, priceLabel: '149000đ'),
      CoinPackage(id: '6', amount: 1599, priceLabel: '199000đ'),
      CoinPackage(id: '7', amount: 4199, priceLabel: '499000đ'),
      CoinPackage(id: '8', amount: 9999, priceLabel: '999000đ'),
      CoinPackage(id: '9', amount: 29999, priceLabel: '2499000đ'),
    ]);

    const poster =
        'https://vcover-vt-pic.wetvinfo.com/vcover_vt_pic/0/cuawe92xrqw8ll61730713408215_09TXvl25/350';
    watchMovies.assignAll([
      MovieModel(id: '1', posterUrl: poster, movieName: 'Bách Hoa Sát'),
      MovieModel(id: '2', posterUrl: poster, movieName: 'Mạc Ly'),
      MovieModel(id: '3', posterUrl: poster, movieName: 'Trục Ngọc'),
    ]);
  }

  void onBack() => Get.back();

  void onLoginTap() {}

  void onWhatAreCoins() {}

  void onTermsTap() {}

  void onBuyPackage(CoinPackage package) {}

  void onMovieTap(MovieModel movie) {}
}
