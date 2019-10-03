//
//  AppDelegate.swift
//  Todoey
//
//  Created by Kevin Smith on 9/13/19.
//  Copyright © 2019 Kevin Smith. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    //This method happens when the app gets loaded up. Before viewDidLoad() in the initial VC
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //print(Realm.Configuration.defaultConfiguration.fileURL)


        
        do{
             _ = try Realm()
            

            
        } catch {
            print("Error in initialising new realm, \(error)")
        }
        
        return true
    }
    
    

}

