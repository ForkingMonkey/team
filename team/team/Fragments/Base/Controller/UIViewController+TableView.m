//
//  UIViewController+TableView.m
//  retial
//
//  Created by wangqiqi on 2017/8/26.
//  Copyright © 2017年 duxing. All rights reserved.
//

#import "UIViewController+TableView.h"
#import <objc/runtime.h>

static void *kDWPlainTableViewKey = &kDWPlainTableViewKey;
static void *kDWGroupedTableViewKey = &kDWGroupedTableViewKey;
static void *kDWScrollViewKey = &kDWScrollViewKey;

@interface UIViewController (Refresh)

- (void)_dw_addRefresh:(UIScrollView *)scrollView;

@end

@implementation UIViewController (TableView)

- (TPKeyboardAvoidingTableView *)dwPlainTableView {
#ifdef DEBUG
    if (objc_getAssociatedObject(self, kDWGroupedTableViewKey)) {
        NSAssert(NO, @"dwPlainTableView and dwGroupedTableView not being used together");
    }
#endif
    TPKeyboardAvoidingTableView *tableView = objc_getAssociatedObject(self, kDWPlainTableViewKey);
    if (tableView) {
        return tableView;
    }
    
    tableView = [[TPKeyboardAvoidingTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableView.backgroundColor = [UIColor clearColor];
    tableView.tableHeaderView = [UIView new];
    tableView.tableFooterView = [UIView new];
    tableView.separatorInset  = UIEdgeInsetsMake(0, 15, 0, 0);
    
    if ([self conformsToProtocol:@protocol(UITableViewDelegate)]) {
        tableView.delegate = (id<UITableViewDelegate>)self;
    }
    if ([self conformsToProtocol:@protocol(UITableViewDataSource)]) {
        tableView.dataSource = (id<UITableViewDataSource>)self;
    }
    [self _dw_addRefresh:tableView];
    objc_setAssociatedObject(self, kDWPlainTableViewKey, tableView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return tableView;
}

- (TPKeyboardAvoidingTableView *)dwGroupedTableView {
#ifdef DEBUG
    if (objc_getAssociatedObject(self, kDWPlainTableViewKey)) {
        NSAssert(NO, @"dwPlainTableView and dwGroupedTableView not being used together");
    }
#endif
    TPKeyboardAvoidingTableView *tableView = objc_getAssociatedObject(self, kDWPlainTableViewKey);
    if (tableView) {
        return tableView;
    }
    
    tableView = [[TPKeyboardAvoidingTableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    tableView.backgroundColor = [UIColor clearColor];
    tableView.tableHeaderView = [UIView new];
    tableView.tableFooterView = [UIView new];
    tableView.separatorInset  = UIEdgeInsetsMake(0, 15, 0, 0);
    
    if ([self conformsToProtocol:@protocol(UITableViewDelegate)]) {
        tableView.delegate = (id<UITableViewDelegate>)self;
    }
    if ([self conformsToProtocol:@protocol(UITableViewDataSource)]) {
        tableView.dataSource = (id<UITableViewDataSource>)self;
    }
    [self _dw_addRefresh:tableView];
    objc_setAssociatedObject(self, kDWGroupedTableViewKey, tableView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return tableView;
}

@end

@implementation UIViewController (ScrollView)

- (UIScrollView *)dwScrollView {
    UIScrollView *scrollView = objc_getAssociatedObject(self, kDWScrollViewKey);
    if (!scrollView) {
        return scrollView;
    }
    
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
    scrollView.backgroundColor = [UIColor clearColor];
    scrollView.showsHorizontalScrollIndicator = NO;
    if ([self conformsToProtocol:@protocol(UIScrollViewDelegate)]) {
        scrollView.delegate = (id<UIScrollViewDelegate>)self;
    }
    [self _dw_addRefresh:scrollView];
    objc_setAssociatedObject(self, kDWScrollViewKey, scrollView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return scrollView;
}

@end

@implementation UIViewController (Refresh)

- (void)_dw_addRefresh:(UIScrollView *)scrollView {
//    if (![self conformsToProtocol:@protocol(DWPullToRefreshDelegate)] || !scrollView) {
//        return;
//    }
//    id target = (id<DWPullToRefreshDelegate>)self;
//    __weak typeof(target) weakTarget = target;
//    if ([target respondsToSelector:@selector(dw_pullToRefreshFromTop:)]) {
//        MJRefreshNormalHeader *headerView = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//            [weakTarget dw_pullToRefreshFromTop:NO];
//        }];
//        headerView.lastUpdatedTimeLabel.hidden = YES;
//        headerView.stateLabel.hidden = YES;
//        scrollView.mj_header = headerView;
//    } else if ([target respondsToSelector:@selector(dw_pullToRefreshFromBottom:)]) {
//        MJRefreshAutoNormalFooter *footerView = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
//            [weakTarget dw_pullToRefreshFromBottom:NO];
//        }];
//        scrollView.mj_footer = footerView;
//    } else if ([target respondsToSelector:@selector(dw_pullToRefresh:showLoading:)]) {
//        MJRefreshNormalHeader *headerView = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//            [weakTarget dw_pullToRefresh:YES showLoading:NO];
//        }];
//        headerView.lastUpdatedTimeLabel.hidden = YES;
//        headerView.stateLabel.hidden = YES;
//        scrollView.mj_header = headerView;
//        
//        MJRefreshAutoNormalFooter *footerView = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
//            [weakTarget dw_pullToRefresh:NO showLoading:NO];
//        }];
//        scrollView.mj_footer = footerView;
//    }
}

@end
