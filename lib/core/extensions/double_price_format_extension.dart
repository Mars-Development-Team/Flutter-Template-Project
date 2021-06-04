import 'package:intl/intl.dart';

extension PriceFormating on double {
  String trTRPriceFormat() {
    final formatedPrice =
        '\₺ ' + NumberFormat('#,##0.00', 'tr_TR').format(this);
    if (this == 0) {
      return '₺0';
    }
    return formatedPrice;
  }

  String trTRPriceFormatWithoutTurkishCharacter() {
    final formatedPrice = NumberFormat('#,###.00', 'tr_TR').format(this);
    if (this == 0) {
      return '₺0';
    }
    return formatedPrice;
  }
}
