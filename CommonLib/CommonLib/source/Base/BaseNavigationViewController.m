//
//  BaseNavigationViewController.m
//  AuthenticHK
//
//  Created by AaronLuo Huang on 14-4-30.
//  Copyright (c) 2014年 AaronLuo. All rights reserved.
//

#import "BaseNavigationViewController.h"
#import "FileIncluded.h"

@interface BaseNavigationViewController ()
{
    BOOL hidWhenPush;
}

@end

@implementation BaseNavigationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        //default set to NO
        hidWhenPush = NO;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 5.0之后调用
    if ([self.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)]) {
        [self.navigationBar setBackgroundImage:[AppHelper imageWithColor:UIColorFromRGB(NAVIGATION_TITLE_BAR_BACKGROUND)] forBarMetrics:UIBarMetricsDefault];
    }
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count > 0)
    {
        if (hidWhenPush) {
            viewController.hidesBottomBarWhenPushed = YES;
        }
    }
    
    [super pushViewController:viewController animated:animated];
}

-(void)setHideTabbarWhenPush:(BOOL)hide
{
    hidWhenPush = hide;
}

@end

