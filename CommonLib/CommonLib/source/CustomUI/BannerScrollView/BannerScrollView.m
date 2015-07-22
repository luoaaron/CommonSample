//
//  BannerScrollView.m
//  TestCustomTab
//
//  Created by Aaron on 14-9-29.
//  Copyright (c) 2014年 king. All rights reserved.
//

#import "BannerScrollView.h"
#import "UIImageView+WebCache.h"

@implementation BannerScrollView
{
    NSArray *picArray; // 用于存放展示的图片
    NSArray *productNameArray;
    UIScrollView *bannerScrollView;
    UIPageControl *bannerScrollPageControl;
    MCPagerView *MCPageControl;
    BOOL shouldShowPageControl;
    BOOL usingCustomPageControl;
    int pageControlAboveScrollView;
    
    BOOL shouldAutoScroll;
    float interval;
}

@synthesize delegate = delegate;

- (instancetype)initWithFrame:(CGRect)frame
{
    pageControlAboveScrollView = 20; //默认pageControl在scrollview 的下方20px
    return [super initWithFrame:frame];
}

-(void) setPicUrls:(NSArray*)picUrlArrays
{
    picArray = picUrlArrays;
}


-(void) setProductNames:(NSArray*)productNameArrays
{
    productNameArray = productNameArrays;
}

-(void) shouldShowPageControl:(BOOL)showPageControl customPageControl:(BOOL)customPageControl
{
    shouldShowPageControl = showPageControl;
    usingCustomPageControl = customPageControl;
}

-(void) setPageControlAboveScrollView:(int)margin
{
    pageControlAboveScrollView = margin;
}


-(void) setAutoScroll:(BOOL)autoScroll interval:(float)timeInterval
{
    shouldAutoScroll = autoScroll;
    interval = timeInterval;
}

-(void) setUpScrollView {
    int width = self.frame.size.width;
    int height = self.frame.size.height;
    
    bannerScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    CGPoint center = bannerScrollView.center;
    center.y = bannerScrollView.frame.origin.y + height + pageControlAboveScrollView;
    
    NSUInteger picCount = picArray.count;
    bannerScrollView.contentSize = CGSizeMake(width * picCount, 0);
    
    [bannerScrollView setBackgroundColor:[UIColor clearColor]];
    bannerScrollView.delegate = self;
    [bannerScrollView setShowsHorizontalScrollIndicator:NO];
    [bannerScrollView setPagingEnabled:YES];
    
    
    // single tap gesture recognizer
    UITapGestureRecognizer *tapGestureRecognize = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapGestureRecognizer:)];
    tapGestureRecognize.delegate = self;
    tapGestureRecognize.numberOfTapsRequired = 1;
    [bannerScrollView addGestureRecognizer:tapGestureRecognize];
    
    
    
    [self addSubview:bannerScrollView];
    
    
    // 做对应的处理
    for (int i = 0; i < picCount; i++)
    {
        UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(i * width, 0, width, height)];
        
        imageview.contentMode = UIViewContentModeScaleToFill;
        
        NSString *str = [picArray objectAtIndex:i];
        
        if ([str hasPrefix:@"http"]) {
            [imageview setImageWithURL:[NSURL URLWithString:str] placeholderImage:[UIImage imageNamed:@"default_small"]];
        } else {
            [imageview setImage:[UIImage imageNamed:str]];
        }
        
        
        [bannerScrollView addSubview:imageview];
        
        if (productNameArray) {
            if (i < productNameArray.count) {
                UILabel *label = [[UILabel alloc] init];
                [label setTextColor:[UIColor whiteColor]];
                [label setFont:[UIFont systemFontOfSize:14]];
                [label setText:productNameArray[i]];
                [label setFrame:CGRectMake(10 + i * width, height - 25, width, 20)];
                [bannerScrollView addSubview:label];
            }
        }

    }
    
    if (shouldShowPageControl) {
        
        if (!usingCustomPageControl) {
            bannerScrollPageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 0, width, 20)];
            bannerScrollPageControl.center = center;
            bannerScrollPageControl.currentPageIndicatorTintColor = UIColorFromRGB(0x0267A2);
            bannerScrollPageControl.pageIndicatorTintColor = UIColorFromRGB(0xDBDADB);
            bannerScrollPageControl.numberOfPages = picCount;
            
            [self addSubview:bannerScrollPageControl];
        } else {
            MCPageControl = [[MCPagerView alloc] initWithFrame:CGRectMake(0, 0, width, 20)];
            MCPageControl.center = center;
            
            [MCPageControl setImage:[UIImage imageNamed:@"a"]
                             highlightedImage:[UIImage imageNamed:@"a-h"]
                                       forKey:@"a"];
             NSString *pagePattern = @"";
            for (int i = 0; i < picCount; i++)
            {
                pagePattern = [NSString stringWithFormat:@"%@%@",pagePattern ,@"a"];
            }
            [MCPageControl setPattern:pagePattern];
            
            MCPageControl.delegate = self;
            [self addSubview:MCPageControl];
        }

    }
    
    
    if (shouldAutoScroll) {
        [self scrollToNext];
    }
    
}


- (void)singleTapGestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
{
    int page = (int)(bannerScrollView.contentOffset.x / bannerScrollView.frame.size.width);
        if ([self.delegate respondsToSelector:@selector(didSelectItem:)]) {
            [self.delegate didSelectItem:page];
        }
}


-(void)scrollToNext
{
    int currentPage = bannerScrollView.contentOffset.x/ScreenWidth;
    currentPage++;
    if (currentPage > picArray.count - 1) {
        currentPage = 0;
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(interval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3f];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        bannerScrollView.contentOffset = CGPointMake(currentPage*ScreenWidth, 0);
        [UIView commitAnimations];
        
        [self scrollToNext];
    });
}



#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int page = scrollView.contentOffset.x/ScreenWidth;
    if (bannerScrollPageControl) {
        bannerScrollPageControl.currentPage=page;
    }
    
    if (MCPageControl) {
        MCPageControl.page=page;
    }
    
    
    if (delegate != nil) {
        if ([delegate respondsToSelector:@selector(currentItem:)]) {
            [delegate currentItem:page];
        }
    }
}

@end
