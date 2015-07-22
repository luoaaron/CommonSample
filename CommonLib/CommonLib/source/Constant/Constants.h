//
//  Constants.h
//  
//
//  Created by AaronLuo on 14-8-22.
//  Copyright (c) 2014年 AronLuo. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef  enum {
    ErrorCodeParseJsonError=10006,
    ErrorCodeNoConnection = 10002,
    ErrorCodeRequestTimeout=10008,
    ErrorCodeRequestUnknow=10000000000
}ErrorCode;

extern BOOL const DEBUGMODE;

extern int const APP_ID;

extern NSString* IMAGE_PREFIX;

extern int const NAVIGATION_TITLE_BAR_BACKGROUND;
extern int const BOTTOM_TAB_BAR_BACKGROUND_COLOR;
extern int const BOTTOM_TAB_BAR_TEXT_NORMAL_COLOR;
extern int const BOTTOM_TAB_BAR_TEXT_HIGHTLIGHT_COLOR;

extern NSString *const MJTableViewCellIdentifier;


//监控状态栏变化通知
extern NSString *const STATUSBAR_DIDCHANGE_NOTIFICATION;
//语言转换通知
extern NSString *const LANGUAGE_DIDCHANGE_NOTIFICATION;
//退出登录通知
extern NSString *const LOGOUT_NOTIFICATION;



extern NSString *const PARAM_LANG_EN ;
extern NSString *const PARAM_LANG_ZH ;
extern NSString *const PARAM_LANG_ZH_H;
