//
//  UIButton+Util.m
//  retial
//
//  Created by wangqiqi on 2017/8/25.
//  Copyright © 2017年 duxing. All rights reserved.
//

#import "UIButton+Util.h"
#import "DWDrawImageCacheManager.h"
#import <DWUtilKit/UIColor+DWKit.h>
#import <DWUtilKit/UIImage+DWKit.h>
#import <DWUtilKit/DWUtilities.h>

@implementation UIButton (Util)

+ (UIButton *)dw_buttonWithType:(DWButtonType)type {
    DWButtonTypeConfig *config = [DWButtonTypeConfig dw_configWithType:type];
    return [self dw_buttonWithTypeConfig:config];
}

+ (UIButton *)dw_buttonWithTypeConfig:(DWButtonTypeConfig *)config {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    if (!config) {
        NSAssert(NO, @"Are you funny, kid");
        return button;
    }
    
    button.titleLabel.font = config.textFont;
    [button _dw_setStateConfig:config.normal forState:UIControlStateNormal];
    [button _dw_setStateConfig:config.disabled forState:UIControlStateDisabled];
    [button _dw_setStateConfig:config.selected forState:UIControlStateSelected];
    [button _dw_setStateConfig:config.Highlighted forState:UIControlStateHighlighted];
    
    return button;
}

- (void)_dw_setStateConfig:(DWButtonStateConfig *)stateConfig forState:(UIControlState)state{
    if (!stateConfig) {
        return;
    }
    [self setTitleColor:stateConfig.textColor forState:state];
    UIImage *bg = [self _dw_setBgImageWithConfig:stateConfig];
    [self setBackgroundImage:bg forState:state];
}

- (UIImage *)_dw_setBgImageWithConfig:(DWButtonStateConfig *)stateConfig {
    NSString *bgColorkey = [stateConfig.backgroundColor dw_hexStringWithAlpha];
    NSString *borderColorKey = [stateConfig.borderColor dw_hexStringWithAlpha];
    
    NSString *key = [NSString stringWithFormat:@"button_%@_%@_%.2f_%.2f", bgColorkey, borderColorKey, stateConfig.borderWidth, stateConfig.cornerRadius];
    
    UIImage *image = [[DWDrawImageCacheManager sharedInstance] imageForKey:key];
    if (image) {
        return image;
    }
    CGFloat width = ceil(stateConfig.cornerRadius * 2 + CGFloatFromPixel(1));
    image = [UIImage dw_imageWithColor:stateConfig.backgroundColor size:CGSizeMake(width, width) borderWidth:stateConfig.borderWidth borderColor:stateConfig.borderColor cornerRadius:stateConfig.cornerRadius];
    
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(stateConfig.cornerRadius, stateConfig.cornerRadius, stateConfig.cornerRadius, stateConfig.cornerRadius) resizingMode:UIImageResizingModeStretch];
    [[DWDrawImageCacheManager sharedInstance] setImage:image forkey:key];
    return image;
}

@end

@implementation DWButtonTypeConfig

+ (DWButtonTypeConfig *)dw_configWithType:(DWButtonType)type {
    NSAssert(NO, @"Are you funny, kid, Please to do config");
    return nil;
}

- (id)copyWithZone:(NSZone *)zone {
    DWButtonTypeConfig *config = [[DWButtonTypeConfig allocWithZone:zone] init];
    config.textFont    = [_textFont copy];
    config.normal      = [_normal copy];
    config.selected    = [_selected copy];
    config.disabled    = [_disabled copy];
    config.Highlighted = [_Highlighted copy];
    return config;
}

@end

@implementation DWButtonStateConfig

- (id)copyWithZone:(NSZone *)zone {
    DWButtonStateConfig *model = [[DWButtonStateConfig allocWithZone:zone] init];
    model.cornerRadius = _cornerRadius;
    model.borderWidth = _borderWidth;
    model.borderColor = [_borderColor copy];
    model.backgroundColor = [_backgroundColor copy];
    return model;
}

@end
