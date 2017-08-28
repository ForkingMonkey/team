//
//  DWCommonUtil.m
//  KaiZhaLa
//
//  Created by daiwei02 on 14-11-22.
//  Copyright (c) 2014年 david. All rights reserved.
//

#import "DWCommonUtil.h"
#import "AppDelegate.h"
#import <AVFoundation/AVFoundation.h>
#import "DWURLDefine.h"
#import "MBProgressHUD.h"
#import "UIWindow+Util.h"

BOOL DWIsTwoStringsEqual(NSString *str1, NSString *str2) {
    NSString *t1 = str1 ?: @"";
    NSString *t2 = str2 ?: @"";
    return [t1 isEqualToString:t2];
}

BOOL DWIsTwoArraysEqual(NSArray *arr1, NSArray *arr2) {
    if (!arr1) {
        arr1 = @[];
    }
    if (!arr2) {
        arr2 = @[];
    }
    return [arr1 isEqualToArray:arr2];
}

@implementation DWCommonUtil

+ (UINavigationController *)dw_rootNavigationController {
    UINavigationController *nav = [[UIApplication sharedApplication].delegate.window dw_rootNavigationController];
    NSAssert(!nav, @"error call dw_rootNavigationController");
    return nav;
}

// 根据指定的大小创建头像等待图片
+ (UIImage *)waitDefaultPortraitWithSize:(CGSize)size {
    return [self waitImageWithImage:[UIImage imageNamed:@"default_portrait"] size:size];
}

// 根据指定大小创建店铺等待图片
+ (UIImage *)waitDefaultShopPhotoWithSize:(CGSize)size {
    return [self waitImageWithImage:[UIImage imageNamed:@"default_shop_photo"] size:size];
}

//// 根据指定大小创建等待图片
//+ (UIImage *)waitImageWithImage:(UIImage *)waitImage size:(CGSize)size {
//    const CGSize imageSize = waitImage.size;
//    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
//    
//    if ( size.width >= imageSize.width && size.height >= imageSize.height )
//    {
//        // 目标大
//        [[UIColor dw_opaqueColorWithHexString:BACKGROUND_COLOR] set];
//        UIRectFill(CGRectMake(0, 0, size.width, size.height));
//        [waitImage drawInRect:CGRectMake((size.width - imageSize.width) / 2,
//                                         (size.height - imageSize.height) / 2,
//                                         imageSize.width,
//                                         imageSize.height)];
//    }
//    else
//    {
//        // 目标小,保持宽高比
//        if (size.width > size.height) {
//            // 以容器宽度为基准
//            [waitImage drawInRect:CGRectMake((size.width-size.height*(imageSize.width/imageSize.height)) / 2,
//                                             0,
//                                             size.height*(imageSize.width/imageSize.height),
//                                             size.height)];
//        } else {
//            // 以容器高度为基准
//            [waitImage drawInRect:CGRectMake(0,
//                                             (size.height-size.width*(imageSize.height/imageSize.width)) / 2,
//                                             size.width,
//                                             size.width*(imageSize.height/imageSize.width))];
//        }
//        
//    }
//    UIImage * resultImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    return resultImage;
//}

// 设备ID
+ (NSString *)getDeviceID {
    return [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
}

// 显示错误提示
+ (void)alert:(NSString *)tilte message:(NSString *)message
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:tilte message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    
    [alert show];
}


// 生成接口返回提示消息
+ (NSString*)dealErrorMsg:(NSString*)msg withErrorCode:(int)errorCode
{
    if (msg == nil || [@"" isEqualToString:msg]) {
        return @"未知错误";
    }
    
#ifdef DEBUG
    if ([msg rangeOfString:@"错误码"].location != NSNotFound) {
        return msg;
    } else {
        return [NSString stringWithFormat:@"%@(错误码:%d)", msg, errorCode];
    }
#else
    return msg;
#endif
}

// 保存图片
+ (void)savingImage:(NSString *)fileName Image:(UIImage *)image Type:(EDocument)type
{
    NSString *documentsDirectory = @"";
    
    if (type == EDocumentsAppIcon) {
        documentsDirectory = APPICONIMAGE;
    }
    
    if (type == EDocumentsAbstract) {
        documentsDirectory = ABSTRACTIMAGE;
    }
    
    if (type == EDocumentsCheckCode) {
        return;
    }
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:documentsDirectory]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:documentsDirectory withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    NSString *appFileName = [documentsDirectory stringByAppendingPathComponent:[DWCommonUtil getSubFilePath:fileName]];
    if ([[NSFileManager defaultManager] fileExistsAtPath:appFileName]) {
        [[NSFileManager defaultManager] removeItemAtPath:appFileName error:nil];
    }
    
    NSString *sub = [fileName copy];
    if ([sub length] > 4) {
        sub = [fileName substringFromIndex:[sub length] - 4];
        if ([sub isEqualToString:@".jpg"]) {
            
            NSData *imagesmallData = UIImageJPEGRepresentation(image, 0.9f);
            [imagesmallData writeToFile:appFileName atomically:YES];
        } else {
            
            NSData *imagesmallData = UIImagePNGRepresentation(image);
            [imagesmallData writeToFile:appFileName atomically:YES];
        }
    }

}

+ (NSString *)getSubFilePath:(NSString *)str
{
    NSString *url = [str copy];
    
    url = [url stringByReplacingOccurrencesOfString:@":" withString:@"~"];
    url = [url stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
    return url;
}

// 根据图片名称和类型获取图片地址
+ (NSString *)getFilePathByFileName:(NSString *)fileName Type:(EDocument)type
{
    NSString *filePath   = nil;
    NSString *documentsDirectory = @"";
    
    if (type == EDocumentsAppIcon)  {
        documentsDirectory  = APPICONIMAGE;
    }
    
    if (type == EDocumentsAbstract) {
        documentsDirectory  = ABSTRACTIMAGE;
    }
    
    if (type == EDocumentsCheckCode) {
        return filePath;
    }
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:documentsDirectory]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:documentsDirectory withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    filePath = [documentsDirectory stringByAppendingPathComponent:[DWCommonUtil getSubFilePath:fileName]];
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        return filePath;
    } else {
        return nil;
    }
}

@end
