//
//  Language.m
//  GamificationShoppingMall
//
//  Created by Frank on 14-6-12.
//  Copyright (c) 2014年 Frank. All rights reserved.
//

#import "Language.h"
#import "UtilsMacro.h"

@implementation Language

static NSBundle *bundle = nil;

+(void)initialize {
//    NSUserDefaults *defs = [NSUserDefaults standardUserDefaults];
//    NSArray *languages = [defs objectForKey:@"AppleLanguages"];
//    NSString *current = [languages objectAtIndex:0];
//    [self setLanguage:current];        
}

+(void)setLanguage:(NSString *)l {
    NSLog(@"preferredLang: %@", l);
    NSString *path = [[NSBundle mainBundle] pathForResource:l ofType:@"lproj"];
    bundle = [NSBundle bundleWithPath:path];
}
              
+(NSString *)getLocalizedString:(NSString *)key alter:(NSString *)alternate {
    return [bundle localizedStringForKey:key value:alternate table:nil];
}

+ (NSString *)loadPreferLanguage {
    NSArray *array = [[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"];
    // Does preference exist...
    NSString *preferLang;
    if ([[NSUserDefaults standardUserDefaults] valueForKey:USER_LANGUAGE] != nil) {
        preferLang = [[NSUserDefaults standardUserDefaults] valueForKey:USER_LANGUAGE];
    } else {
        NSString *defaultLang = [array objectAtIndex:0];
        if ([PARAM_LANG_ZH isEqualToString:defaultLang] || [PARAM_LANG_ZH_H isEqualToString:defaultLang]) {
            preferLang = PARAM_LANG_ZH_H;
        } else {
            preferLang = PARAM_LANG_EN;
        }
    }
    //    [Language setLanguage:preferLang];
    return preferLang;
}


/*---------------------------------------------------------------------------
 * Write preferences to system
 *--------------------------------------------------------------------------*/
+ (BOOL) setPreferences:(NSString *)language {
    // Set values
    [[NSUserDefaults standardUserDefaults] setValue:language forKey:USER_LANGUAGE];
    [Language setLanguage:language];
    
    // Return the results of attempting to write preferences to system
    return [[NSUserDefaults standardUserDefaults] synchronize];
}

+(void)changeLanguage{
    NSString *currentLanage=@"";
    if ([[UserDefaults valueForKey:USER_LANGUAGE] isEqualToString:PARAM_LANG_ZH_H]) {
        currentLanage=PARAM_LANG_EN;
    }else{
        currentLanage=PARAM_LANG_ZH_H;
    }
    if ([Language setPreferences:currentLanage]) {
        [NotificationCenter postNotificationName:LANGUAGE_DIDCHANGE_NOTIFICATION object:nil];
    }
    
    
    
}


@end
