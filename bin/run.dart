import 'dart:async';

import 'package:pip_clients_applications/pip_clients_applications.dart';
import 'package:pip_services3_commons/pip_services3_commons.dart';


Future<void> main(List<String> argument) async {
  try {
    var correlationId = '123';
    var config = ConfigParams.fromTuples([
                    'connection.type', 'http',
                    'connection.host', 'localhost',
                    'connection.port', 8080]
                );
    var client = ApplicationsHttpClientV1();
    client.configure(config);
    final APPLICATION1 = ApplicationV1(
      id: '1',
      name: MultiString({'en': 'App1'}),
      product: 'Product 1',
      copyrights: 'PipDevs 2018',
      min_ver: 0,
      max_ver: 9999
    );
    final APPLICATION2 = ApplicationV1(
      id: '2',
      name: MultiString({'en': 'App2'}),
      product: 'Product 1',
      copyrights: 'PipDevs 2018',
      min_ver: 0,
      max_ver: 9999
    );  
    await client.open(correlationId);
    await client.createApplication(correlationId, APPLICATION1);
    await client.createApplication(correlationId, APPLICATION2);
    var page = await client.getApplications(null, null, null);
    print('Get apps: ' + page.data.length.toString());
    await client.close(correlationId);
  } catch (ex) {
    print(ex);
  }
}