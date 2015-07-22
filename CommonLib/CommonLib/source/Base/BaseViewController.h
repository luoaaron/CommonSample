//
//  BaseViewController.h
//  WallpaperChina
//
//  Created by AaronLuo on 14-8-22.
//  Copyright (c) 2014年 AaronLuo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD+Add.h"


@interface BaseViewController : UIViewController<UIScrollViewDelegate,UIWebViewDelegate>{
    UIButton *rightButton;
    UIButton *rightButton2;
    UILabel *titleLabel;
    UIImageView *logoImageView;
    
    MBProgressHUD *_progressHUD;
}

@property(nonatomic,strong) UIButton *rightButton;
@property(nonatomic,strong) UIButton *rightButton2;

@property(nonatomic,retain) UILabel *titleLabel;
@property(nonatomic,retain) UIImageView *logoImageView;

@property(nonatomic,retain) NSString *loadingText;
@property(nonatomic,retain) NSString *loadingFailText;
@property(nonatomic,retain) NSString *loadingFailTextRetry;


-(void)createNavigationLeftButtonWithTitle:(NSString *)title image:(NSString*)imageName;
-(void)createNavigationRightButtonWithTitle:(NSString *)title image:(NSString*)imageName;
-(void)createNavigationRightSecondButtonWithTitle:(NSString *)title image:(NSString*)imageName;

-(void)leftButtonAction:(UIButton *)button;
-(void)rightButtonAction:(UIButton *)button;
-(void)rightButtonAction2:(UIButton *)button;

-(void) setHideTabbarWhenPush:(BOOL)hide;

//loading 
-(void)addCoverLoadingViewEqualSizeTo:(UIView*)toView parentView:(UIView*)parentV;
-(void)removeLoadingView;
-(void)showLoadFailView;
-(void)clickToReload;

- (void)addActivityView:(NSString *)text;
- (void)removeActivityView:(NSString *)text;


-(void)languageChanged;

@end
