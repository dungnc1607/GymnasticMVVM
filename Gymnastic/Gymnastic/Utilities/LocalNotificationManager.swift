//
//  LocalNotificationManager.swift
//  Gymnastic
//
//  Created by Squall on 9/17/18.
//  Copyright © 2018 Gymnastic. All rights reserved.
//

import Foundation
import UserNotifications

class LocalNotificationManager: NSObject {
    static var shared = LocalNotificationManager()
    let center = UNUserNotificationCenter.current()
    
    func requestAuthorization(){
        center.requestAuthorization(options: [.alert,.sound]){ (granted, error) in
            if error == nil{
                print("permission granted")
            }
        }
    }
    
    func sendLocalNotification(){
        let content = UNMutableNotificationContent()
        content.title = NSString.localizedUserNotificationString(forKey: "Vài Lời Nhắn Nhủ:", arguments: nil)
        content.body = NSString.localizedUserNotificationString(forKey: "Chăm chỉ tập luyện - tránh xa rượu bia đi anh êi!!!", arguments: nil)
        content.sound = UNNotificationSound.default()
        //trigger push noti
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "identifier", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
}
