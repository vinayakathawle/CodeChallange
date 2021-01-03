# Dog Breed App Demo With MVVM Design Pattern
An Xcode 12.1 project written in Swift 4 code built using the MVVM design pattern

The reason behind to use MVVM pattern to make clean, reusable code and clean architecture.
App will sport iPhone and iPad both, even in landscape and portrait mode.

## How app works,
-   Service call on app launch and will get dog breeds array which we are display in tableview. If we have any error during the service call it will display error message on center of the screen and ask user to Pull-to-refresh to next try.
-   Image cache and display with aspect ratio based on device size.
-   Display image, name and life-span in tableview.
-   In top navigation bar we have two button option to accending and decending breed list in table view based on breed life-span.

### Test cases,
For sample I have written two test cases,
-   NetworkManager - where called actual NetworkManager functon (performNetworkTask) and call api to get breeds list withing 2 sec.  
-   CalculateHeight - where I have create sample breed data and pass into the function and check success and failure by passing static height to compare.
