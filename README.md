
# NewYork-Time-Demo

NewYork-Time-Demo is an app to hit the NY Times Most Popular Articles API and:

Show a list of articles newest first(sorted based on date)
Shows details when items on the list are tapped.
Using the most viewed section of this API. http://api.nytimes.com/svc/mostpopular/v2/mostviewed/{section}/{period}.json?apikey= sample-key To test this API, For testAPI we used

all-sections for the section path component in the URL
7 for period
This is configurable in Constants.Swift file in Project. Used MVVM Design pattern and swift generic approach to develop this application.

Tools And Resources Used
CocoaPods - CocoaPods is a dependency manager for Swift and Objective-C Cocoa projects. It has over 33 thousand libraries and is used in over 2.2 million apps. CocoaPods can help you scale your projects elegantly.
Library Used 



Moya - Network abstraction layer written in Swift.

Kingfisher - A lightweight, pure-Swift library for downloading and caching images from the web.
 

How to build and run the code?
Start by cloning the repository
Go to directory
Open "NY Times Most Popular Articles.xcworkspace" using Xcode
use command + B or Product -> Build to build the project
Incase of build fail due to dependency Kingfisher, install Kingfisher using CocoaPods.
Incase of build fail due to dependency Moya, install Moya using CocoaPods.
Incase of build fail due to dependency SVProgressHUD, install SVProgressHUD using CocoaPods.
Press run icon in Xcode or command + R to run the project on Simulator


Architecture

The project uses an object oriented programming approach with MVVM architecture and utilizes structs, extensions and some class inheritance to separate and define the code more clearly.

Screenshots

![Simulator Screen Shot - iPhone Xs Max - 2019-11-10 at 12 21 47](https://user-images.githubusercontent.com/7680476/68540254-c312b080-03b4-11ea-84eb-452851ecc837.png)
![Simulator Screen Shot - iPhone Xʀ - 2019-11-09 at 14 24 54](https://user-images.githubusercontent.com/7680476/68540257-ce65dc00-03b4-11ea-9a90-eb102f45d043.png)
![Simulator Screen Shot - iPhone Xs Max - 2019-11-10 at 12 21 49](https://user-images.githubusercontent.com/7680476/68540258-d160cc80-03b4-11ea-9a4e-fea5a58cd90c.png)
![Simulator Screen Shot - iPhone Xs Max - 2019-11-10 at 12 21 54](https://user-images.githubusercontent.com/7680476/68540259-d3c32680-03b4-11ea-8b4b-ea8735bdec0b.png)




