//
//  UIViewController+NavigationBar.h
//  retial
//
//  Created by wangqiqi on 2017/8/23.
//  Copyright © 2017年 duxing. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DWBarButtonEventRespondDelegate <NSObject>

@optional
- (void)dw_leftBarButton:(UIButton *)button didClickAtIndex:(NSInteger)index;

- (void)dw_rightBarButton:(UIButton *)button didClickAtIndex:(NSInteger)index;

@end

@class DWItemConfig;
@interface UIViewController (NavigationBar)

- (void)setBarTitle:(NSString *)title;

- (void)setBarStyle:(UIColor *)barColor showShadow:(BOOL)show;

- (NSArray<UIBarButtonItem *> *)makeNavigationBarItems:(NSArray<DWItemConfig *> *)items left:(BOOL)left;

@end

@interface DWItemConfig : NSObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) UIImage *normlaImage;
@property (nonatomic, strong) UIImage *highlightedImage;

@end
