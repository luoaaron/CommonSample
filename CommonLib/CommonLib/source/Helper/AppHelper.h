//
//  AppHelper.h
//  AuthenticHK
//
//  Created by Frank Huang on 14-4-30.
//  Copyright (c) 2014年 Frank. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class AppHelper;
@protocol AppHelperDelegate <NSObject>



@end

@interface AppHelper : NSObject

@property(nonatomic,assign)id<AppHelperDelegate>delegate;


+(AppHelper*)sharedManager;
+(void) dismissKeyboard;
+(void) disableScrollsToTopPropertyOnAllSubviewsOf:(UIView *) view;
+ (NSString *) getCurrentAppVersion;
+ (UIImage *) imageWithColor:(UIColor *)color;
+ (BOOL) validateEmail:(NSString *)email;

+(float)getFirstOrigin_Y;

+(NSMutableAttributedString*)getFormatText:(NSString*)priceLeft priceRight:(NSString*)priceRight;
+(BOOL)isCameraPermited;

+(void)flashLight;
@end
