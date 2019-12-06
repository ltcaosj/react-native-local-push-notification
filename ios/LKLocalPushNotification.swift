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
  
  
  @objc func notify(_ title : String, body : String){
    
  }
      
  
}
