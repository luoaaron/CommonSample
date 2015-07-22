//
//  BannerScrollViewDemo.m
//  CommonLib
//
//  Created by Aaron on 15-1-7.
//  Copyright (c) 2015年 yc. All rights reserved.
//

#import "BannerScrollViewDemo.h"
#import "BannerScrollView.h"

@interface BannerScrollViewDemo ()<BannerScrollViewDelegate>

@end

@implementation BannerScrollViewDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initSubViews];
}

-(void)initSubViews
{
    [self.titleLabel setText:@"BannerScrollView Demo"];
    [self createNavigationLeftButtonWithTitle:@"Back" image:nil];
    
    NSArray *urls = [NSArray arrayWithObjects:@"http://pic23.nipic.com/20120908/7753849_114257499185_2.jpg",
                     @"http://pic57.nipic.com/file/20150106/2160669_225558052001_2.jpg",
                     @"http://pic57.nipic.com/file/20150104/2160669_232537988000_2.jpg",nil];
    
    /**
     *  没有pagecontrol
     */
    BannerScrollView *banner1 = [self generalBanner:urls productName:nil pagecontrolType:PAGECONTROL_NONE];
    banner1.frame = CGRectMake(0, 0, banner1.frame.size.width, banner1.frame.size.height);
    [banner1 setUpScrollView];
    [self.view addSubview:banner1];
    
    
    /**
     *  默认样式
     *
     */
    BannerScrollView *banner2 = [self generalBanner:urls productName:@"IOS开发之格式化日期时间" pagecontrolType:PAGECONTROL_DEFAULT];
    banner2.frame = CGRectMake(0, 165, banner1.frame.size.width, banner1.frame.size.height);
    [banner2 setUpScrollView];
    [self.view addSubview:banner2];
    
    /**
     *  自定义pagecontrol
     *
     */
    BannerScrollView *banner3 = [self generalBanner:urls productName:nil pagecontrolType:PAGECONTROL_CUSTOM];
    [banner3 setAutoScroll:YES interval:3];
    banner3.frame = CGRectMake(0, 330, banner1.frame.size.width, banner1.frame.size.height);
    [banner3 setUpScrollView];
    [self.view addSubview:banner3];
    
}


-(BannerScrollView *)generalBanner:(NSArray *)bannerUrls productName:(NSString*)productName pagecontrolType:(PageControlType)type
{
    //scroll view
    BannerScrollView *bannerScrollView = [[BannerScrollView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 155)];
    [bannerScrollView setPageControlAboveScrollView:-20];
    
    //first set shouldShowPageControl
    switch (type) {
        case PAGECONTROL_NONE:
            [bannerScrollView shouldShowPageControl:NO customPageControl:NO];
            break;
        case PAGECONTROL_DEFAULT:
            [bannerScrollView shouldShowPageControl:YES customPageControl:NO];
            break;
        case PAGECONTROL_CUSTOM:
            [bannerScrollView shouldShowPageControl:YES customPageControl:YES];
            break;
            
        default:
            break;
    }
    
    
    //then if wants to set title
    if (productName) {
        [bannerScrollView setProductNames:[NSArray arrayWithObject:productName]];
    }
    
    //then set setPicNames
    [bannerScrollView setPicUrls:bannerUrls];
    
    
    bannerScrollView.delegate = self;
    return bannerScrollView;
}

- (void)didSelectItem:(int)index
{
    
}
- (void)currentItem:(int)index
{
    
}


@end
