//
//  DWBaseViewController.h
//  retial
//
//  Created by wangqiqi on 2017/8/23.
//  Copyright © 2017年 duxing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <tolo/Tolo.h>
#import <AFNetworking/AFNetworkReachabilityManager.h>
#import "UIViewController+TableView.h"
#import "UIViewController+NoDataView.h"
#import "UIViewController+NavigationBar.h"

@interface DWBaseViewController : UIViewController <DWPullToRefreshDelegate,DWBarButtonEventRespondDelegate,UIGestureRecognizerDelegate>

/**
 Page title, to add statistics.
 */
@property (nonatomic, copy) NSString *pageTitle;

/**
 Default NO, In viewWillAppear call
 [self.navigationController setNavigationBarHidden:dwHiddenNavigationBar animated:YES];
 */
@property (nonatomic, assign) BOOL dwHiddenNavigationBar;

/**
 override setup UI, called in viewDidLoad().
 */
- (void)setupUI;

/**
 override setup Data, called in viewDidLoad().
 */
- (void)setupData;

/**
 override setup Constrains, default only called once.（[self.view setNeedsUpdateConstraints];.）
 */
- (void)setupViewConstraints;

/**
 override monitor network changes.
 */
- (void)doReachabilityChanged:(AFNetworkReachabilityStatus)status;

/**
 override setup vc dealloc, called in dealloc().
 */
- (void)viewControllerDealloc;


@end
