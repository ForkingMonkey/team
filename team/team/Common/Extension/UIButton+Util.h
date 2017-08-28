//
//  UIButton+Util.h
//  retial
//
//  Created by wangqiqi on 2017/8/25.
//  Copyright © 2017年 duxing. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, DWButtonType) {
    DWButtonTypeCustom = 0,
};

@class DWButtonTypeConfig;
@interface UIButton (Util)

+ (UIButton *)dw_buttonWithType:(DWButtonType)type;

+ (UIButton *)dw_buttonWithTypeConfig:(DWButtonTypeConfig *)config;

@end

@class DWButtonStateConfig;

@interface DWButtonTypeConfig : NSObject <NSCopying>  /*****/

@property (nonatomic, strong) UIFont *textFont;

@property (nonatomic, strong) DWButtonStateConfig *normal;
@property (nonatomic, strong) DWButtonStateConfig *selected;
@property (nonatomic, strong) DWButtonStateConfig *disabled;
@property (nonatomic, strong) DWButtonStateConfig *Highlighted;

+ (DWButtonTypeConfig *)dw_configWithType:(DWButtonType)type;

@end

@interface DWButtonStateConfig : NSObject <NSCopying> /*****/

@property (nonatomic, assign) CGFloat cornerRadius;
@property (nonatomic, assign) CGFloat borderWidth;
@property (nonatomic, strong) UIColor *borderColor;
@property (nonatomic, strong) UIColor *backgroundColor;
@property (nonatomic, strong) UIColor *textColor;

@end

