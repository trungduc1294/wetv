// [VN] Gói nạp coins
class CoinPackage {
  const CoinPackage({
    required this.id,
    required this.amount,
    required this.priceLabel,
    this.iconUrl = '',
  });

  final String id;
  final int amount;
  final String priceLabel;
  final String iconUrl;
}

// [VN] Thẻ VIP gift có thể chọn
class VipGiftCardOption {
  const VipGiftCardOption({
    required this.id,
    required this.title,
    required this.imageUrl,
    this.priceLabel = '',
  });

  final String id;
  final String title;
  final String imageUrl;
  final String priceLabel;
}

// [VN] Gói thời hạn VIP
class VipPackageOption {
  const VipPackageOption({
    required this.id,
    required this.label,
    required this.priceLabel,
  });

  final String id;
  final String label;
  final String priceLabel;
}
