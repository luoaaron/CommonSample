//
//  CustomUIViewController.m
//  CommonLib
//
//  Created by Aaron on 15-1-6.
//  Copyright (c) 2015年 Aaron. All rights reserved.
//

#import "CustomUIViewController.h"
#import "PlaceHolderTextViewDemo.h"
#import "InsertTextFieldDemo.h"
#import "KWPopoverDemo.h"
#import "TQStarRatingDemo.h"
#import "HTCopyableLabelDemo.h"
#import "BannerScrollViewDemo.h"
#import "AssetsPickerDemo.h"

@interface CustomUIViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation CustomUIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _items = [[NSMutableArray alloc] init];
    [_items addObject:NSStringFromClass([PlaceHolderTextViewDemo class])];
    [_items addObject:NSStringFromClass([InsertTextFieldDemo class])];
    [_items addObject:NSStringFromClass([HTCopyableLabelDemo class])];
    [_items addObject:NSStringFromClass([KWPopoverDemo class])];
    [_items addObject:NSStringFromClass([TQStarRatingDemo class])];
    [_items addObject:NSStringFromClass([BannerScrollViewDemo class])];
    [_items addObject:NSStringFromClass([AssetsPickerDemo class])];
    
    [self createNavigationLeftButtonWithTitle:@"Back" image:nil];
    
    _tableView = [[UITableView alloc] init];
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addConstraint:[NSLayoutConstraint
                                       constraintWithItem:_tableView
                                       attribute:NSLayoutAttributeTop
                                       relatedBy:NSLayoutRelationEqual
                                       toItem:self.view
                                       attribute:NSLayoutAttributeTop
                                       multiplier:1.0
                                       constant:0]];
    [self.view addConstraint:[NSLayoutConstraint
                                       constraintWithItem:_tableView
                                       attribute:NSLayoutAttributeBottom
                                       relatedBy:NSLayoutRelationEqual
                                       toItem:self.view
                                       attribute:NSLayoutAttributeBottom
                                       multiplier:1.0
                                       constant:0]];
    [self.view addConstraint:[NSLayoutConstraint
                                        constraintWithItem:_tableView
                                        attribute:NSLayoutAttributeLeading
                                        relatedBy:NSLayoutRelationEqual
                                        toItem:self.view
                                        attribute:NSLayoutAttributeLeading
                                        multiplier:1.0
                                        constant:0] ];
    [self.view addConstraint:[NSLayoutConstraint
                                        constraintWithItem:_tableView
                                        attribute:NSLayoutAttributeTrailing
                                        relatedBy:NSLayoutRelationEqual
                                        toItem:self.view
                                        attribute:NSLayoutAttributeTrailing
                                        multiplier:1.0
                                        constant:0]];

}



#pragma mark -UITableView Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        [cell.textLabel setFont:[UIFont systemFontOfSize:15]];
    }
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    
    cell.textLabel.text= _items[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int rowHeight = 68;
    return rowHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    int sectionHeigh = 0;
    
    return sectionHeigh;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Class clazz = NSClassFromString(_items[indexPath.row]);
    UIViewController *vc = [[clazz alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
