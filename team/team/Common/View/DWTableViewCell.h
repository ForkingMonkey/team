//
//  AFTableViewCell.h
//  AFToolKit
//
//  Created by wangqiqi on 2017/2/8.
//  Copyright © 2017年 wqq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DWTableViewCell : UITableViewCell

/**
 cell register tableView.
 */
@property (nonatomic, strong, readonly) UITableView *dwTableView;

/**
 default NO, diplay tableView first Cell top separator line.
 */
@property (nonatomic, assign) BOOL hideTopSeparatorLine;

/**
 default UIEdgeInsetsZero, set tableView last cell bottom separator lint edge insets.
 */
@property (nonatomic, assign) UIEdgeInsets lastEdgeInsets;

/**
 override setup UI.
 */
- (void)setupUI;

@end
