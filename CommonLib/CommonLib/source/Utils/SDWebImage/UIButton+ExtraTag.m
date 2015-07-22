//
//  UIButton+ExtraTag.m
//  CATHAY
//
//  Created by Aaron on 14-11-27.
//  Copyright (c) 2014年 vizz. All rights reserved.
//
#import <objc/runtime.h>
#import "UIButton+ExtraTag.h"

static char const * const ExtraTagKey = "ExtraTag";

@implementation UIButton (ExtraTag)

@dynamic extraTag;

- (id)extraTag {
    return objc_getAssociatedObject(self, ExtraTagKey);
}

- (void)setExtraTag:(id)newExtraTag {
    objc_setAssociatedObject(self, ExtraTagKey, newExtraTag, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end
