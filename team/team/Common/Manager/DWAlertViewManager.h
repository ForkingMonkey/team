//
//  DWAlertViewManager.h
//  o2o
//
//  Created by wangqiqi on 2017/3/8.
//  Copyright © 2017年 duxing. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  请求token失效以后会弹alertView，可是存在同时有几个请求的情况
 */
@interface DWAlertViewManager : NSObject

+ (instancetype)sharedManager;

- (void)dw_show;

@end
