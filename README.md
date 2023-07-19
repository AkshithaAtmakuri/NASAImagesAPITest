# NASAImagesAPITest
An iOS Application written in Swift. This app has a photo gallery with images retrieved from NASA API. Filtering option is available through search. For more information about the API, kindly visit: https://api.nasa.gov/

This project uses cocoapods as dependency manager. Hence, after you clone the repository or download the zip to open the project, you may need to run *"pod install"* command in order to install package dependencies.

### Used Packages:

1. *Alamofire*: for network requests
    
    For more information, kindly visit: https://github.com/Alamofire/Alamofire
    
2. *SDWebImage*: for image caching

    For more information, kindly visit: https://github.com/SDWebImage/SDWebImage
    
3. *Swinject*: for dependency injection. Swinject helps your app split into loosely-coupled components, which can be developed, tested and maintained more easily

    For more information, kindly visit: https://github.com/Swinject/Swinject


### Environment Info:
**Xcode version: 14.3**

**Swift version:5.5**

**This project uses *MVVM* as a primary architecture model and uses Factory, Coordinator design patterns when needed.**

### Basic Usage:
- You may run the project by opening the NASAImagesAPITest.xcworkspace file after installing the pods through terminal.
- On the Launch Screen you can see the NASA logo and the title being loaded with simple animations. And then you will be navigated to the NASAStartViewController.
- On clicking Get Started button you will be navigated to NASAImageLibraryViewController where you can see the NASA images pulled from the NASA images API. You can search and filter the images by using the searchbar.
- On tapping on any image will perform a simple flip animation before navigating you to NASAImageDetailViewController where you can see the image details like title, created date, description and image.
