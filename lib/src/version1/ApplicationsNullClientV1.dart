import 'dart:async';
import 'package:pip_services3_commons/pip_services3_commons.dart';

import './ApplicationV1.dart';
import './IApplicationsClientV1.dart';

class ApplicationsNullClientV1 implements IApplicationsClientV1 {
  @override
  Future<DataPage<ApplicationV1>> getApplications(
      String correlationId, FilterParams filter, PagingParams paging) async {
    return DataPage<ApplicationV1>([], 0);
  }

  @override
  Future<ApplicationV1> getApplicationById(
      String correlationId, String applicationId) async {
    return null;
  }

  @override
  Future<ApplicationV1> createApplication(
      String correlationId, ApplicationV1 application) {
    return null;
  }

  @override
  Future<ApplicationV1> updateApplication(
      String correlationId, ApplicationV1 application) {
    return null;
  }

  @override
  Future<ApplicationV1> deleteApplicationById(
      String correlationId, String applicationId) {
    return null;
  }
}
