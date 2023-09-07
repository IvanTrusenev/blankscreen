import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:path_provider/path_provider.dart';

class Config {
  /// Singleton ->
  static final Config _instance = Config._internal();

  Config._internal();

  factory Config() => _instance;

  /// Singleton <-

  /// Api ->
  String get apiAuthority => 'newsapi.org';

  String get apiPath => 'v2/top-headlines';

  String get apiKey => 'ee1feb3f9f4149b0aeb32ae9165a4bde';

  /// API <-

  String get documentsDirectory => _documentsDirectory;
  String _documentsDirectory = '';

  BaseDeviceInfo? _baseDeviceInfo;

  /// Emulator checker ->
  bool get isEmu {
    if (Platform.isAndroid) {
      if (!_androidIsPhysicalDev || _androidIsModelEmu || _androidIsProductEmu || _androidIsHardwareEmu || _androidIsFingerprintEmu || _androidIsManufacturerEmu || _androidIsBrandEmu || _androidIsBoardEmu || _androidIsBootloaderEmu) {
        return true;
      } else if (_androidIsGeneric) {
        return true;
      }
      return _androidIsGoogleSdk;
    } else if (Platform.isIOS) {
      return !(_baseDeviceInfo as IosDeviceInfo).isPhysicalDevice;
    }
    return false;
  }

  bool get _androidIsPhysicalDev {
    if (_baseDeviceInfo is! AndroidDeviceInfo) return false;

    return (_baseDeviceInfo as AndroidDeviceInfo).isPhysicalDevice;
  }

  bool get _androidIsModelEmu {
    if (_baseDeviceInfo is! AndroidDeviceInfo) return false;

    final String model = (_baseDeviceInfo as AndroidDeviceInfo).model.toLowerCase();

    return ['google_sdk', 'droid4x', 'emulator', 'android sdk built for x86'].where((emuModel) => model.contains(emuModel)).isNotEmpty;
  }

  bool get _androidIsProductEmu {
    if (_baseDeviceInfo is! AndroidDeviceInfo) return false;

    final String product = (_baseDeviceInfo as AndroidDeviceInfo).product.toLowerCase();

    return ['sdk', 'google_sdk', 'sdk_x86', 'vbox86p'].contains(product) || product.contains('nox');
  }

  bool get _androidIsHardwareEmu {
    if (_baseDeviceInfo is! AndroidDeviceInfo) return false;

    final String hardware = (_baseDeviceInfo as AndroidDeviceInfo).hardware.toLowerCase();

    return ['goldfish', 'vbox86'].contains(hardware) || hardware.contains('nox');
  }

  bool get _androidIsFingerprintEmu {
    if (_baseDeviceInfo is! AndroidDeviceInfo) return false;

    final String fingerprint = (_baseDeviceInfo as AndroidDeviceInfo).fingerprint.toLowerCase();

    return fingerprint.startsWith('generic');
  }

  bool get _androidIsManufacturerEmu {
    if (_baseDeviceInfo is! AndroidDeviceInfo) return false;

    final String manufacturer = (_baseDeviceInfo as AndroidDeviceInfo).manufacturer.toLowerCase();

    return manufacturer.contains('genymotion');
  }

  bool get _androidIsBrandEmu {
    if (_baseDeviceInfo is! AndroidDeviceInfo) return false;

    final String brand = (_baseDeviceInfo as AndroidDeviceInfo).brand.toLowerCase();

    return brand.contains('google');
  }

  bool get _androidIsBoardEmu {
    if (_baseDeviceInfo is! AndroidDeviceInfo) return false;

    final String board = (_baseDeviceInfo as AndroidDeviceInfo).board.toLowerCase();

    return board.contains('nox');
  }

  bool get _androidIsBootloaderEmu {
    if (_baseDeviceInfo is! AndroidDeviceInfo) return false;

    final String bootloader = (_baseDeviceInfo as AndroidDeviceInfo).bootloader.toLowerCase();

    return bootloader.contains('nox');
  }

  bool get _androidIsGeneric {
    if (_baseDeviceInfo is! AndroidDeviceInfo) return false;

    final String brand = (_baseDeviceInfo as AndroidDeviceInfo).brand.toLowerCase();
    final String device = (_baseDeviceInfo as AndroidDeviceInfo).device.toLowerCase();

    return brand.startsWith('generic') && device.startsWith('generic');
  }

  bool get _androidIsGoogleSdk {
    if (_baseDeviceInfo is! AndroidDeviceInfo) return false;

    final String product = (_baseDeviceInfo as AndroidDeviceInfo).product.toLowerCase();

    return product == 'google_sdk';
  }

  /// Emulator checker <-

  Future<void> init() async {
    _baseDeviceInfo = await _getDeviceInfo();

    final Directory documentsDirectory = await getApplicationDocumentsDirectory();
    _documentsDirectory = documentsDirectory.path;
  }

  Future<BaseDeviceInfo?> _getDeviceInfo() async {
    if (Platform.isAndroid) {
      return DeviceInfoPlugin().androidInfo;
    } else if (Platform.isIOS) {
      return DeviceInfoPlugin().iosInfo;
    }
    return null;
  }
}
