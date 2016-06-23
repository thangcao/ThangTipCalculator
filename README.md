# Pre-work - *Name of App Here*

> HINT: Please
> - include this README.md in your project and fill out the information. 
> - remove all the HINT blocks in this file.

**tipCalculator** is a tip calculator application for iOS.

Submitted by: **Cao Hoang Thang**

Time spent: **24** hours spent in total

## User Stories

> HINT: mark the items you completed with [x]

The following **required** functionality is complete:

* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [x] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [ ] UI animations
* [x] Remembering the bill amount across app restarts (if <10mins)
* [x] Using locale-specific currency and currency thousands separators.
* [x] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [] List anything else that you can get done to improve the app functionality!
  - Custom new layout TipCalculator
  - Spit number people. For example: There are 2 guys paying for the toal bill $12. Each people have to pay $6.
  - Using services for tip percentage. For example: if you unsatisfied with employee ("Terrible Service"), tip percentage will be 10%. 
    * Terrbile Serivce rank is :9% -> 14%
    * Satisfactory Service rank is: 15% -> 20%
    * Excellent Service rank is: 20% -> 25%
  - User can change theme background color
  - UI of app run is run with many mobile screens 
## Video Walkthrough 

> HINT: You can put a `walkthrough.gif` file in your project folder, add to git, and use the following syntax to embed it: 
 
> `![Video Walkthrough](walkthrough.gif)` 
 
> You can also upload your image to imgur.com and embed the link here.

Here's a walkthrough of implemented user stories:

![Video Walkthrough](http://i.imgur.com/C11BIfs.gif) 

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Describe any challenges encountered while building the app.
  + Design UI for App
  + Using AutoLayout (multiple screens)
  + HomeView need to sync data with Settings
  + Change "Face image" services

## License

    Copyright [yyyy] [name of copyright owner]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
