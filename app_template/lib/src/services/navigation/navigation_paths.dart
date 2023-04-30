import 'package:equatable/equatable.dart';

class AppPath extends Equatable {
  const AppPath({
    required this.path,
    required this.location,
    required this.name,
  });

  final String path;
  final String name;
  final String location;

  @override
  List<Object?> get props => [path, name, location];
}

class Paths extends Equatable {
  static const initial = "/";

  static const login = AppPath(
    name: "login",
    path: "/login",
    location: "/login",
  );

  static const homepage = AppPath(
    name: "homepage",
    path: "/homepage",
    location: "/homepage",
  );

  static const cheatCode = AppPath(
    name: "cheat_code",
    path: "/cheat_code",
    location: "/cheat_code",
  );

  @override
  List<Object?> get props => [initial, homepage];
}
