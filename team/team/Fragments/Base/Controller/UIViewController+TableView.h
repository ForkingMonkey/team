//
//  UIViewController+TableView.h
//  retial
//
//  Created by wangqiqi on 2017/8/26.
//  Copyright © 2017年 duxing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <TPKeyboardAvoiding/TPKeyboardAvoidingTableView.h>
#import <TPKeyboardAvoiding/TPKeyboardAvoidingScrollView.h>

@protocol DWPullToRefreshDelegate <NSObject>

/***
 If pull to refresh from 'top' equal A, pull to refresh from 'bottom' equal B,
 pull to refresh from top and bottom equal A + B;
 All of the case: A, B, A + B, they should not implementation together.
 Otherwise will use 'assert' to crash in debug status.
 */

@optional
/**
 exist pull to refresh from top or bottom.
 */
- (void)dw_pullToRefreshFromTop:(BOOL)showLoadingView;
- (void)dw_pullToRefreshFromBottom:(BOOL)showLoadingView;

/**
 exist pull to refresh from top and bottom.
 */
- (void)dw_pullToRefresh:(BOOL)refresh showLoading:(BOOL)showLoadingView;

@end

@interface UIViewController (TableView)

@property (nonatomic, strong, readonly) TPKeyboardAvoidingTableView *dwPlainTableView;
@property (nonatomic, strong, readonly) TPKeyboardAvoidingTableView *dwGroupedTableView;

@end

@interface UIViewController (ScrollView)

@property (nonatomic, strong, readonly) UIScrollView *dwScrollView;

@end
