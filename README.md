# react-native-local-push-notification

## Getting started

`$ npm install react-native-local-push-notification --save`

### Mostly automatic installation

`$ react-native link react-native-local-push-notification`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-local-push-notification` and add `LKLocalPushNotification.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libLKLocalPushNotification.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainApplication.java`
  - Add `import lightkits.localpushnotification.LKLocalPushNotificationPackage;` to the imports at the top of the file
  - Add `new LKLocalPushNotificationPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-local-push-notification'
  	project(':react-native-local-push-notification').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-local-push-notification/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-local-push-notification')
  	```


## Usage
```javascript
import LKLocalPushNotification from 'react-native-local-push-notification';

// TODO: What to do with the module?
LKLocalPushNotification;
```
