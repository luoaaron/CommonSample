
//
//  BaseViewController.m
//  WallpaperChina
//
//  Created by AaronLuo on 14-8-22.
//  Copyright (c) 2014年 AaronLuo. All rights reserved.
//

#import "BaseViewController.h"
#import "BaseNavigationViewController.h"
#import "AppDelegate.h"

#import "Language.h"

//NSString *loadingText = @"数据加载中";
//NSString *loadingFailText = @"数据获取失败";
//NSString *loadingFailTextRetry = @"请检查网络后点击重新加载";

@interface BaseViewController (){
    UIControl *loadingView;
    UIImageView *loadingImageView;
    UILabel *loadingLabel;
    UILabel *loadingResultLabel;
    
    NSString *loadingText;
    NSString *loadingFailText;
    NSString *loadingFailTextRetry;
    
    NSString *previousLanguage;
}

@end

@implementation BaseViewController
@synthesize rightButton = rightButton;
@synthesize rightButton2=rightButton2;
@synthesize titleLabel = titleLabel;
@synthesize logoImageView = logoImageView;

@synthesize loadingText = loadingText;
@synthesize loadingFailText = loadingFailText;
@synthesize loadingFailTextRetry = loadingFailTextRetry;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self commonInit];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:LANGUAGE_DIDCHANGE_NOTIFICATION object:nil];
    
    previousLanguage = [Language loadPreferLanguage];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(languageChanged) name:LANGUAGE_DIDCHANGE_NOTIFICATION object:nil];
    
    NSString *currentLanguage = [Language loadPreferLanguage];
    
    if ((previousLanguage != nil) && (![previousLanguage isEqualToString:currentLanguage])) {
        //ios6 会crash，要延时加载
        if (currentOS >= 7) {
            [self languageChanged];
        } else {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self languageChanged];
            });
        }
    }
}


-(void)commonInit{
    
    if (currentOS >= 7.0) {
        self.edgesForExtendedLayout=UIRectEdgeNone;
    }
    
    if (isPhone) {
        [self.view setBackgroundColor:[UIColor whiteColor]];
        self.navigationController.navigationBar.translucent = NO;
        
        //设置状态栏为白色
//        UIView *statusBarView = [[UIView alloc]initWithFrame:CGRectMake(0, -20, ScreenWidth, 20)];
//        statusBarView.backgroundColor = WhiteColor;
//        [self.navigationController.navigationBar addSubview:statusBarView];
        
        if (!titleLabel) {
            titleLabel=[[UILabel alloc] initWithFrame:CGRectMake((ScreenWidth-200)/2, 0, 200, 44)];
            titleLabel.font=[UIFont boldSystemFontOfSize:20];
            [titleLabel setBackgroundColor:ClearColor];
            [titleLabel setTextColor:UIColorFromRGB(0xacacac)];
            [titleLabel setTextAlignment:NSTextAlignmentCenter];
        }
        self.navigationItem.titleView=titleLabel;
        
        self.navigationItem.leftBarButtonItem= [[UIBarButtonItem alloc] initWithCustomView:[[UIButton alloc]init]];
        
  
    }else{
    

    }
}


-(void)createNavigationLeftButtonWithTitle:(NSString *)title image:(NSString*)imageName{
    
    UIButton *leftButton=UIButtonCustom;
    leftButton.frame=CGRectMake(0, 0, 40,28);
    if (title != nil) {
        [leftButton setTitle:title forState:UIControlStateNormal];
    }
    if (imageName != nil) {
        [leftButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
    [leftButton addTarget:self action:@selector(leftButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [leftButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [leftButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
    UIBarButtonItem *back=[[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem=back;
    
}
-(void)createNavigationRightButtonWithTitle:(NSString *)title image:(NSString*)imageName{
    if (!rightButton) {
        rightButton =UIButtonCustom;
        

        if (title != nil) {
            [rightButton setTitle:title forState:UIControlStateNormal];
            rightButton.frame=CGRectMake(0, 0, 45, 25);
        }
        if (imageName != nil) {
            rightButton.frame=CGRectMake(0, 0, 25, 25);
            [rightButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        }
        [rightButton addTarget:self action:@selector(rightButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [rightButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
        UIBarButtonItem *rightButtonItem=[[UIBarButtonItem alloc] initWithCustomView:rightButton];
        self.navigationItem.rightBarButtonItem=rightButtonItem;
    }
}

-(void)createNavigationRightSecondButtonWithTitle:(NSString *)title image:(NSString*)imageName
{
    if (!rightButton2) {
        rightButton2 =UIButtonCustom;
        rightButton2.frame=CGRectMake(rightButton.frame.origin.x - 10 - 25, 0, 25, self.navigationController.navigationBar.frame.size.height);
        
        if (title != nil) {
            [rightButton2 setTitle:title forState:UIControlStateNormal];
        }
        if (imageName != nil) {
            [rightButton2 setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        }
        [rightButton2 addTarget:self action:@selector(rightButtonAction2:) forControlEvents:UIControlEventTouchUpInside];
        [rightButton2.titleLabel setFont:[UIFont systemFontOfSize:15]];
//        UIBarButtonItem *rightButtonItem=[[UIBarButtonItem alloc] initWithCustomView:rightButton2];
        [self.navigationController.navigationBar addSubview:rightButton2];
    }
}
 
-(void)leftButtonAction:(UIButton *)button{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)rightButtonAction:(UIButton *)button
{

}

-(void)rightButtonAction2:(UIButton *)button{
    
}

-(void) setHideTabbarWhenPush:(BOOL)hide{
    BaseNavigationViewController *navVC = self.navigationController;
    [navVC setHideTabbarWhenPush:hide];
}



#pragma  mark cover loading view
-(void)addCoverLoadingViewEqualSizeTo:(UIView*)toView parentView:(UIView*)parentV
{
    int offsetY = 0;
    UIView *shouldCoverView;
    UIView *parentView;
    if (toView == nil) {
        shouldCoverView = self.view;
        offsetY = -80;
    } else {
        shouldCoverView = toView;
        offsetY = -30;
    }
    
    if (parentV == nil) {
        parentView = self.view;
    } else {
        parentView = parentV;
    }
    
    if (!loadingView) {
        loadingView = [[UIControl alloc] init];
        loadingView.frame = shouldCoverView.frame;
        loadingView.center = shouldCoverView.center;
    } else {
        //        return ;
    }
    [loadingView removeTarget:self action:@selector(clickToReload) forControlEvents:UIControlEventTouchUpInside];
    
    loadingView.backgroundColor = UIColorFromRGB(0xffffff);
    
    if (!loadingImageView) {
        loadingImageView = [[UIImageView alloc]init];
//        loadingImageView.frame = CGRectMake((shouldCoverView.frame.size.width-36)/2, (shouldCoverView.frame.size.height-loadingImageView.frame.size.height)/2, 36, 36);
        loadingImageView.frame = CGRectMake(0,0, 36, 36);
        CGPoint center = shouldCoverView.center;
        center.y = center.y + offsetY;
        loadingImageView.center = center;
        [loadingView addSubview:loadingImageView];
    }
    [loadingImageView setImage:[UIImage imageNamed:@"loading.png"]];
    [self startLoadingAnimation];
    
    int labelHeight = 20;
    int labelWidth = 200;
    if (!loadingLabel) {
        loadingLabel = [[UILabel alloc]initWithFrame:CGRectMake((ScreenWidth-labelWidth)/2, loadingImageView.frame.origin.y + loadingImageView.frame.size.height + 8, labelWidth, labelHeight)];
        loadingLabel.textColor = UIColorFromRGB(0x606060);
        [loadingLabel setTextAlignment:NSTextAlignmentCenter];
        [loadingLabel setFont:[UIFont systemFontOfSize:16]];
        [loadingView addSubview:loadingLabel];
    }
    [loadingLabel setText:loadingText];
    
    if (!loadingResultLabel) {
        loadingResultLabel = [[UILabel alloc]initWithFrame:CGRectMake((ScreenWidth-200)/2, loadingLabel.frame.origin.y + loadingLabel.frame.size.height + 6, 200, labelHeight)];
        loadingResultLabel.textColor = UIColorFromRGB(0x707070);
        [loadingResultLabel setTextAlignment:NSTextAlignmentCenter];
        [loadingResultLabel setText:loadingFailTextRetry];
        [loadingResultLabel setFont:[UIFont systemFontOfSize:14]];
        [loadingView addSubview:loadingResultLabel];
    }
    [loadingResultLabel setHidden:YES];
    
    
    [parentView addSubview:loadingView];
}

- (void)startLoadingAnimation
{
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
    rotationAnimation.duration = 0.8;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = 1000;
    
    [loadingImageView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

-(void)showLoadFailView
{
    [loadingView addTarget:self action:@selector(clickToReload) forControlEvents:UIControlEventTouchUpInside];

    [loadingLabel setText:loadingFailText];
    
    [loadingImageView.layer removeAnimationForKey:@"rotationAnimation"];
    [loadingImageView setImage:[UIImage imageNamed:@"loading_failed.png"]];
    [loadingResultLabel setHidden:NO];
}
-(void)clickToReload
{
    
}
-(void)removeLoadingView
{
    if (loadingView) {
        [loadingView removeFromSuperview];
        loadingView = nil;
        loadingLabel = nil;
        loadingImageView = nil;
        loadingResultLabel = nil;
        
    }
    [loadingView removeTarget:self action:@selector(clickToReload) forControlEvents:UIControlEventTouchUpInside];

}

-(void)languageChanged{
    NSLog(@"language change");
    
    loadingText = MyLocalizedString(@"app.logading", @"Loading...");
    
    self.loadingText  = loadingText;
    self.loadingFailText = MyLocalizedString(@"app.logadingfail", @"Load data fail");
    self.loadingFailTextRetry = MyLocalizedString(@"app.logadingfailretry", @"Pease check the network and click to reload");
}


#pragma mark progress hub
- (void)addActivityView:(NSString *)text{
    if (_progressHUD==nil) {
        _progressHUD=[[MBProgressHUD alloc] initWithView:self.view];
    }
    if (nil==_progressHUD.superview) {
        [self.view addSubview:_progressHUD];
        _progressHUD.dimBackground=YES;
        [_progressHUD show:YES];
    }
    _progressHUD.labelText=text;
}
- (void)removeActivityView:(NSString *)text{
    if (nil != _progressHUD && nil != [_progressHUD superview]) {
        if (nil != text) {
            _progressHUD.removeFromSuperViewOnHide = YES;
            _progressHUD.labelText = text;
            _progressHUD.mode = MBProgressHUDModeText;
            [_progressHUD hide:YES afterDelay:1.4f];
        } else {
            _progressHUD.removeFromSuperViewOnHide = YES;
            [_progressHUD hide:YES];
        }
    }
    
}

@end
