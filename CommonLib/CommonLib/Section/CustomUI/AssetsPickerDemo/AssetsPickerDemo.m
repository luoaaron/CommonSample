//
//  AssetsPickerDemo.m
//  CommonLib
//
//  Created by Aaron on 15-1-8.
//  Copyright (c) 2015年 yc. All rights reserved.
//

#import "AssetsPickerDemo.h"
#import "CTAssetsPickerController.h"

@interface AssetsPickerDemo ()<CTAssetsPickerControllerDelegate>

@end

@implementation AssetsPickerDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initSubViews];
}

-(void)initSubViews
{
    [self.titleLabel setText:@"Assets Picker Demo"];
    [self createNavigationLeftButtonWithTitle:@"Back" image:nil];
    
    
    UIButton *btnPickPhoto = UIButtonCustom;
    btnPickPhoto.frame = CGRectMake(20, 20, 100, 30);
    [btnPickPhoto setTitle:@"pick photo" forState:UIControlStateNormal];
    [btnPickPhoto setBackgroundColor:[UIColor redColor]];
    [btnPickPhoto addTarget:self action:@selector(pickPhotos:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnPickPhoto];
    
    UIButton *btnPickVideo = UIButtonCustom;
    btnPickVideo.frame = CGRectMake(20, 60, 100, 30);
    [btnPickVideo setTitle:@"pick video" forState:UIControlStateNormal];
    [btnPickVideo setBackgroundColor:[UIColor redColor]];
    [btnPickVideo addTarget:self action:@selector(pickVideos:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnPickVideo];
    
    
    UIButton *btnPickAll = UIButtonCustom;
    btnPickAll.frame = CGRectMake(20, 100, 100, 30);
    [btnPickAll setTitle:@"pick all" forState:UIControlStateNormal];
    [btnPickAll setBackgroundColor:[UIColor redColor]];
    [btnPickAll addTarget:self action:@selector(pickAllItems:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnPickAll];
}


/**
 *  pic pick
 */
- (void)pickPhotos:(id)sender
{
    
    CTAssetsPickerController *picker = [[CTAssetsPickerController alloc] init];
    picker.assetsFilter = [ALAssetsFilter allPhotos];
    picker.delegate = self;
    picker.extraTag = @"1";
    
    [self presentViewController:picker animated:YES completion:NULL];
}

/**
 *  video pick
 */
- (void)pickVideos:(id)sender
{
    
    CTAssetsPickerController *picker = [[CTAssetsPickerController alloc] init];
    picker.assetsFilter = [ALAssetsFilter allVideos];
    picker.delegate = self;
    picker.extraTag = @"2";
    
    [self presentViewController:picker animated:YES completion:NULL];
}

/**
 *  assets pick
 */
- (void)pickAllItems:(id)sender
{
    
    CTAssetsPickerController *picker = [[CTAssetsPickerController alloc] init];
    picker.assetsFilter = [ALAssetsFilter allAssets];
    picker.delegate = self;
    picker.extraTag = @"3";
    
    [self presentViewController:picker animated:YES completion:NULL];
}





#pragma mark - Assets Picker Delegate

- (void)assetsPickerController:(CTAssetsPickerController *)picker didFinishPickingAssets:(NSArray *)assets
{
    [picker.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    
    if (assets && assets.count > 0) {
        for (int i = 0; i < assets.count ; i++) {
            ALAsset *asset = assets[i];
            NSDate *d = [asset valueForProperty:ALAssetPropertyDate];
            NSURL *url = [asset valueForProperty:ALAssetPropertyAssetURL];
            NSLog(@"url:  %@",url);
            NSLog(@"date: %@",d);
            NSLog(@"------------");
        }
    }
}

- (BOOL)assetsPickerController:(CTAssetsPickerController *)picker shouldSelectAsset:(ALAsset *)asset
{
    /**
     *  设置最多可以选多少个项目
     */
    if (picker.selectedAssets.count >= 4) {
        NSLog(@"最多只能选择%d张图片", 4);
        return NO;
    }
    return YES;
}


@end
