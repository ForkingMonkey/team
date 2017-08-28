//
//  AppDelegate+RootViewController.m
//  retial
//
//  Created by wangqiqi on 2017/8/23.
//  Copyright © 2017年 duxing. All rights reserved.
//

#import "AppDelegate+RootViewController.h"
#import <objc/runtime.h>
#import <tolo/Tolo.h>
#ifdef DEBUG
#import <FLEX/FLEX.h>
#endif

static void *kMainTabBarViewControllerKey = &kMainTabBarViewControllerKey;
static void *kLoginNavigationViewControllerKey = &kLoginNavigationViewControllerKey;

@implementation AppDelegate (RootViewController)

- (DWTabBarViewController *)dwMainTabBarVC {
    DWTabBarViewController *tabBar =  objc_getAssociatedObject(self, kMainTabBarViewControllerKey);
    
    if (!tabBar) {
        tabBar = [[DWTabBarViewController alloc] init];
        
        UIViewController *vc1 = [[UIViewController alloc] init];
        DWNavigationController *nav1 = [self tabBarItemWithVC:vc1 title:@"门店" normalImage:[UIImage imageNamed:@""] selectedImage:[UIImage imageNamed:@""]];
        
        UIViewController *vc2 = [[UIViewController alloc] init];
        DWNavigationController *nav2 = [self tabBarItemWithVC:vc2 title:@"订单" normalImage:[UIImage imageNamed:@""] selectedImage:[UIImage imageNamed:@""]];
        
        UIViewController *vc3 = [[UIViewController alloc] init];
        DWNavigationController *nav3 = [self tabBarItemWithVC:vc3 title:@"消息" normalImage:[UIImage imageNamed:@""] selectedImage:[UIImage imageNamed:@""]];
        
        UIViewController *vc4 = [[UIViewController alloc] init];
        DWNavigationController *nav4 = [self tabBarItemWithVC:vc4 title:@"我的" normalImage:[UIImage imageNamed:@""] selectedImage:[UIImage imageNamed:@""]];
        
        tabBar.viewControllers = @[nav1, nav2, nav3, nav4];
        objc_setAssociatedObject(self, kMainTabBarViewControllerKey, tabBar, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return tabBar;
}

- (DWNavigationController *)dwLoginNavigationVC {
    DWNavigationController *nav = objc_getAssociatedObject(self, kLoginNavigationViewControllerKey);
    if (!nav) {
        UIViewController *vc = [[UIViewController alloc] init];
        nav = [[DWNavigationController alloc] initWithRootViewController:vc];
        objc_setAssociatedObject(self, kLoginNavigationViewControllerKey, nav, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return nav;
}

- (DWNavigationController *)tabBarItemWithVC:(UIViewController *)vc
                                           title:(NSString *)title
                                     normalImage:(UIImage *)normalImage
                                   selectedImage:(UIImage *)selectedImage {
    if (!vc) {
        return nil;
    }
    vc.title = title;
    DWNavigationController *nav = [[DWNavigationController alloc] initWithRootViewController:vc];
    nav.tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:normalImage selectedImage:[selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    return nav;
}

#pragma mark - Event Respond

#ifdef DEBUG

//SUBSCRIBE(DWShakeEvent) {
//    [[FLEXManager sharedManager] showExplorer];
//}

#endif

@end

