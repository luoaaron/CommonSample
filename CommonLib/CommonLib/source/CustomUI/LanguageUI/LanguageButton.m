//
//  LanguageButton.m
//  GamificationShoppingMall
//
//  Created by Frank on 14-6-24.
//  Copyright (c) 2014年 Frank. All rights reserved.
//

#import "LanguageButton.h"

@implementation LanguageButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)init {
    self = [super init];
    if (self != nil) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(buttonLanguageDidChange:) name:LANGUAGE_DIDCHANGE_NOTIFICATION object:nil];
    }
    return self;
}
- (id)initWithButtonTitleTextKey:(NSString *)titleTextKey alter:(NSString *)titleAlternate{
    self=[self init];
    if (self!=nil) {
        _titleTextKey=titleTextKey;
        _titleAlternate=titleAlternate;
        [self setText];
    }
    return self;
}

-(void)setTitleTextKey:(NSString *)titleTextKey{
    if (_titleTextKey!=titleTextKey) {
        _titleTextKey=titleTextKey;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(buttonLanguageDidChange:) name:LANGUAGE_DIDCHANGE_NOTIFICATION object:nil];
        [self setText];
    }

}
-(void)setTitleAlternate:(NSString *)titleAlternate{
    if (_titleAlternate!=titleAlternate) {
        _titleAlternate = titleAlternate;
        [self setText];
    }
}


-(void)setText{

    
    [self setTitle:MyLocalizedString(_titleTextKey, _titleAlternate) forState:UIControlStateNormal];
//    [self.titleLabel setTextColor:RedColor];
    
    
//    self.titleLabel.text=MyLocalizedString(_titleTextKey, _titleAlternate);
}

#pragma mark - NSNotification actions
- (void)buttonLanguageDidChange:(NSNotification *)notification {
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
