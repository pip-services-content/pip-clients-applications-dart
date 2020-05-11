import 'dart:async';
import 'package:pip_services3_commons/pip_services3_commons.dart';
import 'package:pip_services3_rpc/pip_services3_rpc.dart';

import './ApplicationV1.dart';
import './IApplicationsClientV1.dart';

class ApplicationsDirectClientV1 extends DirectClient<dynamic>
    implements IApplicationsClientV1 {
  ApplicationsDirectClientV1() : super() {
    dependencyResolver.put(
        'controller', Descriptor('pip-services-applications', 'controller', '*', '*', '1.0'));
  }

  @override
  Future<DataPage<ApplicationV1>> getApplications(
      String correlationId, FilterParams filter, PagingParams paging) async {
    var timing = instrument(correlationId, 'applications.get_applications');
    var page = await controller.getApplications(correlationId, filter, paging);
    timing.endTiming();
    return page;
  }

  @override
  Future<ApplicationV1> getApplicationById(String correlationId, String applicationId) async {
    var timing = instrument(correlationId, 'applications.get_application_by_id');
    var application = await controller.getApplicationById(correlationId, applicationId);
    timing.endTiming();
    return application;
  }

  @override
  Future<ApplicationV1> createApplication(String correlationId, ApplicationV1 application) async {
    var timing = instrument(correlationId, 'applications.create_application');
    var result = await controller.createApplication(correlationId, application);
    timing.endTiming();
    return result;
  }

  @override
  Future<ApplicationV1> updateApplication(String correlationId, ApplicationV1 application) async {
    var timing = instrument(correlationId, 'applications.update_application');
    var result = await controller.updateApplication(correlationId, application);
    timing.endTiming();
    return result;
  }

  @override
  Future<ApplicationV1> deleteApplicationById(
      String correlationId, String applicationId) async {
    var timing = instrument(correlationId, 'applications.delete_application_by_id');
    var application = await controller.deleteApplicationById(correlationId, applicationId);
    timing.endTiming();
    return application;
  }
}
