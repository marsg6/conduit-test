import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// 현재는 아무 역할도 하지 않음
abstract class RoutingInfo {
  const RoutingInfo();
}

enum CustomRoute {
  root,

  search,
  bookmarkedList,

  detail,
  ;

  String get screenName => switch (this) {
        _ => name,
      };

  String get partialPath => switch (this) {
        root => '/',
        _ => screenName,
      };

  String get deeplinkKey => switch (this) {
        _ => name,
      };

  void go<R extends RoutingInfo>(
    final BuildContext context, [
    final R? info,
  ]) =>
      context.goNamed(
        screenName,
        extra: info,
      );

  Future<T?> push<T, R extends RoutingInfo>(
    final BuildContext context, [
    final R? info,
  ]) =>
      context.pushNamed<T>(
        screenName,
        extra: info,
      );

  void pushReplacement<R extends RoutingInfo>(
    final BuildContext context, [
    final R? info,
  ]) =>
      context.pushReplacementNamed(
        screenName,
        extra: info,
      );

  RoutingInfo? makeRoutingInfo(final Map<String, dynamic> json) {
    return switch (this) {
      _ => null,
    };
  }
}
