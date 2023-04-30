import 'package:app_template/bootstrap.dart';

import 'src/config/environment_service.dart';

void main() async {
  final environment = () {
    switch (EnvironmentService.appEnv) {
      case "prod":
        return Environment.prod;
      case "dev":
        return Environment.dev;
      default:
        return Environment.dev;
    }
  }();

  bootstrap(environment: environment);
}
