import 'package:pip_services3_components/pip_services3_components.dart';
import 'package:pip_services3_commons/pip_services3_commons.dart';

import '../version1/ApplicationsNullClientV1.dart';
import '../version1/ApplicationsDirectClientV1.dart';
import '../version1/ApplicationsHttpClientV1.dart';

class ApplicationsClientFactory extends Factory {
  static final NullClientDescriptor =
      Descriptor('pip-services-applications', 'client', 'null', '*', '1.0');
  static final DirectClientDescriptor =
      Descriptor('pip-services-applications', 'client', 'direct', '*', '1.0');
  static final CommandableHttpClientDescriptor =
      Descriptor('pip-services-applications', 'client', 'commandable-http', '*', '1.0');

  ApplicationsClientFactory() : super() {
    registerAsType(
        ApplicationsClientFactory.NullClientDescriptor, ApplicationsNullClientV1);
    registerAsType(
        ApplicationsClientFactory.DirectClientDescriptor, ApplicationsDirectClientV1);
    registerAsType(ApplicationsClientFactory.CommandableHttpClientDescriptor,
        ApplicationsHttpClientV1);
  }
}
