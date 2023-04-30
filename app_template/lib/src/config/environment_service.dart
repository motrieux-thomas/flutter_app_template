enum Environment { dev, prod, test }

enum CompilationEnvironment { local, ci }

class EnvironmentService {
  static const appEnv = String.fromEnvironment(
    "APP_ENV",
    defaultValue: "dev",
  );

  /// Used to determine if the tests are running in the local or in the CI environment.
  static const appCompilationEnv = String.fromEnvironment(
    "APP_COMPILATION_ENV",
    defaultValue: "local",
  );

  static const appDefaultApiUrlEnv = String.fromEnvironment(
    "APP_DEFAULT_API_URL_ENV",
    defaultValue: "",
  );
}
