enum CreditCardNetworkEnum {
  visa,
  mastercard,
  amex,
  discover,
  unionpay,
  jcb,
  dinersClub,
  rupay,
  mir
}

extension CreditCardNetworkExtension on CreditCardNetworkEnum {
  String get label {
    switch (this) {
      case CreditCardNetworkEnum.visa:
        return 'Visa';
      case CreditCardNetworkEnum.mastercard:
        return 'Mastercard';
      case CreditCardNetworkEnum.amex:
        return 'American Express';
      case CreditCardNetworkEnum.discover:
        return 'Discover';
      case CreditCardNetworkEnum.unionpay:
        return 'UnionPay';
      case CreditCardNetworkEnum.jcb:
        return 'JCB';
      case CreditCardNetworkEnum.dinersClub:
        return 'Diners Club';
      case CreditCardNetworkEnum.rupay:
        return 'RuPay';
      case CreditCardNetworkEnum.mir:
        return 'Mir';
    }
  }

  String get assetPath {
    return 'assets/png/${name.toLowerCase()}.png';
  }
}