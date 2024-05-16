// lib/core/localization/app_localizations.dart
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AppLocalizations extends Translations {
  Map<String, Map<String, String>> _localizedValues = {};

  AppLocalizations() {
    load();
  }

  Future<void> load() async {
    final enJson = await rootBundle.loadString('lib/core/localization/en.json');
    final esJson = await rootBundle.loadString('lib/core/localization/es.json');

    _localizedValues['en'] = Map<String, String>.from(json.decode(enJson));
    _localizedValues['es'] = Map<String, String>.from(json.decode(esJson));
  }

  @override
  Map<String, Map<String, String>> get keys => _localizedValues;
}
