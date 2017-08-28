//
//  AppDelegate+RootViewController.h
//  retial
//
//  Created by wangqiqi on 2017/8/23.
//  Copyright © 2017年 duxing. All rights reserved.
//

#import "AppDelegate.h"
#import "DWTabBarViewController.h"
#import "DWNavigationController.h"

@interface AppDelegate (RootViewController)

@property (nonatomic, strong, readonly) DWTabBarViewController *dwMainTabBarVC;
@property (nonatomic, strong, readonly) DWNavigationController *dwLoginNavigationVC;

@end
