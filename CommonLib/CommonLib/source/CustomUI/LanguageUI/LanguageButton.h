//
//  LanguageButton.h
//  GamificationShoppingMall
//
//  Created by Frank on 14-6-24.
//  Copyright (c) 2014年 Frank. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LanguageButton : UIButton
@property(nonatomic,copy)NSString *titleTextKey;
@property(nonatomic,copy)NSString *titleAlternate;
- (id)initWithButtonTitleTextKey:(NSString *)titleTextKey alter:(NSString *)titleAlternate;
@end
