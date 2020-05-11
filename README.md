# <img src="https://github.com/pip-services/pip-services/raw/master/design/Logo.png" alt="Pip.Services Logo" style="max-width:30%"> <br/> Applications Microservice Client SDK for Dart

This is a Dart client SDK for [pip-services-applications](https://github.com/pip-services-content/pip-services-applications-dart) microservice.

## Download

Right now the only way to get the microservice is to check it out directly from github repository
```bash
git clone git@github.com:pip-services-content/pip-clients-applications-dart.git
```

Pip.Service team is working to implement packaging and make stable releases available for your 
as zip downloadable archieves.

## Contract

Logical contract of the microservice is presented below. For physical implementation (HTTP/REST),
please, refer to documentation of the specific protocol.

```dart
class ApplicationV1 implements IStringIdentifiable {
  String id;
  MultiString name;
  MultiString description;
  String product;
  String group;
  String copyrights;
  String url;
  String icon;
  int min_ver;
  int max_ver;
}

abstract class IApplicationsClientV1 {
  Future<DataPage<ApplicationV1>> getApplications(
      String correlationId, FilterParams filter, PagingParams paging);

  Future<ApplicationV1> getApplicationById(String correlationId, String applicationId);

  Future<ApplicationV1> createApplication(String correlationId, ApplicationV1 application);

  Future<ApplicationV1> updateApplication(
    String correlationId,
    ApplicationV1 application,
  );

  Future<ApplicationV1> deleteApplicationById(String correlationId, String applicationId);
}
```

## Use

The easiest way to work with the microservice is to use client SDK. 

Define client configuration parameters that match the configuration of the microservice's external API
```dart
// Client configuration
var httpConfig = ConfigParams.fromTuples(
	"connection.protocol", "http",
	"connection.host", "localhost",
	"connection.port", 8080
);
```

Instantiate the client and open connection to the microservice
```dart
// Create the client instance
var client = ApplicationsHttpClientV1(config);

// Configure the client
client.configure(httpConfig);

// Connect to the microservice
try{
  await client.open(null)
}catch() {
  // Error handling...
}       
// Work with the microservice
// ...
```

Now the client is ready to perform operations
```dart
// Create a new application
final APPLICATION = ApplicationV1.fromMap({
    id: 'my_app',
    name: 'My Application',
    product: 'My Samples'
});

    // Create the application
    try {
      var application = await client.createApplication('123', APPLICATION);
      // Do something with the returned application...
    } catch(err) {
      // Error handling...     
    }
```

```dart
// Get the list of applications for 'My Samples' product
try {
var page = await client.getApplications(
    null,
    {
        product: 'My Samples'
    },
    {
        total: true,
        skip: 0,
        take: 10
    });
    // Do something with page...

    } catch(err) { // Error handling}
```   

## Acknowledgements

This microservice was created and currently maintained by
- **Sergey Seroukhov**.
- **Nuzhnykh Egor**
