//
//  AppDelegate.swift
//  Example for SwiftlySalesforce
//
//  For license & details see: https://www.github.com/mike4aday/SwiftlySalesforce
//  Copyright (c) 2016. All rights reserved.
//
//  A simplified application illustrating the use of SwiftlySalesforce, including
//  OAuth2 authentication "dance" and interacting with the Salesforce REST API.
//

import UIKit
import SwiftlySalesforce


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, LoginViewPresentable {
	
	/// Salesforce Connected App settings
	let consumerKey = "3MVG91ftikjGaMd_SSivaqQgkik_rz_GVRYmFpDR6yDaUrEfpC0vKqisPMY1klyH78G9Ockl2p7IJuqRk07nQ"
	let redirectURL = NSURL(string: "taskforce://authorized")!
	
	var window: UIWindow?
	
	func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
		// Configure the Salesforce authentication manager with Connected App settings
		OAuth2Manager.sharedInstance.configureWithConsumerKey(consumerKey, redirectURL: redirectURL)
		OAuth2Manager.sharedInstance.authenticationDelegate = self
		return true
	}
	
	func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
		handleRedirectURL(url)
		return true
	}
}