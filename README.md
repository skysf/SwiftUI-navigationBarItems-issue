# SwiftUI-navigationBarItems-issue
navigationBarItems bug discovering

I created a button under `navigationBarItems`, and this button opens a new sheet, and the new sheet will pop up a window to ask user locations.
However, in the new sheet, the pop up window will be called twice, and it will disapear in a few seconds.
When you create a regular button, the location pop up windown will be called only one time.
