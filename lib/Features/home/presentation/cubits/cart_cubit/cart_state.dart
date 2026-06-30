part of 'cart_cubit.dart';

abstract class CartState {}

final class CartInitial extends CartState {}
final class CartProductAdded extends CartState {}
final class CartItemRemoved extends CartState {}
final class CartItemIncresseCount extends CartState {}


