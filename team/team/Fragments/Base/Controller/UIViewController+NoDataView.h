//
//  UIViewController+NoDataView.h
//  retial
//
//  Created by wangqiqi on 2017/8/23.
//  Copyright © 2017年 duxing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DWNoDataView.h"

@interface UIViewController (NoDataView)

@property (nonatomic, strong, readonly) DWNoDataView *dwNoDataView;

@end
