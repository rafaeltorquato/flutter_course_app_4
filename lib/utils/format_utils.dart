import 'package:intl/intl.dart';

class FormatUtils {
  static final _numberFormat = NumberFormat.simpleCurrency();

  static String currency(double value) => _numberFormat.format(value);
}
