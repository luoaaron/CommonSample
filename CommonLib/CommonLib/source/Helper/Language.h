//
//  Language.h
//  GamificationShoppingMall
//
//  Created by Frank on 14-6-12.
//  Copyright (c) 2014年 Frank. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"


@interface Language : NSObject

+(void)initialize;
+(void)setLanguage:(NSString *)l;
+(NSString *)getLocalizedString:(NSString *)key alter:(NSString *)alternate;

+ (NSString *)loadPreferLanguage;
+ (BOOL) setPreferences:(NSString *)language;

+(void)changeLanguage;
@end
