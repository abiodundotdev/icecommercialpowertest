class Env {
  String name = String.fromEnvironment("env.mode", defaultValue: "dev");
  static Env get mode => Env();
  bool get isProduction => name == EnvMode.prod.name;
  bool get isDev => name == EnvMode.dev.name;
}

enum EnvMode { prod, mock, dev, staging }
