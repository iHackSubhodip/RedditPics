# RedditPics

### Show an infinitely scrolling list of pictures posted to Reddit.

### • To get the feed use the http://www.reddit.com/r/pics/hot.json 
### • Each row in the list should show a thumbnail with a title 
### • Force Tapping a thumbnail should show a larger version of the image.[3D touch] 
### • To get the next page of results, append the value of "after" 
### • E.g.: http://www.reddit.com/r/pics/hot.json?after=t3_3aek8j

### Points to be mentioned:

#### • App is built is using Swift 5.0 and Xcode 10.2.1.
#### • No Storyboards are used, UI is coded. [Yeah, no Main.storyboard, Except launchscreen.storyboard].
#### • No Third party libraries are used. [App has a Network Layer and Image Downlader and Caching Mechanism].

### Improvements can be done:

#### • Write Unit test cases.
#### • Properly show errors in the screen.
#### • More Optimization in Caching and Network layer. [Like retry and all isn't implemented.]
#### • Loading animation whereever required.[Like in the preview, when Image is loading]

### • Instructions:

#### • Open the app in Xcode 10.2.1.
#### • Swift version is 5.0.
#### • To run the app, CMD + R.
#### • Disable unwanted OS activity by - From Xcode menu open: Product > Scheme > Edit Scheme, On your Environment Variables set OS_ACTIVITY_MODE = disable 

#### Thanks for your time for reading this long document :D

### Best, Subhodip
