//
//  DWFactoryView.h
//  retial
//
//  Created by wangqiqi on 2017/8/24.
//  Copyright © 2017年 duxing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DWFactoryView : UIView

#pragma mark - Make Label

+ (UILabel *)makeLabelWithFont:(UIFont *)font color:(UIColor *)color;

+ (UILabel *)makeLabelWithFont:(UIFont *)font color:(UIColor *)color textAligment:(NSTextAlignment)textAligment;

#pragma mark - Make Separator Line

+ (UIView *)makeLabelWithBackgrounColor:(UIColor *)bgColor;

#pragma mark - Make TableView

+ (UITableView *)makeTableViewWithTarget:(id)target style:(UITableViewStyle)style;



@end
