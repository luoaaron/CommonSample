//
//  UtilsMacro.h
//  WallpaperChina
//
//  Created by AaronLuo  on 14-3-12.
//  Copyright (c) 2014年 AaronLuo. All rights reserved.
//

#ifndef WallpaperChina_UtilsMacro_h
#define WallpaperChina_UtilsMacro_h


#define NSStringFromInt(intValue) [NSString stringWithFormat:@"%d",intValue]

#define isPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define isPhone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)

//#define myAppDelegate ((AppDelegate *)[[UIApplication sharedApplication] delegate])

#define UserDefaults [NSUserDefaults standardUserDefaults]
#define NotificationCenter  [NSNotificationCenter defaultCenter]
#define SharedApplication   [UIApplication sharedApplication]
#define SharedAppDelegate   ([UIApplication sharedApplication].delegate)
#define MainBundle          [NSBundle mainBundle]
#define MainScreen          [UIScreen mainScreen]

#define ScreenWidth         ([[UIScreen mainScreen] bounds].size.width)
#define ScreenHeight        ([[UIScreen mainScreen] bounds].size.height)

// Colors

#define OrangeColor [UIColor orangeColor];
#define YellowColor [UIColor yellowColor]
#define RedColor    [UIColor redColor]
#define GreenColor  [UIColor greenColor]
#define BlueColor   [UIColor blueColor]
#define WhiteColor  [UIColor whiteColor]
#define BlackColor  [UIColor blackColor]
#define ClearColor  [UIColor clearColor]
#define GrayColor   [UIColor grayColor]

#define RGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

// Views

#define UIImageViewNamed(imagename) [[UIImageView alloc]initWithImage:[UIImage imageNamed:imagename]]
#define UIButtonCustom ([UIButton buttonWithType:UIButtonTypeCustom])

// Logs

#define NSLogRect(description, rect) NSLog(@"%@ : %@", description, NSStringFromCGRect(rect));
#define alert(msg) [[[UIAlertView alloc]initWithTitle:nil message:(msg) delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show]

#define currentOS [[[UIDevice currentDevice]systemVersion]floatValue]

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define MY_DocumentFilePath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define isOfflineMod [[UserDefaults objectForKey:OFFLINE_SWITCH_STATUS_KEY] boolValue]

#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

//localizedString
#define MyLocalizedString(key, alt) [Language getLocalizedString:key alter:alt]

//images
#define UIImageWithStretch(imagename) [[UIImage imageNamed:imagename] stretchableImageWithLeftCapWidth:10 topCapHeight:10];
#define UIImageWithStretchEx(imagename,x,y) [[UIImage imageNamed:imagename] stretchableImageWithLeftCapWidth:x topCapHeight:y];
#endif

