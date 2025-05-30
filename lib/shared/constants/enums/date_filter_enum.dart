enum DateFilterEnum {
  thisMonth,
  lastMonth,
  customDate
}

extension DateFilterEnumX on DateFilterEnum {

  String get label {

    switch (this) {
      case DateFilterEnum.thisMonth:
        return "thisMonth";
      case DateFilterEnum.lastMonth:
        return "lastMonth";
      case DateFilterEnum.customDate:
        return "customDate";
    }
  }
}