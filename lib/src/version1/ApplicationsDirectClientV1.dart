import 'dart:async';
import 'package:pip_services3_commons/pip_services3_commons.dart';
import 'package:pip_services3_rpc/pip_services3_rpc.dart';

import 'package:pip_services_applications/pip_services_applications.dart';
import './IApplicationsClientV1.dart';

class ApplicationsDirectClientV1 extends DirectClient<dynamic>
    implements IApplicationsClientV1 {
  ApplicationsDirectClientV1() : super() {
    dependencyResolver.put('controller',
        Descriptor('pip-services-applications', 'controller', '*', '*', '1.0'));
  }

  /// Gets a page of applications retrieved by a given filter.
  ///
  /// - [correlationId]     (optional) transaction id to trace execution through call chain.
  /// - [filter]            (optional) a filter function to filter items
  /// - [paging]            (optional) paging parameters
  /// Return         Future that receives a data page
  /// Throws error.
  @override
  Future<DataPage<ApplicationV1>> getApplications(
      String correlationId, FilterParams filter, PagingParams paging) async {
    var timing = instrument(correlationId, 'applications.get_applications');
    var page = await controller.getApplications(correlationId, filter, paging);
    timing.endTiming();
    return page;
  }

  /// Gets an application by its unique id.
  ///
  /// - [correlationId]     (optional) transaction id to trace execution through call chain.
  /// - [id]                an id of application to be retrieved.
  /// Return         Future that receives application or error.
  @override
  Future<ApplicationV1> getApplicationById(
      String correlationId, String applicationId) async {
    var timing =
        instrument(correlationId, 'applications.get_application_by_id');
    var application =
        await controller.getApplicationById(correlationId, applicationId);
    timing.endTiming();
    return application;
  }

  /// Creates an application.
  ///
  /// - [correlation_id]    (optional) transaction id to trace execution through call chain.
  /// - [item]              an application to be created.
  /// Return         (optional) Future that receives created application or error.
  @override
  Future<ApplicationV1> createApplication(
      String correlationId, ApplicationV1 application) async {
    var timing = instrument(correlationId, 'applications.create_application');
    var result = await controller.createApplication(correlationId, application);
    timing.endTiming();
    return result;
  }

  /// Updates an application.
  ///
  /// - [correlation_id]    (optional) transaction id to trace execution through call chain.
  /// - [item]              an application to be updated.
  /// Return         (optional) Future that receives updated application
  /// Throws error.
  @override
  Future<ApplicationV1> updateApplication(
      String correlationId, ApplicationV1 application) async {
    var timing = instrument(correlationId, 'applications.update_application');
    var result = await controller.updateApplication(correlationId, application);
    timing.endTiming();
    return result;
  }

  /// Deleted an application by it's unique id.
  ///
  /// - [correlation_id]    (optional) transaction id to trace execution through call chain.
  /// - [id]                an id of the application to be deleted
  /// Return                Future that receives deleted application
  /// Throws error.
  @override
  Future<ApplicationV1> deleteApplicationById(
      String correlationId, String applicationId) async {
    var timing =
        instrument(correlationId, 'applications.delete_application_by_id');
    var application =
        await controller.deleteApplicationById(correlationId, applicationId);
    timing.endTiming();
    return application;
  }
}
