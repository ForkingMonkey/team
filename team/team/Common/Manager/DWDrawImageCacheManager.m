//
//  DWDrawImageCacheManager.m
//  retial
//
//  Created by wangqiqi on 2017/8/25.
//  Copyright © 2017年 duxing. All rights reserved.
//

#import "DWDrawImageCacheManager.h"

@interface DWDrawImageCacheManager ()

@property (nonatomic, strong) NSCache *cache;

@end

@implementation DWDrawImageCacheManager

+ (instancetype)sharedInstance {
    static DWDrawImageCacheManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[DWDrawImageCacheManager alloc] init];
    });
    return manager;
}

- (instancetype)init {
    if (self = [super init]) {
        _cache = [[NSCache alloc] init];
        _cache.countLimit = 20;
    }
    return self;
}

- (UIImage *)imageForKey:(NSString *)key {
    if (key.length == 0) {
        return nil;
    }
    return [self.cache objectForKey:key];
}

- (void)setImage:(UIImage *)image forkey:(NSString *)key {
    if (!image || key.length == 0) {
        return;
    }
    [self.cache setObject:image forKey:key];
}

- (void)removeImageForKey:(NSString *)key {
    if (key.length == 0) {
        return;
    }
    [self.cache removeObjectForKey:key];
}

- (void)clearMemory {
    [self.cache removeAllObjects];
}

@end
