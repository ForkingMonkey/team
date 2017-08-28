//
//  UIWindow+Util.m
//  retial
//
//  Created by wangqiqi on 2017/8/22.
//  Copyright © 2017年 duxing. All rights reserved.
//

#import "UIWindow+Util.h"

@implementation UIWindow (Util)

- (UINavigationController *)dw_rootNavigationController {
    UIViewController *vc = self.rootViewController;
    return [self _dw_currentNavigationController:vc];
}

- (UINavigationController *)_dw_currentNavigationController:(UIViewController *)vc {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return (UINavigationController *)vc;
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [self _dw_currentNavigationController:[(UITabBarController *)vc selectedViewController]];
    } else if(vc.presentedViewController) {
        return [self _dw_currentNavigationController:vc.presentedViewController];
    } else {
        return nil;
    }
}

@end
