import 'package:blogapp/services/firebase/firestore_reponsitory/auth/base_auth_reponsitory.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class AuthReponsitory extends BaseAuthRepository {
  final auth.FirebaseAuth _firebaseAuth;
  AuthReponsitory({auth.FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? auth.FirebaseAuth.instance;
  @override
  Future<auth.User?> signUp(
      {required String email, required String password}) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      final user = credential.user;
      return user;
    } catch (_) {}
  }

  @override
  Stream<auth.User?> get user => _firebaseAuth.userChanges();

  @override
  Future<void> logInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (_) {}
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
