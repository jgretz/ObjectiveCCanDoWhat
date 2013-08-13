//
//  AppDelegate.m
//  Example
//
//  Created by Joshua Gretz on 8/12/13.
//  Copyright (c) 2013 Gretz. All rights reserved.
//

#import "AppDelegate.h"
#import "MainVC.h"
#import "NSObject+IOC.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];

    self.window.rootViewController = [MainVC object];

    [self.window makeKeyAndVisible];

    return YES;
}

@end
