//
//  DWBaseViewController.m
//  retial
//
//  Created by wangqiqi on 2017/8/23.
//  Copyright © 2017年 duxing. All rights reserved.
//

#import "DWBaseViewController.h"
#import <DWUtilKit/DWUtilities.h>
#import "DWMacroDefine.h"

@interface DWBaseViewController ()

@property (nonatomic, assign) BOOL didSetupConstraintes;

@end

@implementation DWBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // register event
    REGISTER();
    
    self.edgesForExtendedLayout = UIRectEdgeAll;
    self.extendedLayoutIncludesOpaqueBars = YES;
    self.automaticallyAdjustsScrollViewInsets = YES;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupUI];
    [self setupData];
    [self.view setNeedsUpdateConstraints];
    
    kWeakSelf(wself);
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
//        NSLog(@"Reachability: %@", AFStringFromNetworkReachabilityStatus(status));
        [wself doReachabilityChanged:status];
    }];
}

- (void)dealloc {
    [self viewControllerDealloc];
//    DWLog(@"dealloc viewController: %@", [self class]);
    UNREGISTER();
}

- (void)updateViewConstraints {
    if (!_didSetupConstraintes) {
        [self setupViewConstraints];
        _didSetupConstraintes = YES;
    }
    [super updateViewConstraints];
}

#pragma mark - Life Cycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (self.pageTitle.length == 0) {
        self.pageTitle = [self _dw_defaultUnknownPageTitle];
    }
    [self _dw_configNavigationBarHidden:_dwHiddenNavigationBar];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    if (self.pageTitle.length == 0) {
        self.pageTitle = [self _dw_defaultUnknownPageTitle];
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    // add google statistics（页面路径）

    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    
    // fix swipe back function when 3D-touch is enabled.
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
//    });
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
}

- (NSString *)_dw_defaultUnknownPageTitle {
    // use assert warning
    NSAssert(false, @"%@ no set pageTitle property.",[[self class] description]);
    return [[self class] description];
}

- (void)_dw_configNavigationBarHidden:(BOOL)hidden {
    if (!self.navigationController) {
        return;
    }
    if (self.navigationController.navigationBar.isHidden != hidden) {
        [self.navigationController setNavigationBarHidden:hidden animated:YES];
    }
}

#pragma mark - Public Methods

- (void)setupUI {}

- (void)setupData {}

- (void)setupViewConstraints {}

- (void)doReachabilityChanged:(AFNetworkReachabilityStatus)status {}

- (void)viewControllerDealloc {}

@end
