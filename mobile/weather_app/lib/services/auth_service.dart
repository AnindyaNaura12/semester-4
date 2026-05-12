import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;

  // Stream untuk listen perubahan status login
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Register dengan email & password
  Future<String?> register(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      notifyListeners();
      return null; // null = sukses
    } on FirebaseAuthException catch (e) {
      return _handleAuthError(e.code);
    }
  }

  // Login dengan email & password
  Future<String?> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      notifyListeners();
      return null;
    } on FirebaseAuthException catch (e) {
      return _handleAuthError(e.code);
    }
  }

  // Logout
  Future<void> logout() async {
    await _auth.signOut();
    notifyListeners();
  }

  // Terjemahkan kode error Firebase ke pesan Indonesia
  String _handleAuthError(String code) {
    switch (code) {
      case 'email-already-in-use':
        return 'Email sudah terdaftar.';
      case 'invalid-email':
        return 'Format email tidak valid.';
      case 'weak-password':
        return 'Password minimal 6 karakter.';
      case 'user-not-found':
        return 'Akun tidak ditemukan.';
      case 'wrong-password':
        return 'Password salah.';
      case 'invalid-credential':
        return 'Email atau password salah.';
      default:
        return 'Terjadi kesalahan. Coba lagi.';
    }
  }
}