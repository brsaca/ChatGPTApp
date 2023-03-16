# Table of Contents
1. [Description](#description)
2. [Getting started](#getting-started)
3. [Usage](#usage)
4. [Arhitecture](#arhitecture)
5. [Structure](#structure)
6. [Running the tests](#running-the-tests)
7. [Deployment](#deployment)
8. [Dependencies](#dependencies)
9. [Task board](#task-board)
10. [Design](#design)
11. [API](#api)

# ChatGPTApp
A project  using the CHATGPT API

# Description
<p>The Hello World project is a simple and straightforward introduction to programming.<br>
It is designed for beginners who have little to no experience with coding and aims to familiarize them with the basic concepts 
and syntax of a programming language.<br> 
The project consists of a single script that, when executed, will print the text "Hello, World!" to the screen.</p>

# Getting started
<p>
1. Make sure you have the Xcode version 14.0 or above installed on your computer.<br>
2. Download the Hello World project files from the repository.<br>
3. Install CocoaPods.<br>
4. Run pod install so you can install the dependencies in your project.<br>
5. Open the project files in Xcode.<br>
6. Review the code and make sure you understand what it does.<br>
7. Run the active scheme.<br>
You should see the text "Hello, World!" printed to the screen.<br>

Once you're comfortable with the basic concept, you can start modifying the script and experimenting with different variations.<br>
If you have any issues or need help, refer to the documentation or contact the developers for assistance.<br>
You're now ready to start your journey into the world of programming.</p>

# Usage
In order to send a message to the whole world, you must log in with the appropriate account.
* Username: LordVoldemort
* Password: AvadaKedavra123

Important: DEV and PROD enviroment are <strong>NOT WORKING</strong> on Friday from 00:00 - 01:00 GMT due to the server maintenance.

# Architecture
* Hello World project is implemented using the <strong>Model-View-Controller (MVC)</strong> architecture pattern.
* Model has any necessary data or business logic needed to generate the "Hello, World!" message.
* View is responsible for displaying the message to the user, such as printing it to the console.
* Controller handles any user input or interactions and update the Model and View as needed.
* Project doesn't have a database, user interface or any other complex elements.<br><br>
How to create a new screen?<br>
The router serves for navigation. In order to present ViewControllerA, RouterA present method must be called.<br>
Below is a code snippet with an example.<br>

```
RouterA().present(on: self, context: contextA(title: "HelloWorld"))

final class RouterA {
  private func viewController(presentingViewController: UIViewController, context: ContextA) -> ViewControllerA {
        let viewModel = ViewModelA(context: context)
        let viewController = ViewControllerA(viewModel: viewModel)
        viewController.modalPresentationStyle = .overFullScreen

        return viewController
    }

    func present(on presentingViewController: UIViewController, context: ContextA) {
        presentingViewController.present(viewController(presentingViewController: presentingViewController, context: context), animated: true, completion: nil)
}
```

# Structure 
* "Common": Files or resources that are shared across multiple parts of the project. Such as utility classes, global constants, or reusable UI elements.
* "Modules": The source code files for a specific module. Files within a module folder are organized into subfolders, such as "Views" or "Models".
* "Resources": Non-code files that are used by the project. These can include images, audio files, video files, and other types of assets. 
* "API": Files or classes related to communicating with an external API. This could include code for making HTTP requests to a web server, parsing responses, and handling any errors that may occur.

# Running the tests
<p>The Hello World project can be tested using the built-in framework XCTest.<br>
To start testing the project, you will need to create a new test target in your Xcode project, 
and then add test files to that target.<br>These test files should be placed in the "test" folder, following the project structure.
Once you have created your test files, you can write test functions using the XCTest</p>

# Deployment
Keep in mind that deploying an iOS app to the App Store requires having an Apple Developer account.

1. Click on the "Product" menu in Xcode and select "Archive." This will create an archive of your project.
2. Once the archive has been created, select it in the Organizer window and click on the "Validate" button to perform some preliminary tests on the app.
3. Once validation is complete, click on the "Distribute" button and select "Ad Hoc" or "App Store" distribution. 
This will create a signed IPA file that can be installed on iOS devices.
4. Follow the prompts in the distribution wizard to complete the distribution process.
5. Once the distribution is complete, you can use the IPA file to install the app on iOS devices

# Dependencies
[CocoaPods](https://cocoapods.org) is used as a dependency manager.
List of dependencies: 
* pod 'Alamofire' -> Networking library that ensures that the message reaches everyone in the world.
* pod 'AzikusAuthorization' -> Our library that serves for authorization. 
It is very important that <strong>it is maintained because it is also used by users outside the company</strong>.

# Workflow

* Reporting bugs:<br> 
If you come across any issues while using the HelloWorld, please report them by creating a new issue on the GitHub repository.

* Reporting bugs form: <br> 
```
App version: 2.12
iOS version: 16.1
Description: When I tap on the "Send" button, my friends don't receive message.
Steps to reproduce: Open "Messages" flow of the app, write down message, press "Send" button.
```

* Submitting pull requests: <br> 
If you have a bug fix or a new feature you'd like to add, please submit a pull request. Before submitting a pull request, 
please make sure that your changes are well-tested and that your code adheres to the Swift style guide.

* Improving documentation: <br> 
If you notice any errors or areas of improvement in the documentation, feel free to submit a pull request with your changes.

* Providing feedback:<br> 
If you have any feedback or suggestions for the HelloWorld project, please let us know by creating a new issue or by sending an email to the project maintainer.

# Task board
* Task management tool for our teams is [Jira](https://www.atlassian.com/software/jira)<br>
* Link to the board is [here](https://www.atlassian.com/software/jira)<br>

It is very important that the tasks are up to date so that the project managers could distribute the tasks as good as possible.<br>
Daily meetings are everyday at 9:45AM GMT. The planning of tasks is every 2 weeks, and the time for their execution is also 2 weeks, which includes testing.


# Design 
* Design tool for our teams is [Figma](https://www.figma.com)
* Link to the design is [here](https://www.figma.com) <br>
* All of the design is and must be only in one tool and currently it is Figma.<br>
* Colors in the Figma must have same name as colors in Xcode project.<br> 
* Basic UI elemnts are defined and can be found [here](https://www.figma.com)

# API 
* We are using a REST API
* List of API calls is [here](https://petstore.swagger.io/#/) 
* For HTTP networking we are using [Alamofire](https://github.com/Alamofire/Alamofire) 
