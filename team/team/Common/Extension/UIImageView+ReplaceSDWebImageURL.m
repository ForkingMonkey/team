//
//  UIImageView+ReplaceSDWebImageURL.m
//  dodopay
//
//  Created by wangqiqi on 2017/1/12.
//  Copyright © 2017年 点点付. All rights reserved.
//

#import "UIImageView+ReplaceSDWebImageURL.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <objc/runtime.h>
#import <DWUtilKit/NSDictionary+DWKit.h>

@implementation UIImageView (ReplaceSDWebImageURL)

+ (void)load {
    // need not add [super load];
    // https://developer.apple.com/reference/objectivec/nsobject/1418815-load
    // http://stackoverflow.com/questions/34542316/does-method-load-need-to-call-super-load
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];

        SEL originalSelector = @selector(sd_setImageWithURL:placeholderImage:options:progress:completed:);
        SEL swizzledSelector = @selector(dw_setImageWithURL:placeholderImage:options:progress:completed:);

        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL didAddMethod =
        class_addMethod(class,
                        originalSelector,
                        method_getImplementation(swizzledMethod),
                        method_getTypeEncoding(swizzledMethod));

        if (didAddMethod) {
            class_replaceMethod(class,
                                swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

- (void)dw_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options progress:(SDWebImageDownloaderProgressBlock)progressBlock completed:(SDExternalCompletionBlock)completedBlock {
    
    NSString *urlString = url.absoluteString;
    NSString *headUrl = @"http://";
    if ([urlString hasPrefix:headUrl]) {
        NSArray *arrayHttp = [self.class httpUrlFromBundle];
        
        BOOL isNeedChange = YES;
        for (NSString *url in arrayHttp) {
            NSString *allUrl = [NSString stringWithFormat:@"%@%@",headUrl,url];
            if ([urlString hasPrefix:allUrl]) {
                isNeedChange = NO;
                break;
            }
        }
        if (isNeedChange) {
            NSMutableString *modifyUrlStr = [[NSMutableString alloc] initWithString:urlString];
            urlString = [modifyUrlStr stringByReplacingOccurrencesOfString:headUrl withString:@"https://"];
        }
        url = [NSURL URLWithString:urlString];
    }
    [self dw_setImageWithURL:url placeholderImage:placeholder options:options progress:progressBlock completed:completedBlock];
}

+ (NSArray *)httpUrlFromBundle {
    NSDictionary *dict = [[NSBundle mainBundle] infoDictionary];
    NSDictionary *dictATS = [dict dw_dictionaryForKey:@"NSAppTransportSecurity"];
    NSDictionary *dictED  = [dictATS dw_dictionaryForKey:@"NSExceptionDomains"];
    return dictED.allKeys;
}

@end
