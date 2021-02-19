import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:kiwi/kiwi.dart';
import 'package:next_app/common/environment/environment.dart';
import 'package:next_app/common/environment/environment_dev.dart';
import 'package:next_app/common/environment/environment_prod.dart';
import 'package:next_app/common/environment/environment_stage.dart';
import 'package:next_app/data/network/service/managed_network_service.dart';
import 'package:next_app/data/network/service/network_service.dart';
import 'package:next_app/data/network/service/network_service_impl.dart';

T inject<T>([String name]) => KiwiContainer().resolve<T>(name);

abstract class Injector {
  static KiwiContainer container;

  static void setup() {
    container = KiwiContainer();

    _common();

    _switchBasedOnEnvironment(
      devSetup: _commonDevelopment,
      stageSetup: _commonStage,
      prodSetup: _commonProduction,
    );

    if (kIsWeb) {
      _webCommon();
      _switchBasedOnEnvironment(
        devSetup: _webDevelopment,
        stageSetup: _webStage,
        prodSetup: _webProduction,
      );
    } else {
      _mobileCommon();
      _switchBasedOnEnvironment(
        devSetup: _mobileDevelopment,
        stageSetup: _mobileStage,
        prodSetup: _mobileProduction,
      );
    }
  }

  static void _switchBasedOnEnvironment({
    @required void Function() devSetup,
    @required void Function() stageSetup,
    @required void Function() prodSetup,
  }) {
    switch (Environment.current.runtimeType) {
      case DevelopmentEnvironment:
        devSetup?.call();
        break;
      case StageEnvironment:
        stageSetup?.call();
        break;
      case ProductionEnvironment:
        prodSetup?.call();
        break;
    }
  }

  static void _common() {
    // NETWORK
    container.registerSingleton(
      (c) => Dio(BaseOptions(
        baseUrl: Environment.current.baseUrl,
      )),
    );
    container.registerSingleton<NetworkService>(
      (c) => NetworkServiceImpl(dio: c.resolve()),
      name: 'networkServiceImpl',
    );
    container.registerSingleton<NetworkService>(
      (c) => ManagedNetworkService(
        networkInfo: c.resolve(),
        networkService: c.resolve('networkServiceImpl'),
      ),
    );
  }

  static void _commonDevelopment() {}

  static void _commonStage() {}

  static void _commonProduction() {}

  //     //
  // WEB //
  //     //
  static void _webCommon() {}

  static void _webDevelopment() {}

  static void _webStage() {}

  static void _webProduction() {}

  //        //
  // MOBILE //
  //        //
  static void _mobileCommon() {}

  static void _mobileDevelopment() {}

  static void _mobileStage() {}

  static void _mobileProduction() {}
}
