// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i15;
import 'package:flutter/material.dart';
import 'package:food_frenzy/ui/views/after_shake/after_shake_view.dart' as _i7;
import 'package:food_frenzy/ui/views/details/details_view.dart' as _i8;
import 'package:food_frenzy/ui/views/home/home_view.dart' as _i2;
import 'package:food_frenzy/ui/views/interactive/interactive_view.dart' as _i4;
import 'package:food_frenzy/ui/views/no_vouchers/no_vouchers_view.dart' as _i13;
import 'package:food_frenzy/ui/views/onboarding/onboarding_view.dart' as _i11;
import 'package:food_frenzy/ui/views/redeem/redeem_view.dart' as _i9;
import 'package:food_frenzy/ui/views/redeem_succes/redeem_succes_view.dart'
    as _i12;
import 'package:food_frenzy/ui/views/shake_timer/shake_timer_view.dart' as _i10;
import 'package:food_frenzy/ui/views/shaking/shaking_view.dart' as _i5;
import 'package:food_frenzy/ui/views/share/share_view.dart' as _i6;
import 'package:food_frenzy/ui/views/startup/startup_view.dart' as _i3;
import 'package:food_frenzy/ui/views/thanks/thanks_view.dart' as _i14;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i16;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const interactiveView = '/interactive-view';

  static const shakingView = '/shaking-view';

  static const shareView = '/share-view';

  static const afterShakeView = '/after-shake-view';

  static const detailsView = '/details-view';

  static const redeemView = '/redeem-view';

  static const shakeTimerView = '/shake-timer-view';

  static const onboardingView = '/onboarding-view';

  static const redeemSuccesView = '/redeem-succes-view';

  static const noVouchersView = '/no-vouchers-view';

  static const thanksView = '/thanks-view';

  static const all = <String>{
    homeView,
    startupView,
    interactiveView,
    shakingView,
    shareView,
    afterShakeView,
    detailsView,
    redeemView,
    shakeTimerView,
    onboardingView,
    redeemSuccesView,
    noVouchersView,
    thanksView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.startupView,
      page: _i3.StartupView,
    ),
    _i1.RouteDef(
      Routes.interactiveView,
      page: _i4.InteractiveView,
    ),
    _i1.RouteDef(
      Routes.shakingView,
      page: _i5.ShakingView,
    ),
    _i1.RouteDef(
      Routes.shareView,
      page: _i6.ShareView,
    ),
    _i1.RouteDef(
      Routes.afterShakeView,
      page: _i7.AfterShakeView,
    ),
    _i1.RouteDef(
      Routes.afterShakeView,
      page: _i7.AfterShakeView,
    ),
    _i1.RouteDef(
      Routes.detailsView,
      page: _i8.DetailsView,
    ),
    _i1.RouteDef(
      Routes.redeemView,
      page: _i9.RedeemView,
    ),
    _i1.RouteDef(
      Routes.shakeTimerView,
      page: _i10.ShakeTimerView,
    ),
    _i1.RouteDef(
      Routes.onboardingView,
      page: _i11.OnboardingView,
    ),
    _i1.RouteDef(
      Routes.redeemSuccesView,
      page: _i12.RedeemSuccesView,
    ),
    _i1.RouteDef(
      Routes.noVouchersView,
      page: _i13.NoVouchersView,
    ),
    _i1.RouteDef(
      Routes.thanksView,
      page: _i14.ThanksView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.HomeView(),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.InteractiveView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.InteractiveView(),
        settings: data,
      );
    },
    _i5.ShakingView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.ShakingView(),
        settings: data,
      );
    },
    _i6.ShareView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.ShareView(),
        settings: data,
      );
    },
    _i7.AfterShakeView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.AfterShakeView(),
        settings: data,
      );
    },
    _i8.DetailsView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.DetailsView(),
        settings: data,
      );
    },
    _i9.RedeemView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.RedeemView(),
        settings: data,
      );
    },
    _i10.ShakeTimerView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.ShakeTimerView(),
        settings: data,
      );
    },
    _i11.OnboardingView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.OnboardingView(),
        settings: data,
      );
    },
    _i12.RedeemSuccesView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i12.RedeemSuccesView(),
        settings: data,
      );
    },
    _i13.NoVouchersView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i13.NoVouchersView(),
        settings: data,
      );
    },
    _i14.ThanksView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i14.ThanksView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

extension NavigatorStateExtension on _i16.NavigationService {
  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToInteractiveView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.interactiveView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToShakingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.shakingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToShareView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.shareView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAfterShakeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.afterShakeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDetailsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.detailsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRedeemView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.redeemView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToShakeTimerView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.shakeTimerView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOnboardingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.onboardingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRedeemSuccesView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.redeemSuccesView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNoVouchersView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.noVouchersView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToThanksView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.thanksView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithInteractiveView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.interactiveView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithShakingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.shakingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithShareView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.shareView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAfterShakeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.afterShakeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDetailsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.detailsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRedeemView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.redeemView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithShakeTimerView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.shakeTimerView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOnboardingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.onboardingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRedeemSuccesView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.redeemSuccesView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNoVouchersView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.noVouchersView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithThanksView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.thanksView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
