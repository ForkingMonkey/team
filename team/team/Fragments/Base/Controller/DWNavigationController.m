//
//  DWNavigationViewController.m
//  retial
//
//  Created by wangqiqi on 2017/8/23.
//  Copyright © 2017年 duxing. All rights reserved.
//

#import "DWNavigationController.h"
#import <DWUtilKit/DWUtilities.h>

@interface DWNavigationController () <UIGestureRecognizerDelegate, UINavigationControllerDelegate>

@end

@implementation DWNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    kWeakSelf(wself)
    self.interactivePopGestureRecognizer.delegate = wself;
    self.delegate = wself;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    [super pushViewController:viewController animated:animated];
    self.interactivePopGestureRecognizer.enabled = NO;
}

- (UIViewController *)childViewControllerForStatusBarStyle {
    return self.topViewController;
}

#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    return YES;
}

#pragma mark - UINavigationControllerDelegate

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    BOOL enabled = ([self respondsToSelector:@selector(interactivePopGestureRecognizer)] && self.viewControllers.count > 1);
    self.interactivePopGestureRecognizer.enabled = enabled;
}

@end
