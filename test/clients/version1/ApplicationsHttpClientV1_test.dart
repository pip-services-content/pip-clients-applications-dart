import 'dart:async';

import 'package:test/test.dart';
import 'package:pip_services3_commons/pip_services3_commons.dart';
import 'package:pip_clients_applications_dart/pip_clients_applications_dart.dart';
import './ApplicationsClientFixtureV1.dart';

var httpConfig = ConfigParams.fromTuples([
  'connection.protocol',
  'http',
  'connection.host',
  'localhost',
  'connection.port',
  8080
]);

void main() {
  group('ApplicationsHttpClientV1', () {
    ApplicationsHttpClientV1 client;
    ApplicationsClientFixtureV1 fixture;

    setUp(() async {

      client = ApplicationsHttpClientV1();
      client.configure(httpConfig);
      var references = References.fromTuples([
        Descriptor('pip-services-applications', 'client', 'http', 'default', '1.0'), client]);
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
