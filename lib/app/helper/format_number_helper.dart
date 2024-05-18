
import 'package:intl/intl.dart';

class FormatNumber {
  static String convertToComa(dynamic number, int decimalDigit) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: '',
      decimalDigits: decimalDigit,
    );
    return currencyFormatter.format(number ?? 0);
  }
}

extension FormatNumberExt on num{
  String get toUomKwp {
    var gigaValue = 1000000000;
    var megaValue = 1000000;
    var kiloValue = 1000;

    var formatter = this >= gigaValue
        ? 'TWp' : this >= megaValue
        ? 'GWp' : this >= kiloValue
        ? 'MWp' : 'kWp';

    return formatter;
  }

  String get toUomKwh {
    var gigaValue = 1000000000;
    var megaValue = 1000000;
    var kiloValue = 1000;

    var formatter = this >= gigaValue
        ? 'TWh' : this >= megaValue
        ? 'GWh' : this >= kiloValue
        ? 'MWh' : 'kWh';

    return formatter;
  }

  String get toUomA {
    var gigaValue = 1000000000;
    var megaValue = 1000000;
    var kiloValue = 1000;

    var formatter = this >= gigaValue
        ? 'GA' : this >= megaValue
        ? 'MA' : this >= kiloValue
        ? 'kA' : 'A';

    return formatter;
  }

  String get toUomV {
    var gigaValue = 1000000000;
    var megaValue = 1000000;
    var kiloValue = 1000;

    var formatter = this >= gigaValue
        ? 'GV' : this >= megaValue
        ? 'MV' : this >= kiloValue
        ? 'kV' : 'V';

    return formatter;
  }

  String get toUomW {
    var gigaValue = 1000000000;
    var megaValue = 1000000;
    var kiloValue = 1000;

    var formatter = this >= gigaValue
        ? 'TW' : this >= megaValue
        ? 'GW' : this >= kiloValue
        ? 'MW' : 'kW';

    return formatter;
  }

  String get toKwp {
    var gigaValue = 1000000000;
    var megaValue = 1000000;
    var kiloValue = 1000;

    var formatter = this >= gigaValue
        ? "${FormatNumber.convertToComa(this / gigaValue, this / gigaValue < 10 ? 2 : this / gigaValue < 100 ? 1 : 0)} TWp"
        : this >= megaValue
        ? "${FormatNumber.convertToComa(this / megaValue, this / megaValue < 10 ? 2 : this / megaValue < 100 ? 1 : 0)} GWp"
        : this >= kiloValue
        ? "${FormatNumber.convertToComa(this / kiloValue, this / kiloValue < 10 ? 2 : this / kiloValue < 100 ? 1 : 0)} MWp"
        : "${FormatNumber.convertToComa(this, this < 10 ? 2 : this < 100 ? 1 : 0)} kWp";
    return formatter;
  }

  String get toKwh {
    var gigaValue = 1000000000;
    var megaValue = 1000000;
    var kiloValue = 1000;

    var formatter = this >= gigaValue
        ? "${FormatNumber.convertToComa(this / gigaValue, this / gigaValue < 10 ? 2 : this / gigaValue < 100 ? 1 : 0)} TWh"
        : this >= megaValue
        ? "${FormatNumber.convertToComa(this / megaValue, this / megaValue < 10 ? 2 : this / megaValue < 100 ? 1 : 0)} GWh"
        : this >= kiloValue
        ? "${FormatNumber.convertToComa(this / kiloValue, this / kiloValue < 10 ? 2 : this / kiloValue < 100 ? 1 : 0)} MWh"
        : "${FormatNumber.convertToComa(this, this < 10 ? 2 : this < 100 ? 1 : 0)} kWh";
    return formatter;
  }

  String get tomA {
    var gigaValue = 1000000000;
    var megaValue = 1000000;
    var kiloValue = 1000;

    var formatter = this >= gigaValue
        ? "${FormatNumber.convertToComa(this / gigaValue, this / gigaValue < 10 ? 2 : this / gigaValue < 100 ? 1 : 0)} TA"
        : this >= megaValue
        ? "${FormatNumber.convertToComa(this / megaValue, this / megaValue < 10 ? 2 : this / megaValue < 100 ? 1 : 0)} GA"
        : this >= kiloValue
        ? "${FormatNumber.convertToComa(this / kiloValue, this / kiloValue < 10 ? 2 : this / kiloValue < 100 ? 1 : 0)} MA"
        : "${FormatNumber.convertToComa(this, this < 10 ? 2 : this < 100 ? 1 : 0)} kA";
    return formatter;
  }

  String get toGMK {
    var gigaValue = 1000000000;
    var megaValue = 1000000;
    var kiloValue = 1000;

    var formatter = this >= gigaValue
        ? FormatNumber.convertToComa(this / gigaValue, this / gigaValue < 10 ? 2 : this / gigaValue < 100 ? 1 : 0)
        : this >= megaValue
        ? FormatNumber.convertToComa(this / megaValue, this / megaValue < 10 ? 2 : this / megaValue < 100 ? 1 : 0)
        : this >= kiloValue
        ? FormatNumber.convertToComa(this / kiloValue, this / kiloValue < 10 ? 2 : this / kiloValue < 100 ? 1 : 0)
        : FormatNumber.convertToComa(this,this == 0 ? 0 : this < 10 ? 2 : this < 100 ? 1 : 0);
    return formatter;
  }
}


