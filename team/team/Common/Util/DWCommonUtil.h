//
//  DWCommonUtil.h
//  KaiZhaLa
//
//  Created by daiwei02 on 14-11-22.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <AdSupport/AdSupport.h>
#import "DWSettingUtil.h"

typedef enum
{
    EDocumentsAppIcon = 0,   // 用户图标
    EDocumentsAbstract = 1,  // 摘要图标
    EDocumentsCheckCode = 2, // 摘要图标
} EDocument;

#define DOCUMENTS_FOLDER   [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] // 获取程序根目录文件夹
#define CACHES_FOLDER      (NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0])   // 缓存目录
#define IMAGECACHE         [CACHES_FOLDER stringByAppendingPathComponent:@"ImageCache"]
#define APPICONIMAGE       [IMAGECACHE stringByAppendingPathComponent:@"AppIconImage"] //下载AppIco 图片文件夹
#define ABSTRACTIMAGE      [IMAGECACHE stringByAppendingPathComponent:@"AbstarcImage"] // 摘要图片信息
#define ROOTVIEWCONTROLLER [DWCommonUtil rootNavigationViewController]

@interface DWCommonUtil : NSObject

// 根导航
+ (UINavigationController *)dw_rootNavigationController;

// 根据指定的大小创建头像等待图片
+ (UIImage *)waitDefaultPortraitWithSize:(CGSize)size;

// 根据指定大小创建店铺等待图片
+ (UIImage *)waitDefaultShopPhotoWithSize:(CGSize)size;

// 根据指定大小创建等待图片
+ (UIImage *)waitImageWithImage:(UIImage *)waitImage size:(CGSize)size;

// 设备ID
+ (NSString *)getDeviceID;

// 轻量显示错误提示
+ (void)showErrorMsg:(NSString*)errorMsg WithErrorCode:(NSNumber*)errorCode;

// 显示错误提示
+ (void)alert:(NSString *)tilte message:(NSString *)message;

// 生成接口返回提示消息
+ (NSString*)dealErrorMsg:(NSString*)msg withErrorCode:(int)errorCode;

// 保存图片到本地缓存
+ (void)savingImage:(NSString *)fileName Image:(UIImage *)image Type:(EDocument)type;

// 根据图片名称和类型获取图片地址
+ (NSString *)getFilePathByFileName:(NSString *)fileName Type:(EDocument)type;

@end
