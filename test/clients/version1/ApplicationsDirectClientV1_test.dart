import 'dart:async';
import 'package:test/test.dart';
import 'package:pip_services3_components/pip_services3_components.dart';
import 'package:pip_services_applications/pip_services_applications.dart';
import 'package:pip_services3_commons/pip_services3_commons.dart';
import 'package:pip_clients_applications/pip_clients_applications.dart';
import './ApplicationsClientFixtureV1.dart';

void main() {
  group('ApplicationsDirectClientV1', () {
    ApplicationsDirectClientV1 client;
    ApplicationsClientFixtureV1 fixture;
    ApplicationsMemoryPersistence persistence;
    ApplicationsController controller;

    setUp(() async {
      var logger = ConsoleLogger();
      persistence = ApplicationsMemoryPersistence();
      controller = ApplicationsController();
      var references = References.fromTuples([
        Descriptor('pip-services', 'logger', 'console', 'default', '1.0'),
        logger,
        Descriptor('pip-services-applications', 'persistence', 'memory',
            'default', '1.0'),
        persistence,
        Descriptor('pip-services-applications', 'controller', 'default',
            'default', '1.0'),
        controller
      ]);
      controller.setReferences(references);

      client = ApplicationsDirectClientV1();
      client.setReferences(references);

      fixture = ApplicationsClientFixtureV1(client);
      await client.open(null);
    });

    tearDown(() async {
      await client.close(null);
      await Future.delayed(Duration(milliseconds: 2000));
    });
    
    test('CRUD Operations', () async {
      await fixture.testCrudOperations();
    });
  });
}
