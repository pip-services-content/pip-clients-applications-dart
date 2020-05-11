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

  @override
  Future<ApplicationV1> getApplicationById(String correlationId, String applicationId) async {
    var result = await callCommand(
        'get_application_by_id', correlationId, {'application_id': applicationId});
    if (result == null) return null;
    var item = ApplicationV1();
    item.fromJson(json.decode(result));
    return item;
  }

  @override
  Future<ApplicationV1> createApplication(String correlationId, ApplicationV1 application) async {
    var result =
        await callCommand('create_application', correlationId, {'application': application});
    if (result == null) return null;
    var item = ApplicationV1();
    item.fromJson(json.decode(result));
    return item;
  }

  @override
  Future<ApplicationV1> updateApplication(String correlationId, ApplicationV1 application) async {
    var result =
        await callCommand('update_application', correlationId, {'application': application});
    if (result == null) return null;
    var item = ApplicationV1();
    item.fromJson(json.decode(result));
    return item;
  }

  @override
  Future<ApplicationV1> deleteApplicationById(
      String correlationId, String applicationId) async {
    var result = await callCommand(
        'delete_application_by_id', correlationId, {'application_id': applicationId});
    if (result == null) return null;
    var item = ApplicationV1();
    item.fromJson(json.decode(result));
    return item;
  }
}
