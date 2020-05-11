import 'dart:async';
import 'package:pip_services3_commons/pip_services3_commons.dart';

import './ApplicationV1.dart';

abstract class IApplicationsClientV1 {
  Future<DataPage<ApplicationV1>> getApplications(
      String correlationId, FilterParams filter, PagingParams paging);

  Future<ApplicationV1> getApplicationById(String correlationId, String applicationId);

  Future<ApplicationV1> createApplication(String correlationId, ApplicationV1 application);

  Future<ApplicationV1> updateApplication(String correlationId, ApplicationV1 application);

  Future<ApplicationV1> deleteApplicationById(String correlationId, String applicationId);
}