import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {

  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthAuthenticated extends AuthState{}
class AuthUnAuthenticated extends AuthState{}

class AuthLoading extends AuthState{}