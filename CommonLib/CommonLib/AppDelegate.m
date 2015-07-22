//
//  AppDelegate.m
//  CommonLib
//
//  Created by Aaron on 15-1-6.
//  Copyright (c) 2015年 Aaron. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "BaseNavigationViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    CGRect bounds = [[UIScreen mainScreen] bounds];
    self.window = [[UIWindow alloc] initWithFrame:bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

    [self initCustomTabViewControllers];
    return YES;
}

-(void) initCustomTabViewControllers
{
    ViewController *vc = [[ViewController alloc] init];
    BaseNavigationViewController *VVC1Nav = [[BaseNavigationViewController alloc] initWithRootViewController:vc];
    self.window.rootViewController = VVC1Nav;
    
}

@end
