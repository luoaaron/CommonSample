//
//  PlaceHolderDemo.m
//  CommonLib
//
//  Created by Aaron on 15-1-6.
//  Copyright (c) 2015年 Aaron. All rights reserved.
//

#import "PlaceHolderTextViewDemo.h"
#import "PlaceholderTextView.h"

@interface PlaceHolderTextViewDemo ()

@end

@implementation PlaceHolderTextViewDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initSubViews];
}


-(void)initSubViews
{
    [self.titleLabel setText:@"Placeholder textview Demo"];
    [self createNavigationLeftButtonWithTitle:@"Back" image:nil];
    
    [self.view setBackgroundColor:UIColorFromRGB(0xdcdcdc)];
    
    PlaceholderTextView *textView = [[PlaceholderTextView alloc] initWithFrame:CGRectMake(10, 20, 250, 100)];
//    textView.frame = CGRectMake(10, 20, 100, 100);
    [textView setPlaceholder:@"this is place holder textview"];
    [self.view addSubview:textView];
}

@end
