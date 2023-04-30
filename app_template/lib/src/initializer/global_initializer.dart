import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_template/src/domains/authentication/view/logged_in_initializer.dart';
import 'package:app_template/src/domains/cheat_code/logic/cheat_code_initializer.dart';
import 'package:app_template/src/services/local_repo/local_repo_initializer.dart';

class GlobalInitializer extends ConsumerStatefulWidget {
  const GlobalInitializer({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _GlobalInitializerState();
  }
}

class _GlobalInitializerState extends ConsumerState<GlobalInitializer> {
  @override
  // Note : The order of the initializers is important.
  Widget build(BuildContext context) {
    // The cheat code initializer is only used in a dev environment.
    // His goal is to help the dev to override app parameters.
    // This widget will be ignored in production.
    return CheatCodeInitializer(
      child: LocalRepoInitializer(
        child: LoggedInInitializer(
          child: widget.child,
        ),
      ),
    );
  }
}
