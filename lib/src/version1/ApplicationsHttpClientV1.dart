import 'dart:async';
import 'dart:convert';
import 'package:pip_services3_commons/pip_services3_commons.dart';
import 'package:pip_services3_rpc/pip_services3_rpc.dart';
import './ApplicationV1.dart';
import './IApplicationsClientV1.dart';

class ApplicationsHttpClientV1 extends CommandableHttpClient
    implements IApplicationsClientV1 {
  ApplicationsHttpClientV1([config]) : super('v1/applications') {
    if (config != null) {
      configure(ConfigParams.fromValue(config));
    }
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
    var result = await callCommand(
      'get_applications',
      correlationId,
      {'filter': filter, 'paging': paging},
    );
    return DataPage<ApplicationV1>.fromJson(json.decode(result), (item) {
      var application = ApplicationV1();
      application.fromJson(item);
      return application;
    });
  }

  /// Gets an application by its unique id.
  ///
  /// - [correlationId]     (optional) transaction id to trace execution through call chain.
  /// - [id]                an id of application to be retrieved.
  /// Return         Future that receives application or error.
  @override
  Future<ApplicationV1> getApplicationById(
      String correlationId, String applicationId) async {
    var result = await callCommand('get_application_by_id', correlationId,
        {'application_id': applicationId});
    if (result == null) return null;
    var item = ApplicationV1();
    item.fromJson(json.decode(result));
    return item;
  }

  /// Creates an application.
  ///
  /// - [correlation_id]    (optional) transaction id to trace execution through call chain.
  /// - [item]              an application to be created.
  /// Return         (optional) Future that receives created application or error.
  @override
  Future<ApplicationV1> createApplication(
      String correlationId, ApplicationV1 application) async {
    var result = await callCommand(
        'create_application', correlationId, {'application': application});
    if (result == null) return null;
    var item = ApplicationV1();
    item.fromJson(json.decode(result));
    return item;
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
    var result = await callCommand(
        'update_application', correlationId, {'application': application});
    if (result == null) return null;
    var item = ApplicationV1();
    item.fromJson(json.decode(result));
    return item;
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
    var result = await callCommand('delete_application_by_id', correlationId,
        {'application_id': applicationId});
    if (result == null) return null;
    var item = ApplicationV1();
    item.fromJson(json.decode(result));
    return item;
  }
}
