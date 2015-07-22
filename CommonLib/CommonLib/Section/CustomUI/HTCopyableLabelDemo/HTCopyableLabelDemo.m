//
//  HTCopyableLabelDemo.m
//  CommonLib
//
//  Created by Aaron on 15-1-7.
//  Copyright (c) 2015年 Aaron. All rights reserved.
//

#import "HTCopyableLabelDemo.h"
#import "HTCopyableLabel.h"

@interface HTCopyableLabelDemo ()

@end

@implementation HTCopyableLabelDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initSubViews];
}

-(void)initSubViews
{
    [self.titleLabel setText:@"CopyableLabel Demo"];
    [self createNavigationLeftButtonWithTitle:@"Back" image:nil];
    
    HTCopyableLabel *label = [[HTCopyableLabel alloc] init];
    label.frame = CGRectMake(10, 30, 200, 20);
    label.text = @"copy me ";
    [self.view addSubview:label];
    
    
    HTCopyableLabel *label2 = [[HTCopyableLabel alloc] init];
    label2.frame = CGRectMake(10, 70, 200, 20);
    label2.text = @"try to copy a long text,abc ";
    [self.view addSubview:label2];
    
    UITextView * textview = [[UITextView alloc] initWithFrame:CGRectMake(10, 110, 200, 60)];
    [textview setBackgroundColor:[UIColor lightGrayColor]];
    [self.view addSubview:textview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
