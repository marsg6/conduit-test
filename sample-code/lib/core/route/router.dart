import 'package:assignment/core/route/route.dart';
import 'package:assignment/feature/ui/bookmarked_list_page.dart';
import 'package:assignment/feature/ui/detail_page.dart';
import 'package:assignment/feature/ui/main_shell_page.dart';
import 'package:assignment/feature/ui/search_page.dart';
import 'package:carbonic_utility/carbonic_utility.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

@riverpod
GoRouter router(RouterRef ref) {
  return GoRouter(
    debugLogDiagnostics: kDebugMode,
    navigatorKey: _rootNavigatorKey,
    initialLocation: CustomRoute.root.partialPath,
    routes: [
      _makeRoute(
        route: CustomRoute.root,
        redirect: (context, state, queryParameters) {
          if (state.topRoute?.name == CustomRoute.root.screenName) {
            return CustomRoute.search;
          }
          return null;
        },
        otherRoutes: [
          StatefulShellRoute.indexedStack(
            builder: (context, state, navigationShell) {
              return MainShellPage(
                navigationShell: navigationShell,
              );
            },
            branches: [
              StatefulShellBranch(
                routes: [
                  _makeRoute(
                    route: CustomRoute.search,
                    builder: (context, state, queryParameters) =>
                        const SearchPage(),
                    routes: [
                      _makeRoute<DetailPageRoutingInfo>(
                        parentNavigatorKey: _rootNavigatorKey,
                        route: CustomRoute.detail,
                        redirect: (context, state, info) {
                          if (info == null) {
                            return CustomRoute.search;
                          }
                          return null;
                        },
                        builder: (context, state, info) => DetailPage(
                          info!,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: [
                  _makeRoute(
                    route: CustomRoute.bookmarkedList,
                    builder: (context, state, info) =>
                        const BookmarkedListPage(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

/// [otherRoutes]는 GoRoute 외의 RouteBase의 추가가 필요한 경우에만 제한적으로 사용한다. 컴파일 타임에 하위 RoutingInfo에 제약을 걸 수 없음을 주의한다.
/// [routes] 뒤에 추가되는 것에 유의한다.
CustomGoRoute<R> _makeRoute<R extends RoutingInfo>({
  required final CustomRoute route,
  final GlobalKey<NavigatorState>? parentNavigatorKey,
  final FutureOr<bool> Function(
    BuildContext context,
  )? onExit,
  final FutureOr<CustomRoute?> Function(
    BuildContext context,
    GoRouterState state,
    R? queryParameters,
  )? redirect,
  final List<CustomGoRoute<R>>? routes,
  final List<RouteBase>? otherRoutes,
  final Widget Function(
    BuildContext context,
    GoRouterState state,
    R? queryParameters,
  )? builder,
  final Page<dynamic> Function(
    BuildContext context,
    GoRouterState state,
    R? queryParameters,
  )? pageBuilder,
}) =>
    CustomGoRoute<R>(
      name: route.screenName,
      path: route.partialPath,
      parentNavigatorKey: parentNavigatorKey,
      onExit: onExit,
      routes: [
        if (routes != null) ...routes,
        if (otherRoutes != null) ...otherRoutes,
      ],
      redirect: (context, state) async {
        if (redirect == null) {
          return null;
        }

        final redirectedRoute = await redirect(
          context,
          state,
          cast<R>(state.extra),
        );
        if (redirectedRoute == null) {
          return null;
        }

        if (!context.mounted) {
          return null;
        }

        return state.namedLocation(redirectedRoute.screenName);
      },
      pageBuilder: builder == null && pageBuilder == null
          ? null
          : (context, state) {
              return builder != null
                  ? MaterialPage(
                      child: builder(
                        context,
                        state,
                        cast<R>(state.extra),
                      ),
                    )
                  : pageBuilder!(
                      context,
                      state,
                      cast<R>(state.extra),
                    );
            },
    );

/// 내부 Route 생성 규칙을 컴파일 타임에 제약하기 위한 도구. 런타임에 [R]이 수행하는 역할은 없다.
/// [GoRoute]의 시그니처가 변경되면 함께 변경되어야 한다.
/// 필요한 기능이 있다면 추가 혹은 변경할 것.

class CustomGoRoute<R extends RoutingInfo> extends GoRoute {
  CustomGoRoute({
    required super.path,
    super.name,
    super.builder,
    super.pageBuilder,
    super.parentNavigatorKey,
    super.redirect,
    super.onExit,
    super.routes = const <RouteBase>[],
  });
}
