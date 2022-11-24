import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthProvider extends ChangeNotifier {
  bool loading = false;
  final db = FirebaseDatabase.instance;
  Future<bool> login({required String email, required String password}) async {
    try {
      final response = await db.ref('/').child('admins').get();
      final data = (response.value as Map).values.first;
      final isEmailMatched = email == data['email'];
      final isPasswordMatched = password == data['password'];
      if (isEmailMatched && isPasswordMatched) {
        return true;
      } else {
        throw 'Invalid Crediential';
      }
    } catch (e) {
      throw 'Invalid Crediential';
    }
  }
}

final authProvider =
    ChangeNotifierProvider<AuthProvider>((ref) => AuthProvider());
