//
//  DWPopoverView.h
//  fanShare
//
//  Created by wangqiqi on 16/1/19.
//  Copyright © 2016年 duxing. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DWPopoverView;
typedef void(^DWPopoverWillDismiss)(void);
typedef void(^DWPopoverDidSelectRow)(DWPopoverView *popoverView, NSInteger row);

@interface DWPopoverView : UIView

@property (nonatomic, strong) UIColor * bgColor;
@property (nonatomic, copy) DWPopoverWillDismiss willDismiss;
@property (nonatomic, copy) DWPopoverDidSelectRow didSeletRow;

- (instancetype)initWithPoint:(CGPoint)point
                      options:(NSArray *)options;

- (void)show:(BOOL)animated selectIndex:(NSInteger)selectIndex;

- (void)dismiss:(BOOL)animated;

@end
