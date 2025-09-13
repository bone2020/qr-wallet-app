import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '/backend/backend.dart';
import 'package:stream_transform/stream_transform.dart';
import 'firebase_auth_manager.dart';

export 'firebase_auth_manager.dart';

final _authManager = FirebaseAuthManager();
FirebaseAuthManager get authManager => _authManager;

String get currentUserEmail =>
    currentUserDocument?.email ?? currentUser?.email ?? '';

String get currentUserUid => currentUser?.uid ?? '';

String get currentUserDisplayName =>
    currentUserDocument?.displayName ?? currentUser?.displayName ?? '';

String get currentUserPhoto =>
    currentUserDocument?.photoUrl ?? currentUser?.photoUrl ?? '';

String get currentPhoneNumber =>
    currentUserDocument?.phoneNumber ?? currentUser?.phoneNumber ?? '';

String get currentJwtToken => _currentJwtToken ?? '';

bool get currentUserEmailVerified => currentUser?.emailVerified ?? false;

/// Create a Stream that listens to the current user's JWT Token, since Firebase
/// generates a new token every hour.
String? _currentJwtToken;
Stream<dynamic> get jwtTokenStream => Firebase.apps.isNotEmpty
    ? FirebaseAuth.instance
        .idTokenChanges()
        .map((user) async => _currentJwtToken = await user?.getIdToken())
        .asBroadcastStream()
    : const Stream.empty().asBroadcastStream();

DocumentReference? get currentUserReference =>
    loggedIn ? UsersRecord.collection.doc(currentUser!.uid) : null;

UsersRecord? currentUserDocument;
Stream<dynamic> get authenticatedUserStream => Firebase.apps.isNotEmpty
    ? FirebaseAuth.instance
        .authStateChanges()
        .map<String>((user) => user?.uid ?? '')
        .switchMap(
          (uid) => uid.isEmpty
              ? Stream.value(null)
              : UsersRecord.getDocument(UsersRecord.collection.doc(uid))
                  .handleError((_) {}),
        )
        .map((user) {
          currentUserDocument = user;
          return currentUserDocument;
        })
        .asBroadcastStream()
    : const Stream.empty().asBroadcastStream();

class AuthUserStreamWidget extends StatelessWidget {
  const AuthUserStreamWidget({Key? key, required this.builder})
      : super(key: key);

  final WidgetBuilder builder;

  @override
  Widget build(BuildContext context) => StreamBuilder(
        stream: authenticatedUserStream,
        builder: (context, _) => builder(context),
      );
}
