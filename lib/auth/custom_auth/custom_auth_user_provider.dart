import 'package:rxdart/rxdart.dart';

import 'custom_auth_manager.dart';

class Egip20082025AuthUser {
  Egip20082025AuthUser({required this.loggedIn, this.uid});

  bool loggedIn;
  String? uid;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<Egip20082025AuthUser> egip20082025AuthUserSubject =
    BehaviorSubject.seeded(Egip20082025AuthUser(loggedIn: false));
Stream<Egip20082025AuthUser> egip20082025AuthUserStream() =>
    egip20082025AuthUserSubject
        .asBroadcastStream()
        .map((user) => currentUser = user);
