import 'package:intl/intl.dart';

extension NumberFormatExtension on num {
  /// Format number as currency (e.g., ₱1,234.56)
  String toCurrency({String locale = 'en_PH', String symbol = '₱'}) {
    return NumberFormat.currency(locale: locale, symbol: symbol).format(this);
  }

  /// Format number with comma separators (e.g., 1,234,567)
  String toFormattedString({String locale = 'en_US'}) {
    return NumberFormat.decimalPattern(locale).format(this);
  }

  /// Round and format with 2 decimal places (no symbol)
  String toFixed({int fractionDigits = 2}) {
    return toStringAsFixed(fractionDigits);
  }
}