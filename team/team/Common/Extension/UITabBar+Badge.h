//
//  UITabBar+Badge.h
//  retial
//
//  Created by wangqiqi on 2017/8/25.
//  Copyright © 2017年 duxing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (Badge)

@property (nonatomic, strong) UIView *badgeView;

- (void)dw_showBadgeAtIndex:(NSInteger)index;

- (void)dw_hideBadgeAtIndex:(NSInteger)index;

@end
