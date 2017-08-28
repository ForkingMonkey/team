//
//  DWNoDataView.h
//  retial
//
//  Created by wangqiqi on 2017/8/22.
//  Copyright © 2017年 duxing. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DWNoDataView;

@protocol DWNoDataViewDataSource <NSObject>

@optional
- (CGFloat)verticalOffsetForNoDataView:(DWNoDataView *)noDataView;

- (CGFloat)spaceHeightForNoDataView:(DWNoDataView *)noDataView;

- (UIView *)customViewForNoDataView:(DWNoDataView *)noDataView;

@end

@protocol DWNoDataViewDelegate <NSObject>

@optional
- (void)dw_noDataView:(DWNoDataView *)noDataView didTapView:(UIView *)contentView;

- (void)dw_noDataView:(DWNoDataView *)noDataView didTapButton:(UIButton *)button;

@end

/**************************************************
 
    *******************        *******************
    *    ┗( T﹏T )┛   *        *                 *
    *        |        *        *                 *
    *      title      *        *                 *
    *        |        *   or   *    customView   *
    *      detail     *        *                 *
    *        |        *        *                 *
    *      button     *        *                 *
    *******************        *******************
 
 **************************************************/

@interface DWNoDataView : UIView

@property (nonatomic, weak) id<DWNoDataViewDataSource> dataSource;
@property (nonatomic, weak) id<DWNoDataViewDelegate>   delegate;
@property (nonatomic, assign) CGFloat verticalOffset;
@property (nonatomic, assign) CGFloat verticalTopMargin;
@property (nonatomic, assign) CGFloat verticalContentMargin;

@property (nonatomic, strong, readonly) UIView  *contentView;
@property (nonatomic, strong, readonly) UIImageView *imageView;
@property (nonatomic, strong, readonly) UILabel *titleLabel;
@property (nonatomic, strong, readonly) UILabel *detailLabel;
@property (nonatomic, strong, readonly) UIButton *button;

- (void)showInView:(UIView *)superView animated:(BOOL)animated;

- (void)showInView:(UIView *)superView byURLErrorCode:(NSInteger)errorCode animated:(BOOL)animated;

- (void)dismiss:(BOOL)animated;

@end
