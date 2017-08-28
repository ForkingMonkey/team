
//
//  DWWindow.m
//  o2o
//
//  Created by wangqiqi on 2017/8/21.
//  Copyright © 2017年 duxing. All rights reserved.
//

#import "DWWindow.h"
#import <tolo/Tolo.h>

@implementation DWWindow

#ifdef DEBUG
/**
 https://stackoverflow.com/questions/39518529/motionbeganwithevent-not-called-in-appdelegate-in-ios-10/39530537#39530537
*/
- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake) {
        // TODO: 添加摇一摇事件处理
    }
}

#endif

@end
