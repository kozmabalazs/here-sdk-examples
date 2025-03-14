This example app shows how the HERE SDK can be set up to navigate to a location with a custom `LocationIndicator`. It shows usage of the default pedestrian / navigate `LocationIndicator`
assets. On top, the app shows how to customize the guidance view by setting custom zoom level and tilt.

Build instructions:
-------------------

1) Copy the `heresdk.xcframework` folder (as found in the HERE SDK package) to your app's root folder.

Note: If your framework version is different than the version shown in the _Developer's Guide_, you may need to adapt the source code of the example app.

2) Open Xcode by double-clicking the `*.xcodeproj` file.

Note: In Xcode, open the _General_ settings of the _App target_ and make sure that the HERE SDK framework appears under _Embedded Binaries_. If it does not appear, add the `heresdk.framework` to the _Embedded Binaries_ section ("Add other..." -> "Create folder references").

Please do not forget: To run the app, you need to add your HERE SDK credentials to the `AppDelegate.swift` file of your project. More information can be found in the _Get Started_ section of the _Developer's Guide_.
