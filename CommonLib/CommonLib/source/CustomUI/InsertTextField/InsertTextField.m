//
//  InsertTextField.m
//  Temperature
//
//  Created by Aaron on 14-10-12.
//  Copyright (c) 2014年 huocc. All rights reserved.
//

#import "InsertTextField.h"

@implementation InsertTextField

@synthesize extraTag = extraTag;


//控制 placeHolder 的位置，左右缩 20
- (CGRect)textRectForBounds:(CGRect)bounds {
    [self setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];
    return CGRectInset( bounds , 9 , 0 );
}

// 控制文本的位置，左右缩 20
- (CGRect)editingRectForBounds:(CGRect)bounds {
    return CGRectInset( bounds , 9 , 0 );
}




@end
