//
//  StarRatingDemoViewController.m
//  TestCustomTab
//
//  Created by Aaron on 14-9-26.
//  Copyright (c) 2014年 king. All rights reserved.
//

#import "TQStarRatingDemo.h"
#import "TQStarRatingView.h"

@interface TQStarRatingDemo () <StarRatingViewDelegate>
{
    UILabel *resultLabel;
}

@end

@implementation TQStarRatingDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.titleLabel setText:@"TQStarRating Demo"];
    [self createNavigationLeftButtonWithTitle:@"Back" image:nil];
    
    TQStarRatingView *starRatingView1 = [[TQStarRatingView alloc] initWithFrame:CGRectMake(20, 40, 80, 16) numberOfStar:5 score:4.0];
    [self.view addSubview:starRatingView1];
    
    TQStarRatingView *starRatingView2 = [[TQStarRatingView alloc] initWithFrame:CGRectMake(20, 80, 280, 32) numberOfStar:10 score:7.5];
    [self.view addSubview:starRatingView2];

    TQStarRatingView *starRatingView3 = [[TQStarRatingView alloc] initWithFrame:CGRectMake(20, 120, 220, 32) numberOfStar:8 score:2.2];
    [starRatingView3 setRatingEnable:YES];
    [self.view addSubview:starRatingView3];
    
    TQStarRatingView *starRatingView4 = [[TQStarRatingView alloc] initWithFrame:CGRectMake(20, 160, 120, 32) numberOfStar:5 score:2.5];
    [starRatingView4 setRatingEnable:YES];
    starRatingView4.delegate = self;
    [starRatingView4 setRatingUsingInt:YES];
    [self.view addSubview:starRatingView4];
    
    if (!resultLabel) {
        resultLabel = [[UILabel alloc] init];
        [resultLabel setFrame:CGRectMake(starRatingView4.frame.origin.x + starRatingView4.frame.size.width + 10, starRatingView4.frame.origin.y + 8, 100, 20)];
        [self.view addSubview:resultLabel];
    }

    
    
}

-(void)starRatingView:(TQStarRatingView *)view score:(float)score
{
    [resultLabel setText:[NSString stringWithFormat:@"%f",score]];
}
@end
