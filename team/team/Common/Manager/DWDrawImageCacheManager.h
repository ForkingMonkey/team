//
//  DWDrawImageCacheManager.h
//  retial
//
//  Created by wangqiqi on 2017/8/25.
//  Copyright © 2017年 duxing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DWDrawImageCacheManager : NSObject

+ (instancetype)sharedInstance;

- (UIImage *)imageForKey:(NSString *)key;

- (void)setImage:(UIImage *)image forkey:(NSString *)key;

- (void)removeImageForKey:(NSString *)key;

/**
 remove all
 */
- (void)clearMemory;

@end
