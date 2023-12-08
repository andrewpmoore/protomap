import 'package:envied/envied.dart';

part 'env.g.dart';


///flutter clean
///flutter pub get
///flutter packages pub run build_runner build --delete-conflicting-outputs

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'WEATHERKIT_KEY', obfuscate: true)
  static final weatherKitApiKey = _Env.weatherKitApiKey;

  @EnviedField(varName: 'WEATHERKIT_SERVICE_ID', obfuscate: true)
  static final weatherKitServiceId = _Env.weatherKitServiceId;

  @EnviedField(varName: 'WEATHERKIT_TEAM_ID', obfuscate: true)
  static final weatherKitTeamId = _Env.weatherKitTeamId;

  @EnviedField(varName: 'WEATHERKIT_KEY_ID', obfuscate: true)
  static final weatherKitKeyId = _Env.weatherKitKeyId;

  @EnviedField(varName: 'WEATHERAPI_KEY', obfuscate: true)
  static final weatherApiKey = _Env.weatherKitKeyId;
}