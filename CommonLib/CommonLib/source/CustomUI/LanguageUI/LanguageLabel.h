//
//  LanguageLabel.h
//  GamificationShoppingMall
//
//  Created by Frank on 14-6-24.
//  Copyright (c) 2014年 Frank. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LanguageLabel : UILabel
@property(nonatomic,copy)NSString *labelTextKey;
@property(nonatomic,copy)NSString *labelAlternate;
- (id)initWithLabelTextKey:(NSString *)labelTextKey alter:(NSString *)labelAlternate;

@end
