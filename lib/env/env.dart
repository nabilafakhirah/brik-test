import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: './.env', obfuscate: true, requireEnvFile: true)
abstract class Env {
  @EnviedField(varName: 'BASE_URL')
  static String baseURL = _Env.baseURL;
}
