//
//  KWPopoverDemo.m
//  CommonLib
//
//  Created by Aaron on 15-1-7.
//  Copyright (c) 2015年 Aaron. All rights reserved.
//

#import "KWPopoverDemo.h"
#import "KWPopoverView.h"

@interface KWPopoverDemo ()
{
    KWPopoverView *popupView;
    UIView *fram;
}

@end

@implementation KWPopoverDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initSubViews];
}

-(void)initSubViews
{
    [self.titleLabel setText:@"KWPopover Demo"];
    [self createNavigationLeftButtonWithTitle:@"Back" image:nil];
    
    
    UIButton *btnPop = UIButtonCustom;
    btnPop.backgroundColor = [UIColor redColor];
    [btnPop setTitle:@"Popup" forState:UIControlStateNormal];
    btnPop.frame = CGRectMake((ScreenWidth - 100)/2, (ScreenHeight - 30)/2, 100, 30);
    [btnPop addTarget:self action:@selector(popup:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnPop];
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self popup:nil];
    });

}

- (void)popup:(id)sender {
    
    if (!fram) {
        float frameWidth = 300;
        float frameHeight = 300;
        fram = [[UIView alloc] initWithFrame:CGRectMake((ScreenWidth - frameWidth)/2, (ScreenHeight - frameHeight)/2, frameWidth, frameHeight)];
        fram.backgroundColor = [UIColor greenColor];
        UIButton *btn = UIButtonCustom;
        btn.backgroundColor = [UIColor redColor];
        [btn setTitle:@"Dismiss" forState:UIControlStateNormal];
        btn.frame = CGRectMake((frameWidth - 100)/2, (frameHeight - 30)/2, 100, 30);
        [btn addTarget:self action:@selector(colsePopup:) forControlEvents:UIControlEventTouchUpInside];
        [fram addSubview:btn];
    }
    
    CGPoint point1 = CGPointMake(0,0);
    
    if (!popupView) {
        popupView = [[KWPopoverView alloc] initWithFrame:CGRectZero];
    }
    [popupView showPopoverAtPoint:point1 inView:self.view withContentView:fram];
}

- (void)colsePopup:(id)sender {
    [popupView dismiss];
    popupView = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
