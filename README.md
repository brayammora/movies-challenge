# Movies-challenge

1. ¿En qué consiste el principio de responsabilidad única? Cuál es su propósito?
  R: Nos dice que se debe delegar a un objeto/método una única responsabilidad bien definida, para comprobar que lo estamos aplicando debemos ser capaces de describir lo que hace un objeto/método sin tener que usar conjugaciones (y/o). 
3. Qué características tiene, según su opinión, un “buen” código o código limpio
  R// Un código limpio debe ser flexible a los cambios, que sea facil y cómodo de leer, mantener y testear. Lo podemos lograr usando nombres con sentido, principios SOLID, DRY, arquitectura modularizada, patrones de diseño.

## How the app works

![alt text](https://github.com/brayammora/movies-challenge/blob/main/Screenshots/AppWorking.gif)

## Instalation
This project require XCode 13.0, Swift 5.0 and should be run on device with iOS 15+ and then, you should `run` the app.

## Architecture
This project uses VIPER architecture, VIPER is an application of Clean Architecture to iOS apps. The word VIPER is a backronym for View, Interactor, Presenter, Entity, and Routing.

![alt text](https://miro.medium.com/max/1021/1*6W73TuYu1DWi9JY4_Uh8aA.png)

This architecture is conformed by 5 layers which have single responsibilities, which represent an opportunity to have a project decoupled, testable, and scalable.

### View
> Contains UI logic and knows how to layout and animate itself. It displays what it's told by the Presenter and it delegates user interaction actions to the Presenter.

### Presenter
> The presenter layer is responsible to manage the communication between the View, Router and Interactor layers. Its main function is handle each visual request, retrieve information from interactor layer or, route the actual view to another one with the Router.

### Router
> This layer is responsible to manage the communication between modules, its allows us changing between views and, initalize modules for each feature on the app.

### Interactor
> Used for fetching data when requested by the Presenter, contains only business logic..

### Entity 
> Contains only business logic, but primarily data, not rules.

## Good Practices
- **Clean code**
- **SOLID Principles**
- **DRY Principle**
- **Dependency Injection**
- **Modularized architecture**

## Project Structure

### Modules
In this folder we have each app module. In this case we have a Home, and DetailMovie modules.

![alt text](https://github.com/brayammora/movies-challenge/blob/main/Screenshots/ModulesCapture.png)

### Common
The main idea of this folder is have a transversal module which help us with reusables functions and components.

- **Resources:** Contains strings copies for the app.
- **Base:** Contains base classes for the modules, in this case only router base class.
- **Extensions:** Contains extra funcionalities to existing classes
- **Models:** Contains the entities bussiness for the project 
- **Services:** This allows us to separate in a single context everything related to networking and web services. 
- **UI:** Contains visual reusable components.

![alt text](https://github.com/brayammora/movies-challenge/blob/main/Screenshots/CommonCapture.png)

### Unit Test
In this section we have the unit test structure, this folder meets the Viper architecture requirements. To continue, we can find a Test Double approach where we use Mocks, and Stubs doubles to test the differents architecture layers.

![alt text](https://github.com/brayammora/movies-challenge/blob/main/Screenshots/UnitTestCapture.png)
