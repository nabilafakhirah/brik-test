import 'package:briktest/core/api/products_api.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'core/services/alice_service.dart';
import 'core/services/dio_service.dart';
import 'core/services/navigation_service.dart';

List<SingleChildWidget> getProviders() {
  final List<SingleChildWidget> providers = <SingleChildWidget>[
    ...independentServices,
    ...dependentServices(),
    ...apiServices,
  ];

  return providers;
}

List<SingleChildWidget> dependentServices() {
  return <SingleChildWidget>[
    ProxyProvider<NavigationService, AliceService>(
      update: (_, NavigationService navigationService, __) =>
          AliceService(navigationService.navigatorKey),
    ),
    ProxyProvider<AliceService, DioService>(
      update: (_, AliceService aliceService, __) => DioService(
        aliceService,
      ),
    ),
  ];
}

List<SingleChildWidget> independentServices = <SingleChildWidget>[
  Provider<NavigationService>(create: (_) => NavigationService()),
];

List<SingleChildWidget> apiServices = <SingleChildWidget>[
  ProxyProvider<DioService, ProductsApi>(
    update: (_, DioService dioService, __) => ProductsApi(
      dioService.dio,
      baseUrl: 'https://crudcrud.com/api/c3d32b66e78446bab5643c6039162d4a/',
    ),
  ),
];