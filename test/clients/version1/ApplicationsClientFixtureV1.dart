import 'package:test/test.dart';
import 'package:pip_services3_commons/pip_services3_commons.dart';
import 'package:pip_services_applications/pip_services_applications.dart';
import 'package:pip_clients_applications/pip_clients_applications.dart';

final APPLICATION1 = ApplicationV1(
    id: '1',
    name: MultiString({'en': 'App1'}),
    product: 'Product 1',
    copyrights: 'PipDevs 2018',
    min_ver: 0,
    max_ver: 9999);
final APPLICATION2 = ApplicationV1(
    id: '2',
    name: MultiString({'en': 'App2'}),
    product: 'Product 1',
    copyrights: 'PipDevs 2018',
    min_ver: 0,
    max_ver: 9999);

class ApplicationsClientFixtureV1 {
  IApplicationsClientV1 _client;

  ApplicationsClientFixtureV1(IApplicationsClientV1 client) {
    expect(client, isNotNull);
    _client = client;
  }

  void testCrudOperations() async {
    ApplicationV1 application1;

    // Create the first application
    var application = await _client.createApplication(null, APPLICATION1);
    expect(application, isNotNull);
    expect(APPLICATION1.name.get('en'), application.name.get('en'));
    expect(APPLICATION1.product, application.product);
    expect(APPLICATION1.copyrights, application.copyrights);

    // Create the second application
    application = await _client.createApplication(null, APPLICATION2);
    expect(application, isNotNull);
    expect(APPLICATION2.name.get('en'), application.name.get('en'));
    expect(APPLICATION2.product, application.product);
    expect(APPLICATION2.copyrights, application.copyrights);

    // Get all applications
    var page =
        await _client.getApplications(null, FilterParams(), PagingParams());
    expect(page, isNotNull);
    expect(page.data.length, 2);
    application1 = page.data[0];

    // Update the application
    application1.name = MultiString({'en': 'Updated Name 1'});

    application = await _client.updateApplication(null, application1);
    expect(application, isNotNull);
    expect(application1.id, application.id);
    expect('Updated Name 1', application.name.get('en'));

    // Delete the application
    application = await _client.deleteApplicationById(null, application1.id);
    expect(application, isNotNull);
    expect(application1.id, application.id);

    // Try to get deleted application
    application = await _client.getApplicationById(null, application1.id);
    expect(application, isNull);
  }
}
