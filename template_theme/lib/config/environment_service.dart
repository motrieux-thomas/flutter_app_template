enum CompilationEnvironment { local, ci }

class EnvironmentService {
  /// Used to determine if the tests are running in the local or in the CI environment.
  static const appCompilationEnv = String.fromEnvironment(
    "APP_COMPILATION_ENV",
    defaultValue: "local",
  );
}
