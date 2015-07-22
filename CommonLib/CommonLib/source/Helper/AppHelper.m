//
//  AppHelper.m
//  AuthenticHK
//
//  Created by Frank Huang on 14-4-30.
//  Copyright (c) 2014年 Frank. All rights reserved.
//

#import "FileIncluded.h"
#import <AVFoundation/AVFoundation.h>

@implementation AppHelper


+(AppHelper*)sharedManager
{
    static AppHelper *_manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [[self alloc] init];
    });
    return _manager;
}

+(void) globalResignFirstResponderRec:(UIView*) view {
    if ([view respondsToSelector:@selector(resignFirstResponder)]) {
        [view resignFirstResponder];
    }
    for (UIView * subview in [view subviews]) {
        [self globalResignFirstResponderRec:subview];
    }
}

+(void) globalResignFirstResponder {
    UIWindow * window_ = [[UIApplication sharedApplication] keyWindow];
    for (UIView * view in [window_ subviews]) {
        [self globalResignFirstResponderRec:view];
    }
}

+(void) dismissKeyboard {
    [self globalResignFirstResponder];
}

+ (NSString *) getCurrentAppVersion {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
}

+(void) disableScrollsToTopPropertyOnAllSubviewsOf:(UIView *) view {
    for (UIView *subview in view.subviews) {
        if ([subview isKindOfClass:[UIScrollView class]]) {
            ((UIScrollView *)subview).scrollsToTop = NO;
        }
        [self disableScrollsToTopPropertyOnAllSubviewsOf:subview];
    }
}


+ (UIImage *) imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1, 1);
    // create a 1 by 1 pixel context
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);   // fill it with your color
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (BOOL) validateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}



+(float)getFirstOrigin_Y{
    
    int y=0;
    if (currentOS>=7.09||currentOS<7) {
        y=0;
    }else{
        y=64;
    }
    return y;
}


+(NSMutableAttributedString*)getFormatText:(NSString*)priceLeft priceRight:(NSString*)priceRight
{
    NSString *totalStr1=priceLeft;
    NSString *totalStr2=priceRight;
    NSString *totalAndDiscountStr=[NSString stringWithFormat:@"%@ %@",priceLeft,priceRight];
    NSRange orderRange1=[totalAndDiscountStr rangeOfString:totalStr1];
    NSRange orderRange2=[totalAndDiscountStr rangeOfString:totalStr2];
    NSMutableAttributedString *orderResultStr=[[NSMutableAttributedString alloc] initWithString:totalAndDiscountStr];

    [orderResultStr addAttributes:[NSDictionary dictionaryWithObjectsAndKeys:UIColorFromRGB(0x000000),NSForegroundColorAttributeName,nil] range:orderRange2];
    
    return orderResultStr;
}


+(BOOL)isCameraPermited{
    
    NSString *mediaType = AVMediaTypeVideo;// Or AVMediaTypeAudio
    
    if (currentOS < 7.0) {
        return YES;
    }
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];
    
    //    NSLog(@"---cui--authStatus--------%d",authStatus);
    
    
    if(authStatus ==AVAuthorizationStatusRestricted){
        
        NSLog(@"Restricted");
        return NO;
        
    }else if(authStatus == AVAuthorizationStatusDenied){
        
        // The user has explicitly denied permission for media capture.
        
        NSLog(@"Denied");     //应该是这个，如果不允许的话
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                              
                                                        message:@"请在设备的\"设置-隐私-相机\"中允许访问相机。"
                              
                                                       delegate:self
                              
                                              cancelButtonTitle:@"确定"
                              
                                              otherButtonTitles:nil];
        
        [alert show];
        
        
        return NO;
        
    }
    
    return YES;
    
}


+(void)flashLight
{
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if (![device hasTorch]) {
        NSLog(@"no torch");
    }else{
        [device lockForConfiguration:nil];
        BOOL on = (device.torchMode == AVCaptureTorchModeOn);
        if (!on) {
            [device setTorchMode: AVCaptureTorchModeOn];
        }
        else
        {
            [device setTorchMode: AVCaptureTorchModeOff];
        }
        
        [device unlockForConfiguration]; 
    }
}

@end
