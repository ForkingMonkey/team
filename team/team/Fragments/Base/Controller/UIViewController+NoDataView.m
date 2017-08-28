//
//  UIViewController+NoDataView.m
//  retial
//
//  Created by wangqiqi on 2017/8/23.
//  Copyright © 2017年 duxing. All rights reserved.
//

#import "UIViewController+NoDataView.h"
#import <objc/runtime.h>

static void *kNoDataViewKey = &kNoDataViewKey;

@implementation UIViewController (NoDataView)

- (DWNoDataView *)dwNoDataView {
    DWNoDataView *noDataView = objc_getAssociatedObject(self, kNoDataViewKey);
    if (!noDataView) {
        noDataView = [[DWNoDataView alloc] init];
        noDataView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        if ([self conformsToProtocol:@protocol(DWNoDataViewDelegate)]) {
            noDataView.delegate = (id<DWNoDataViewDelegate>)self;
        }
        if ([self conformsToProtocol:@protocol(DWNoDataViewDataSource)]) {
            noDataView.dataSource = (id<DWNoDataViewDataSource>)self;
        }
        objc_setAssociatedObject(self, kNoDataViewKey, noDataView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return noDataView;
}

@end
