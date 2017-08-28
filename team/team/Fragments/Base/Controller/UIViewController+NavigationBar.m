//
//  UIViewController+NavigationBar.m
//  retial
//
//  Created by wangqiqi on 2017/8/23.
//  Copyright © 2017年 duxing. All rights reserved.
//

#import "UIViewController+NavigationBar.h"
#import "DWDrawImageCacheManager.h"
#import <DWUtilKit/DWUtilKit.h>
#import <DWUtilKit/DWUtilities.h>


static const NSInteger kLeftItemsBaseTag = 168;
static const NSInteger kRightItemsBaseTag = 268;

@implementation UIViewController (NavigationBar)

- (void)setBarTitle:(NSString *)title {
    NSDictionary *fontDict = @{NSFontAttributeName: [UIFont systemFontOfSize:17],
                               NSForegroundColorAttributeName: [UIColor dw_opaqueColorWithHexString:@"#333333"]};
    self.navigationController.navigationBar.titleTextAttributes = fontDict;
    self.navigationItem.title = title;
}

- (void)setBarStyle:(UIColor *)barColor showShadow:(BOOL)show {
    self.navigationController.navigationBar.barTintColor = barColor;
    
    NSString *key = [NSString stringWithFormat:@"dw_nav_bg_%@",barColor.dw_hexStringWithAlpha];
    UIImage *backgroundImage = [[DWDrawImageCacheManager sharedInstance] imageForKey:key];
    if (!backgroundImage) {
        backgroundImage = [UIImage dw_imageWithColor:barColor size:CGSizeMake(1.0, 1.0)];
    }
    [self.navigationController.navigationBar setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
    
    if (!show) {
        [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    }
    
    UIColor *color = [UIColor dw_colorWithHexString:@"#ececec" AndAlpha:1.0];
    key = [NSString stringWithFormat:@"dw_nav_bottom_separator_line_%@", color.dw_hexStringWithAlpha];;
    UIImage *shadowImage = [[DWDrawImageCacheManager sharedInstance] imageForKey:key];
    if (!shadowImage) {
        shadowImage = [UIImage dw_imageWithColor:color size:CGSizeMake(kScreenWidth, CGFloatFromPixel(1))];
    }
    [self.navigationController.navigationBar setShadowImage:shadowImage];
}

- (NSArray<UIBarButtonItem *> *)makeNavigationBarItems:(NSArray<DWItemConfig *> *)items left:(BOOL)left{
    if (items.count == 0) {
        return nil;
    }
    NSMutableArray *mArrItems = [NSMutableArray array];
    for (NSInteger i = 0; i < items.count; i++) {
        DWItemConfig *model = items[1];
    
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.titleLabel.font = [UIFont systemFontOfSize:17];
        [button setTitleColor:[UIColor dw_opaqueColorWithHexString:@"#333333"] forState:UIControlStateNormal];
        
        if (model.title) {
            [button setTitle:model.title forState:UIControlStateNormal];
        }
        
        if (model.normlaImage) {
            [button setImage:model.normlaImage forState:UIControlStateNormal];
        }
        if (model.highlightedImage) {
            [button setImage:model.highlightedImage forState:UIControlStateHighlighted];
        } else if (model.normlaImage) {
            [button setImage:model.normlaImage forState:UIControlStateHighlighted];
        }
        
        button.tag = left ? kLeftItemsBaseTag + i : kRightItemsBaseTag + i;
        if (left) {
            [button addTarget:self action:@selector(_dw_didTapLeftButton:) forControlEvents:UIControlEventTouchUpInside];
        } else {
            [button addTarget:self action:@selector(_dw_didTapRightButton:) forControlEvents:UIControlEventTouchUpInside];
        }
        UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
        [mArrItems addObject:item];
    }
    return mArrItems;
}

#pragma mark - Event Respond

- (void)_dw_didTapLeftButton:(UIButton *)sender {
    NSInteger index = sender.tag - kLeftItemsBaseTag;
    if (index >= self.navigationItem.leftBarButtonItems.count ) {
        NSAssert(NO, @"You should check setup tag.");
        return;
    }
    if (![self conformsToProtocol:@protocol(DWBarButtonEventRespondDelegate)]) {
        [self.navigationController popViewControllerAnimated:YES];
    }
    
    id target = (id<DWBarButtonEventRespondDelegate>)self;
    if ([target respondsToSelector:@selector(dw_leftBarButton:didClickAtIndex:)]) {
        [target dw_leftBarButton:sender didClickAtIndex:index];
    }
    
}

- (void)_dw_didTapRightButton:(UIButton *)sender {
    NSInteger index = sender.tag - kRightItemsBaseTag;
    if (index >= self.navigationItem.rightBarButtonItems.count ) {
        NSAssert(NO, @"You should check setup tag.");
        return;
    }
    if (![self conformsToProtocol:@protocol(DWBarButtonEventRespondDelegate)]) {
        return;
    }
    
    id target = (id<DWBarButtonEventRespondDelegate>) self;
    if ([target respondsToSelector:@selector(dw_rightBarButton:didClickAtIndex:)]) {
        [target dw_rightBarButton:sender didClickAtIndex:index];
    }
}

@end

@implementation DWItemConfig

@end
