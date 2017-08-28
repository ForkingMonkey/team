//
//  DWAppInfo.m
//  retial
//
//  Created by wangqiqi on 2017/8/23.
//  Copyright © 2017年 duxing. All rights reserved.
//

#import "DWAppInfo.h"

@implementation DWAppInfo

+ (NSString *)dw_getBundleIdentifier {
    NSDictionary *dict = [[NSBundle mainBundle] infoDictionary];
    return [dict objectForKey:@"CFBundleIdentifier"];
}

+ (NSString *)dw_getBundleVersion {
    NSDictionary *dict = [[NSBundle mainBundle] infoDictionary];
    return [dict objectForKey:@"CFBundleVersion"];
}

+ (NSString *)dw_getPureVersionName {
    NSDictionary *dict = [[NSBundle mainBundle] infoDictionary];
    return [dict objectForKey:@"CFBundleShortVersionString"];
}

@end
