//
//  UITableViewHeaderFooterView+Util.m
//  retial
//
//  Created by wangqiqi on 2017/8/25.
//  Copyright © 2017年 duxing. All rights reserved.
//

#import "UITableViewHeaderFooterView+Util.h"

@implementation UITableViewHeaderFooterView (Util)

- (void)dw_setBackgroundColor:(UIColor *)bgColor {
    UIImageView *bgView = [[UIImageView alloc] initWithFrame:self.bounds];
    bgView.backgroundColor = bgColor;
    self.backgroundView = bgView;
}

@end
