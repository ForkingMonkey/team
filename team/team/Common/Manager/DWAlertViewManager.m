//
//  DWAlertViewManager.m
//  o2o
//
//  Created by wangqiqi on 2017/3/8.
//  Copyright © 2017年 duxing. All rights reserved.
//

#import "DWAlertViewManager.h"
#import <UIKit/UIKit.h>

@implementation DWAlertViewManager {
    UIAlertView *_alertView;
}

+ (instancetype)sharedManager {
    static DWAlertViewManager *alertViewManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        alertViewManager = [[DWAlertViewManager alloc] init];
    });
    return alertViewManager;
}


- (instancetype)init {
    if (self = [super init]) {
        _alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"登录态已失效，需要重新登录。" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    }
    return self;
}

- (void)dw_show {
    if (!_alertView.isVisible) {
        [_alertView show];
    }
}


@end
