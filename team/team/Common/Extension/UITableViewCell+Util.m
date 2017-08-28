//
//  UITableViewCell+Util.m
//  retial
//
//  Created by wangqiqi on 2017/8/25.
//  Copyright © 2017年 duxing. All rights reserved.
//

#import "UITableViewCell+Util.h"

@implementation UITableViewCell (Util)

- (void)dw_setSelectedBackgroundColor:(UIColor *)bgColor {
    UIImageView *bgView = [[UIImageView alloc] initWithFrame:self.bounds];
    bgView.backgroundColor = bgColor;
    [self setSelectedBackgroundView:bgView];
}

@end
