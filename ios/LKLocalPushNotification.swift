//
//  LKLocalPushNotification.swift
//  LKLocalPushNotification
//
//  Created by Long Cao on 12/6/19.
//  Copyright © 2019 Facebook. All rights reserved.
//

import Foundation

@objc(LKLocalPushNotification)
class LKLocalPushNotification: RCTEventEmitter {
  
  var notificationCenter: UNUserNotificationCenter!

  override static func requiresMainQueueSetup() -> Bool {
    return false
  }
  
  // we need to override this method and
  // return an array of event names that we can listen to
  override func supportedEvents() -> [String]! {
    return [""]
  }
  
  func runOnMainThread(_ task: @escaping ()->Void)
  {
    DispatchQueue.main.async {
      task()
    }
  }
  
  @objc func initialize(){
    self.notificationCenter = UNUserNotificationCenter.current()
    self.notificationCenter.delegate = self
    self.notificationCenter.requestAuthorization(options: [.alert, .sound]) { granted, error in
        print("notifications permission granted = \(granted), error = \(error?.localizedDescription ?? "(none)")")
    }
  }
  
  @objc func notify(_ title : String, body : String){
    let content = UNMutableNotificationContent()
    content.title = title
    content.body = body
    content.sound = UNNotificationSound.default
    let request = UNNotificationRequest(identifier: "enter", content: content, trigger: nil)
    notificationCenter.add(request, withCompletionHandler: nil)
  }
}

extension LKLocalPushNotification: UNUserNotificationCenterDelegate {

    // Needs to be implemented to receive notifications both in foreground and background
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([UNNotificationPresentationOptions.alert, UNNotificationPresentationOptions.sound])
    }
}
