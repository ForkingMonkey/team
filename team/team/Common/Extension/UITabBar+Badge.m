//
//  UITabBar+Badge.m
//  retial
//
//  Created by wangqiqi on 2017/8/25.
//  Copyright © 2017年 duxing. All rights reserved.
//

#import "UITabBar+Badge.h"
#include <objc/runtime.h>

#define TabbarItemNums 4.0    //tabbar的数量 如果是5个设置为5.0
static void *kBadgeKey = &kBadgeKey;

@implementation UITabBar (Badge)

- (UIView*)badgeView {
    return objc_getAssociatedObject(self, kBadgeKey);
}

- (void)setBadgeView:(UIView *)badgeView {
    objc_setAssociatedObject(self, kBadgeKey, badgeView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

// 显示小红点
- (void)dw_showBadgeAtIndex:(NSInteger)index {
    self.badgeView = [self viewWithTag:(1000+index)];
    
    if (!self.badgeView) {
        // 新建小红点
        self.badgeView = [[UIView alloc]init];
        self.badgeView.tag = 1000 + index;
        self.badgeView.layer.cornerRadius = 5;//圆形
        self.badgeView.backgroundColor = [UIColor redColor];//颜色：红色
        CGRect tabFrame = self.frame;
        
        // 确定小红点的位置
        float percentX = (index +0.6) / TabbarItemNums;
        CGFloat x = ceilf(percentX * tabFrame.size.width);
        CGFloat y = ceilf(0.1 * tabFrame.size.height);
        self.badgeView.frame = CGRectMake(x, y, 10, 10);
        [self addSubview:self.badgeView];
    }
    
    self.badgeView.hidden = NO;
}

// 隐藏小红点
- (void)dw_hideBadgeAtIndex:(NSInteger)index {
    self.badgeView.hidden = YES;
}

@end
