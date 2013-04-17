//
//  AppDelegate.m
//  ApiBootstraper
//
//  Created by Jeremy on 27/02/13.
//  Copyright (c) 2013 ApiBootstraper. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    rootViewController = [[RootViewController alloc] init];
    self.window.rootViewController = rootViewController.navigationController;

    [self.window makeKeyAndVisible];
    return YES;
}

@end
