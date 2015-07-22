//
//  LanguageLabel.m
//  GamificationShoppingMall
//
//  Created by Frank on 14-6-24.
//  Copyright (c) 2014年 Frank. All rights reserved.
//

#import "LanguageLabel.h"

@implementation LanguageLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (id)initWithLabelTextKey:(NSString *)labelTextKey alter:(NSString *)labelAlternate{
    self=[self init];
    if (self!=nil) {
        self.labelTextKey=labelTextKey;
        self.labelAlternate=labelAlternate;
        self.text=MyLocalizedString(_labelTextKey, _labelAlternate);
    }
    return self;
}

- (id)init {
    self = [super init];
    if (self != nil) {
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(labelLanguageDidChange:) name:LANGUAGE_DIDCHANGE_NOTIFICATION object:nil];
    }
    return self;
}

-(void)setLabelTextKey:(NSString *)labelTextKey{
    self.backgroundColor = [UIColor clearColor];
    if (_labelTextKey!=labelTextKey) {
        _labelTextKey=labelTextKey;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(labelLanguageDidChange:) name:LANGUAGE_DIDCHANGE_NOTIFICATION object:nil];
        [self setText];
    }

}


-(void)setLabelAlternate:(NSString *)labelAlternate{
    if (_labelAlternate!=labelAlternate) {
        _labelAlternate=labelAlternate;
        [self setText];
    }
}

-(void)setText{
     self.text=MyLocalizedString(_labelTextKey, _labelAlternate);
}

#pragma mark - NSNotification actions
- (void)labelLanguageDidChange:(NSNotification *)notification {
    [self setText];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:LANGUAGE_DIDCHANGE_NOTIFICATION object:nil];
}

@end
