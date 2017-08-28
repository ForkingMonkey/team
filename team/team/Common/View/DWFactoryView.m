//
//  DWFactoryView.m
//  retial
//
//  Created by wangqiqi on 2017/8/24.
//  Copyright © 2017年 duxing. All rights reserved.
//

#import "DWFactoryView.h"
#import <DWUtilKit/UIColor+DWKit.h>

@implementation DWFactoryView

+ (UILabel *)makeLabelWithFont:(UIFont *)font color:(UIColor *)color {
    return [self makeLabelWithFont:font color:color textAligment:NSTextAlignmentLeft];
}

+ (UILabel *)makeLabelWithFont:(UIFont *)font color:(UIColor *)color textAligment:(NSTextAlignment)textAligment {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.font = font;
    label.textColor = color;
    label.textAlignment = textAligment;
    return label;
}

#pragma mark - Make Separator Line

+ (UIView *)makeLabelWithBackgrounColor:(UIColor *)bgColor {
    UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
    view.backgroundColor = bgColor;
    return view;
}

#pragma mark - Make TableView

+ (UITableView *)makeTableViewWithTarget:(id)target style:(UITableViewStyle)style {
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:style];
    tableView.delegate = target;
    tableView.dataSource = target;
    tableView.tableHeaderView = [UIView new];
    tableView.tableFooterView = [UIView new];
    tableView.separatorStyle  = UITableViewCellSeparatorStyleSingleLine;
    tableView.separatorColor  = [UIColor dw_opaqueColorWithHexString:@"#ececec"];
    tableView.separatorInset  = UIEdgeInsetsMake(0, 15, 0, 0);
    return tableView;
}



@end
