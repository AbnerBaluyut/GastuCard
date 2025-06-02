import 'package:gastu_card/core/utils/extensions/null_ext.dart';
import 'package:gastu_card/core/utils/extensions/nullable_string_ext.dart';
import 'package:intl/intl.dart';

import '../../../shared/constants/enums/credit_card_network_enum.dart';

extension StringExtension on String {

  DateTime toDate(String pattern) {
    return DateFormat(pattern).parse(this);
  }

  String? get capitalizeFirst {
    var s = this;
    if (isNull) return null;
    if (isBlank) return s;
    return s[0].toUpperCase() + s.substring(1).toLowerCase();
  }

  String? get capitalize {
    var value = this;
    if (isNull) return null;
    if (isBlank) return value;
    return value.split(' ').map((e) => e.capitalizeFirst).join(' ');
  }

  CreditCardNetworkEnum? get toCreditCardNetwork {
    switch (this) {
      case 'Visa':
        return CreditCardNetworkEnum.visa;
      case 'Mastercard':
        return CreditCardNetworkEnum.mastercard;
      case 'American Express':
        return CreditCardNetworkEnum.amex;
      case 'Discover':
        return CreditCardNetworkEnum.discover;
      case 'UnionPay':
        return CreditCardNetworkEnum.unionpay;
      case 'JCB':
        return CreditCardNetworkEnum.jcb;
      case 'Diners Club':
        return CreditCardNetworkEnum.dinersClub;
      case 'RuPay':
        return CreditCardNetworkEnum.rupay;
      case 'Mir':
        return CreditCardNetworkEnum.mir;
      default:
        return null;
    }
  }
}