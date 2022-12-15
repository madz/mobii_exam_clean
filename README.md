# mobii_exam

## Flutter Version

[√] Flutter (Channel stable, 3.3.9)

## General

This repo contains the source code for the pdax payments insight screens.

## Clean Architecture in Flutter

**Introduction**
It is architecture based on the blog by [Reso Coder's Flutter Clean Architecture](https://resocoder.com/2019/08/27/flutter-tdd-clean-architecture-course-1-explanation-project-structure/). The main focus of the architecture is separation of concerns and scalability.
![alt text](https://i0.wp.com/resocoder.com/wp-content/uploads/2019/08/Clean-Architecture-Flutter-Diagram.png?w=556&ssl=1)
Every "feature" of the app, like sign in with email and password, will be divided into 3 layers - `presentation`, `domain` and `data`.
**Layers**

1. Domain It will contain only the core business logic (use cases) and business objects (entities). It should be totally independent of every other layer.
   ![alt text](https://i0.wp.com/resocoder.com/wp-content/uploads/2019/08/domain-layer-diagram.png?w=141&ssl=1)

- `UseCase`: Classes which encapsulate all the business logic of a particular use case of the app (e.g. FetchProfile or UpdateProfile). - `Entities`: Business objects of the application - `Repositories`: Abstract classes that define the expected functionality of outer layers (`data` layer).
  We create an abstract Repository class defining a contract of what the Repository must do - this goes into the domain layer. We then depend on the Repository "contract" defined in `domain`, knowing that the actual implementation of the Repository in the `data` layer will fullfill this contract.
  > NOTE: Dependency inversion principle is the last of the SOLID principles. It basically states that the boundaries between layers should be handled with interfaces (abstract classes in Dart).

2.Data: Consists of a **Repository implementation** (the contract comes from the `domain` layer) and data sources - one is usually for getting remote (API) data and the other for caching that data.
   ![alt text](https://i0.wp.com/resocoder.com/wp-content/uploads/2019/08/data-layer-diagram.png?w=329&ssl=1)

- `Repositories`: Every Repository should implement Repository from the `domain` layer. - `Datasources`: - _remote_ : responsible for any API call. - _local_ : reposible for caching data in local database (e.g SQLite, shared_preferences) - `Models`: Extensions of `Entities` with the addition of extra members that might be platform-dependent. For example, in the case of parse json Oject from reponse's server, this can be add some specific functionality (toJson, fromJson) or additional fields database. > NOTE: You may notice that data sources don't return `Entities` but rather `Models`.

3.Presentation: Contains the UI and the event handlers of the UI.
   ![alt text](https://i0.wp.com/resocoder.com/wp-content/uploads/2019/08/presentation-layer-diagram.png?w=287&ssl=1)

### Why Clean Architecture?

- ```Loose coupling between the code``` - The code can easily be modified without affecting any or a large part of the app's codebase thus easier to scale the application later on.
- Easier to ```test``` code.
- ```Separation of Concern``` - Different modules have specific responsibilities making it easier for modification and maintenance.

### S.O.L.I.D Principles

- [**Single Responsibility**](https://en.wikipedia.org/wiki/Single-responsibility_principle): Each software component should have only one reason to change – one responsibility.

- [**Open-Closed**](https://en.wikipedia.org/wiki/Open%E2%80%93closed_principle#:~:text=In%20object%2Doriented%20programming%2C%20the,without%20modifying%20its%20source%20code.): You should be able to extend the behavior of a component, without breaking its usage, or modifying its extensions.

- [**Liskov Substitution**](https://en.wikipedia.org/wiki/Liskov_substitution_principle): If you have a class of one type, and any subclasses of that class, you should be able to represent the base class usage with the subclass, without breaking the app.

- [**Interface Segregation**](https://en.wikipedia.org/wiki/Interface_segregation_principle): It’s better to have many smaller interfaces than a large one, to prevent the class from implementing the methods that it doesn’t need.

- [**Dependency Inversion**](https://en.wikipedia.org/wiki/Dependency_inversion_principle): Components should depend on abstractions rather than concrete implementations. Also higher level modules shouldn’t depend on lower level modules.

## Dependencies

- UI
  - [CupertinoIcons](https://pub.dev/packages/cupertino_icons)
  - [GoogleFonts](https://pub.dev/packages/google_fonts)
- State Management
  - [Bloc](https://pub.dev/packages/flutter_bloc)
- Navigation/Routing
  - [GoRouter](https://pub.dev/packages/go_router)
- Dependency  Injection
  - [GetIt](https://pub.dev/packages/get_it)
  - [Injectable](https://pub.dev/packages/injectable)
- Dart Data Class Generation
  - [Freezed](https://pub.dev/packages/freezed)
  - [JsonSerializable](https://pub.dev/packages/json_serializable)
- Network
  - [Chopper](https://pub.dev/packages/chopper)
  - [Http](https://pub.dev/packages/http)
- Functional Programming
  - [Dartz](https://pub.dev/packages/dartz)
- Logging
  - [Logger](https://pub.dev/packages/logger)

## Dev Dependencies

- Generating files
  - [BuildRunner](https://pub.dev/packages/build_runner)
  - [ChopperGenerator](https://pub.dev/packages/chopper_generator)
  - [FlutterGenRunner](https://pub.dev/packages/flutter_gen_runner)
  - [InjectableGenerator](https://pub.dev/packages/injectable_generator)

- Linter
  - [DartCodeMetrics](https://pub.dev/packages/dart_code_metrics)
  - [VeryGoodAnalysis](https://pub.dev/packages/very_good_analysis)

## Folder Structure

```text
mobii_exam/
┣ lib/
┃ ┣ src/
┃ ┃ ┣ core/
┃ ┃ ┣ data/
┃ ┃ ┣ domain/
┃ ┃ ┣ presentation/
┃ ┃ ┗ shared/
┃ ┃ ┣ app.dart
┃ ┣ main.dart
┣ test/
┣ analysis_options.yaml
┣ pubspec.yaml
┗ README.md

```

## Run the generator  
  
Use the [watch] flag to watch the files' system for edits and rebuild as necessary.  
  
```terminal  
flutter packages pub run build_runner watch --delete-conflicting-outputs
```  
  
if you want the generator to run one time and exits use  
  
```terminal  
flutter packages pub run build_runner build --delete-conflicting-outputs
```

## Running test

```terminal  
flutter test 
```
