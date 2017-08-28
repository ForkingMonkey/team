//
//  DWURLDefine.h
//  KaiZhaLa
//
//  Created by daiwei02 on 14/12/14.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import <Foundation/Foundation.h>

// BASE URL
#ifndef TEST
// 正式环境
#define DW_URL_BASE @"https://api.daodian100.com"

#else
// 测试环境
#define DW_URL_BASE @"https://tapi.daodian100.com"

#endif

@interface DWURLDefine : NSObject

@end
