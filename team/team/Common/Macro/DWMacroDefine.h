//
//  DWMacroDefine.h
//  KaiZhaLa
//
//  Created by david on 14/12/24.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import <Foundation/Foundation.h>


#define CommonPageSize  15
#define MAX_BUSINESS_LEN 50              // 商户号最大长度
#define MAX_ACCOUNT_ID_LEN 50            // 账号的最大长度
#define MAX_LOGIN_PASSWORD_LEN 20        // 登录密码的最大长度
#define MAX_PHONE_INPUT_LEN  11          // 电话号码输入最大长度
#define MAX_VALIDATE_CODE_INPUT_LEN  6   // 验证码输入最大长度
#define MAX_INVITE_CODE_INPUT_LEN  6     // 邀请码输入最大长度
#define MAX_PASSWORD_INPUT_LEN  20       // 密码输入最大长度
#define MIN_PASSWORD_INPUT_LEN 6         // 密码输入最小长度
#define MAX_NICKNAME_INPUT_LEN 15        // 收货人的最大长度
#define MAX_GESTURE_LOCK_TIME  0         // 手势锁的不开启的最大时间
#define MAX_POST_NUMBER_LEN  30          // 物流单号最大值



@interface DWMacroDefine : NSObject

@end
