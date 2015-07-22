//
//  BannerScrollView.h
//  TestCustomTab
//
//  Created by Aaron on 14-9-29.
//  Copyright (c) 2014年 king. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MCPagerView.h"

typedef enum {
    PAGECONTROL_NONE = 0,
    PAGECONTROL_DEFAULT,
    PAGECONTROL_CUSTOM
} PageControlType;

@protocol BannerScrollViewDelegate <NSObject>
@optional
- (void)didSelectItem:(int)index;
- (void)currentItem:(int)index;
@end

@interface BannerScrollView : UIView<UIScrollViewDelegate, UIGestureRecognizerDelegate,MCPagerViewDelegate>
{
    id <BannerScrollViewDelegate>delegate;
}

/**
 *  生成scrollview
 */
-(void) setUpScrollView;

/**
 *  加载图片
 *
 *  @param picUrlArrays
 */
-(void) setPicUrls:(NSArray*)picUrlArrays;


/**
 *  是否显示导航
 *
 *  @param showPageControl   是否显示
 *  @param customPageControl 是否使用自定义样式
 */
-(void) shouldShowPageControl:(BOOL)showPageControl customPageControl:(BOOL)customPageControl;

/**
 *  设置导航偏移量
 *
 *  @param margin
 */
-(void) setPageControlAboveScrollView:(int)margin;

/**
 *  如果要加title，就设置
 *
 *  @param productNameArrays <#productNameArrays description#>
 */
-(void) setProductNames:(NSArray*)productNameArrays;

/**
 *  设置是否自动滚动
 *
 *  @param autoScroll
 */
-(void) setAutoScroll:(BOOL)autoScroll interval:(float)timeInterval;

@property (retain,nonatomic)id <BannerScrollViewDelegate>delegate;

@end
