//
//  AppDelegate.swift
//  PathMarkDriver
//
//  Created by Dishant Rajput on 17/07/23.
//
// 0=send, 1=accepted, 2=PickupArrived, 3=RideStart,4=dropStatus,5=PaymentDone,6=Driver Not available

import UIKit
import Firebase

import UserNotifications

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate, MessagingDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        FirebaseApp.configure()
        
        if #available(iOS 10.0, *) {
            // For iOS 10 display notification (sent via APNS)
            UNUserNotificationCenter.current().delegate = self
            
            let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
            UNUserNotificationCenter.current().requestAuthorization(
                options: authOptions,
                completionHandler: { _, _ in }
            )
        } else {
            let settings: UIUserNotificationSettings =
            UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            application.registerUserNotificationSettings(settings)
        }
        
        application.registerForRemoteNotifications()
        
        Messaging.messaging().delegate = self
        self.fetchDeviceToken()
        
        return true
    }
    
    // MARK:- FIREBASE NOTIFICATION -
    @objc func fetchDeviceToken() {
        
        Messaging.messaging().token { token, error in
            if let error = error {
                print("Error fetching FCM registration token: \(error)")
            } else if let token = token {
                print("FCM registration token: \(token)")
                // self.fcmRegTokenMessage.text  = "Remote FCM registration token: \(token)"
                
                let defaults = UserDefaults.standard
                defaults.set("\(token)", forKey: "key_my_device_token")
                
                
            }
        }
        
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Error = ",error.localizedDescription)
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
        print(userInfo)
    }

    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any],
                     fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        
        print(userInfo)
        
        completionHandler(UIBackgroundFetchResult.newData)
    }
    
    /*func registerForRemoteNotification() {
        UIApplication.shared.registerUserNotificationSettings(UIUserNotificationSettings(types: [.sound, .alert, .badge], categories: nil))
        UIApplication.shared.registerForRemoteNotifications()
    }*/

    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        print("Firebase registration token: \(String(describing: fcmToken))")
        let dataDict:[String: String] = ["token": fcmToken ?? ""]
        NotificationCenter.default.post(name: Notification.Name("FCMToken"), object: nil, userInfo: dataDict)
        
        let defaults = UserDefaults.standard
        // deviceToken
//                defaults.set("\(token)", forKey: "deviceToken")
        defaults.set("\(fcmToken!)", forKey: "key_my_device_token")
        
         print("\(fcmToken!)")
        
        
    }

    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
        print("Firebase registration token: \(fcmToken)")
    }
    
    
    // MARK:- WHEN APP IS IN FOREGROUND - ( after click popup ) -
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        //print("User Info = ",notification.request.content.userInfo)
        // completionHandler([.alert, .badge, .sound])
        completionHandler([ .badge, .sound])
        
        // print("User Info dishu = ",notification.request.content.userInfo)
        
        let dict = notification.request.content.userInfo
        // print(dict as Any)
        /*
         [AnyHashable("CustomerImage"): , AnyHashable("RequestPickupAddress"): Sector 10 Dwarka, South West Delhi New Delhi, India - 110075, AnyHashable("message"): New booking request for Confir or Cancel., AnyHashable("RequestDropAddress"): Anand Vihar ISBT Anand Vihar ISBT, AnyHashable("CustomerPhone"): 6867675443, AnyHashable("aps"): {
             alert = "New booking request for Confir or Cancel.";
         }, AnyHashable("bookingTime"): 18:47, AnyHashable("gcm.message_id"): 1700140690230914, AnyHashable("google.c.a.e"): 1, AnyHashable("deviceToken"): cERsVVQO20uFlSaTcL-Hja:APA91bESSOIVSib7_WIotOESPOMLXZb9UI9VyGgveP__TOMJvSQp3l7a8wf2mC-eOWPpGtRbTDjc68YS9J_7-kWNKpEdFHvn21ct8dy2NKTeGlUacspwELD6wMQ24oy11sZHYv0kPoj9, AnyHashable("RequestPickupLatLong"): 28.587281349489444,77.06067711805619, AnyHashable("CustomerName"): p driver 128, AnyHashable("google.c.sender.id"): 750959835757, AnyHashable("distance"): 22.2, AnyHashable("type"): request, AnyHashable("google.c.fid"): cERsVVQO20uFlSaTcL-Hja, AnyHashable("device"): iOS, AnyHashable("bookingId"): 112, AnyHashable("RequestDropLatLong"): 28.648769385019264,77.31538319058018, AnyHashable("bookingDate"): 2023-11-30]
         */
        /*
         User Info dishu =  [AnyHashable("rating"): 5, AnyHashable("google.c.fid"): cERsVVQO20uFlSaTcL-Hja, AnyHashable("bookingTime"): 18:47, AnyHashable("driverName"): new2, AnyHashable("estimatedPrice"): 22.2, AnyHashable("driverId"): 92, AnyHashable("RequestPickupLatLong"): 28.587281349489444,77.06067711805619, AnyHashable("RequestDropAddress"): Anand Vihar ISBT Anand Vihar ISBT, AnyHashable("bookingId"): 112, AnyHashable("RequestDropLatLong"): 28.648769385019264,77.31538319058018, AnyHashable("aps"): {
             alert = "new2 has confirmed your booling.";
         }, AnyHashable("type"): confirm, AnyHashable("VehicleColor"): red, AnyHashable("DriverImage"): https://demo4.evirtualservices.net/pathmark/img/uploads/users/1698962672PLUDIN_1698930400026.png, AnyHashable("vehicleNumber"): yuw62782, AnyHashable("driverContact"): 5623528523, AnyHashable("totalTime"): 1 hour 4 mins, AnyHashable("RequestPickupAddress"): Sector 10 Dwarka, South West Delhi New Delhi, India - 110075, AnyHashable("google.c.sender.id"): 750959835757, AnyHashable("driverLatitude"): 28.6634817, AnyHashable("driverlongitude"): 77.3239864, AnyHashable("device"): Android, AnyHashable("gcm.message_id"): 1700140731959982, AnyHashable("google.c.a.e"): 1, AnyHashable("deviceToken"): cdYXssAaRRuDle5VfXQQnK:APA91bHvqhYwVtzlSTTWvL2W1d-Bs7Vm9z4SIKjI57ST3HvRX-y12IcBdqBcSeeBVTVdgoQdjXCZcpKhRQ_uyxJUPfcbI6zP1Fb3joHcyzpFsr7q1lzolQM4ZQv_azgBsHKZJ-Oh2ldw, AnyHashable("message"): new2 has confirmed your booling., AnyHashable("bookingDate"): 2023-11-30T00:00:00+0530]
         */
        // if user send request
        if (dict["type"] == nil) {
            print("NOTIFICATION FROM SOMEWHERE ELSE")
        } else if (dict["type"] as! String) == "confirm" { // when driver confirm booking
            
            // bookingTime
            if (dict["bookingTime"] != nil) {
                // open schedule screen
                print(dict as Any)
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
      
                let destinationController = storyboard.instantiateViewController(withIdentifier:"schedule_ride_details_id") as? schedule_ride_details
                    
                destinationController?.dict_get_booking_details = dict as NSDictionary
                    
                let frontNavigationController = UINavigationController(rootViewController: destinationController!)

                let rearViewController = storyboard.instantiateViewController(withIdentifier:"MenuControllerVCId") as? MenuControllerVC

                let mainRevealController = SWRevealViewController()

                mainRevealController.rearViewController = rearViewController
                mainRevealController.frontViewController = frontNavigationController
                
                DispatchQueue.main.async {
                    UIApplication.shared.keyWindow?.rootViewController = mainRevealController
                }
                
                window?.makeKeyAndVisible()
            } else {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
      
                let destinationController = storyboard.instantiateViewController(withIdentifier:"ride_status_id") as? ride_status
                    
                destinationController?.dict_get_all_data_from_notification = dict as NSDictionary
                    
                let frontNavigationController = UINavigationController(rootViewController: destinationController!)

                let rearViewController = storyboard.instantiateViewController(withIdentifier:"MenuControllerVCId") as? MenuControllerVC

                let mainRevealController = SWRevealViewController()

                mainRevealController.rearViewController = rearViewController
                mainRevealController.frontViewController = frontNavigationController
                
                DispatchQueue.main.async {
                    UIApplication.shared.keyWindow?.rootViewController = mainRevealController
                }
                
                window?.makeKeyAndVisible()
            }
            
            
            
            
            
        }  else if (dict["type"] as! String) == "arrived" { // when driver arrived at your location
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
  
            let destinationController = storyboard.instantiateViewController(withIdentifier:"ride_status_id") as? ride_status
                
            destinationController?.dict_get_all_data_from_notification = dict as NSDictionary
                
            let frontNavigationController = UINavigationController(rootViewController: destinationController!)

            let rearViewController = storyboard.instantiateViewController(withIdentifier:"MenuControllerVCId") as? MenuControllerVC

            let mainRevealController = SWRevealViewController()

            mainRevealController.rearViewController = rearViewController
            mainRevealController.frontViewController = frontNavigationController
            
            DispatchQueue.main.async {
                UIApplication.shared.keyWindow?.rootViewController = mainRevealController
            }
            
            window?.makeKeyAndVisible()
            
        }  else if (dict["type"] as! String) == "ridestart" { // when driver start your ride
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
  
            let destinationController = storyboard.instantiateViewController(withIdentifier:"ride_status_id") as? ride_status
                
            destinationController?.dict_get_all_data_from_notification = dict as NSDictionary
                
            let frontNavigationController = UINavigationController(rootViewController: destinationController!)

            let rearViewController = storyboard.instantiateViewController(withIdentifier:"MenuControllerVCId") as? MenuControllerVC

            let mainRevealController = SWRevealViewController()

            mainRevealController.rearViewController = rearViewController
            mainRevealController.frontViewController = frontNavigationController
            
            DispatchQueue.main.async {
                UIApplication.shared.keyWindow?.rootViewController = mainRevealController
            }
            
            window?.makeKeyAndVisible()
            
        }  else if (dict["type"] as! String) == "rideend" { // when driver end your ride
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
  
            let destinationController = storyboard.instantiateViewController(withIdentifier:"ride_status_id") as? ride_status
                
            destinationController?.dict_get_all_data_from_notification = dict as NSDictionary
                
            let frontNavigationController = UINavigationController(rootViewController: destinationController!)

            let rearViewController = storyboard.instantiateViewController(withIdentifier:"MenuControllerVCId") as? MenuControllerVC

            let mainRevealController = SWRevealViewController()

            mainRevealController.rearViewController = rearViewController
            mainRevealController.frontViewController = frontNavigationController
            
            DispatchQueue.main.async {
                UIApplication.shared.keyWindow?.rootViewController = mainRevealController
            }
            
            window?.makeKeyAndVisible()
            
        }
    }
    
    
    // MARK:- WHEN APP IS IN BACKGROUND - ( after click popup ) -
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print("User Info = ",response.notification.request.content.userInfo)
        
        let dict = response.notification.request.content.userInfo
        print(dict as Any)
        
        
    }
    
    
    
    
    
    
    

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}


