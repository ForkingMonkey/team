//
//  DWDesignStandardDefine.m
//  retial
//
//  Created by wangqiqi on 2017/8/24.
//  Copyright © 2017年 duxing. All rights reserved.
//

#import "DWDesignStandardDefine.h"
#import <DWUtilKit/UIColor+DWKit.h>

@implementation DWDesignStandardDefine

@end

@implementation UIColor (DesignStandards)

+ (UIColor *)ds_colorWithHexString:(NSString *)hexString {
    return [UIColor dw_colorWithHexString:hexString AndAlpha:1.0];
}

@end

@implementation UIFont (DesignStandards)

+ (UIFont *)ds_normalFontOfSize:(CGFloat)fontSize {
    return [UIFont systemFontOfSize:fontSize];
}

+ (UIFont *)ds_boldFontOfSize:(CGFloat)fontSize {
    return [UIFont boldSystemFontOfSize:fontSize];
}

@end
