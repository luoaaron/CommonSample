//
//  InsertTextFieldDemo.m
//  CommonLib
//
//  Created by Aaron on 15-1-7.
//  Copyright (c) 2015年 Aaron. All rights reserved.
//

#import "InsertTextFieldDemo.h"
#import "InsertTextField.h"

@interface InsertTextFieldDemo ()

@end

@implementation InsertTextFieldDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initSubViews];
}

-(void)initSubViews
{
    [self.titleLabel setText:@"InsertTextView Demo"];
    [self createNavigationLeftButtonWithTitle:@"Back" image:nil];
    
    [self.view setBackgroundColor:UIColorFromRGB(0xdcdcdc)];
    
    InsertTextField *textField = [[InsertTextField alloc] initWithFrame:CGRectMake(10, 20, 250, 30)];
    textField.backgroundColor = UIColorFromRGB(0xffffff);
    textField.placeholder = @"enter ";
    [self.view addSubview:textField];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
