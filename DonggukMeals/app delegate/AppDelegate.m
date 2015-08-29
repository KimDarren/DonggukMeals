//
//  AppDelegate.m
//  DonggukMeals
//
//  Created by 1001246 on 2015. 3. 21..
//  Copyright (c) 2015년 Darren Line. All rights reserved.
//

#import "AppDelegate.h"

// Utility
#import "DRNUtility.h"
#import "DRNNetworkManager.h"

// View Controllers
#import "DRNRestaurantListNavigationController.h"
#import "DRNRestaurantListViewController.h"
#import "DRNTabBarController.h"

// Library
#import "GAI.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)initializeGA
{
    // Optional: automatically send uncaught exceptions to Google Analytics.
    [GAI sharedInstance].trackUncaughtExceptions = YES;
    
    // Optional: set Google Analytics dispatch interval to e.g. 20 seconds.
    [GAI sharedInstance].dispatchInterval = 20;
    
    // Optional: set Logger to VERBOSE for debug information.
    [[[GAI sharedInstance] logger] setLogLevel:kGAILogLevelVerbose];
    
    // Initialize tracker. Replace with your tracking ID.
    [[GAI sharedInstance] trackerWithTrackingId:@"UA-XXXXXXXX-X"];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    _window = [[UIWindow alloc] initWithFrame:[DRNUtility screenBounds]];
    
    // Set the view controller
    DRNRestaurantListNavigationController *navigation = [[DRNRestaurantListNavigationController alloc] init];
    DRNRestaurantListViewController *restaurantViewController = [[DRNRestaurantListViewController alloc] init];
    navigation.viewControllers = @[restaurantViewController];
    _window.rootViewController = navigation;
    
    // Make the window as key window
    [_window makeKeyAndVisible];
    [self initializeGA];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}

@end
