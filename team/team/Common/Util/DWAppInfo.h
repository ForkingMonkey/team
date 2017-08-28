//
//  DWAppInfo.h
//  retial
//
//  Created by wangqiqi on 2017/8/23.
//  Copyright © 2017年 duxing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DWAppInfo : NSObject

/**
 @return Bundle identifier
 */
+ (NSString *)dw_getBundleIdentifier;

/**
 @return Bundle version
 */
+ (NSString *)dw_getBundleVersion;

/**
 @return x.y.z版本号，不带有任何前缀字符
 */
+ (NSString *)dw_getPureVersionName;


@end
