# SwiftUI-navigationBarItems-issue
navigationBarItems bug discovering

I created a button under `navigationBarItems`, and this button opens a new `sheet`, and the new sheet will pop up a window to ask user locations. However, in the new sheet, `CLLocationManager()` has been called twice, and location permission pop up window will disappear in a few seconds. When you create a regular button, the location pop up windown will be stay there until you select one of the options, and CLLocationManager() will only be called one time.

Stack Overflow
<https://stackoverflow.com/questions/59431603/swfitui-navigationbaritems-calls-location-permission-twice>
