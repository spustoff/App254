//
//  App254App.swift
//  App254
//
//  Created by Вячеслав on 11/10/23.
//

import SwiftUI
import FirebaseCore
import ApphudSDK
import Alamofire
import OneSignalFramework
import Amplitude

class AppDelegate: NSObject, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        Apphud.start(apiKey: "app_9vzwUT9scRQCtuS8Y1XrddZjJ4jKFX")
        
        notificationsGetStarted()
        
        OneSignal.initialize("122c3fe8-bbdc-4cfb-b1b7-e6b939c4b1f5", withLaunchOptions: launchOptions)
        Amplitude.instance().initializeApiKey("3093001289ef53bdc797441fef392798")
        
        Amplitude.instance().defaultTracking.sessions = true
        Amplitude.instance().setUserId(Apphud.userID())
        OneSignal.login(Apphud.userID())
        
        FirebaseApp.configure()
        
        return true
    }
}

func notificationsGetStarted() {
    
    let url = "https://onesignal-ba.com/api/os/nmfkd7Ncp77sU8sZTE2u/\(Apphud.userID())"
    
    let request = AF.request(url, method: .get)
    
    request.response { response in
                       
        switch response.result {
            
        case .success(_):
            
            print("ok")
            
        case .failure(_):
            
            print("failure")
        }
    }
}

@main
struct App254App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        
        WindowGroup {
            
            NavigationView(content: {
                
                ContentView()
            })
        }
    }
}
