//
//  DWPopoverView.m
//  fanShare
//
//  Created by wangqiqi on 16/1/19.
//  Copyright © 2016年 duxing. All rights reserved.
//

#import "DWPopoverView.h"
#import <DWUtilKit/DWUtilKit.h>
#import <DWUtilKit/DWUtilities.h>

#define DWMarginCurvature 5.0

#define DWMarginPoint 20.0

#define DWPopoverViewRowHeight 54.0

@interface DWPopoverView () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSArray *itemArray;

@property (nonatomic, assign) CGPoint point;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UIButton *backgroundButton;

@property (nonatomic, assign) NSInteger selectIndex;

@property (nonatomic, strong) UIImageView *imageViewBackground;
@end

@implementation DWPopoverView

- (instancetype)initWithPoint:(CGPoint)point options:(NSArray *)options{
    if (self = [super init]) {
        self.backgroundColor = [UIColor clearColor];
        _point = point;
        _itemArray = [options copy];
        self.frame = [self customeViewFrame];
        _bgColor = [UIColor dw_opaqueColorWithHexString:@"#333333"];
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.bounces = NO;
    _tableView.showsHorizontalScrollIndicator = NO;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.layer.cornerRadius = 3;
    _tableView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    _tableView.layer.masksToBounds = YES;
    [self addSubview:_tableView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _tableView.frame = CGRectMake(0, 5, self.width-5, self.height-20);
}

- (CGRect)customeViewFrame {
    NSInteger index = _itemArray.count >= 4 ? 4 : _itemArray.count;
    CGFloat height = index * 44 + 10;
    CGFloat width = 105;
    CGFloat x = self.point.x - (width-16);
    CGFloat y = self.point.y+0.5;
    CGRect frame = CGRectMake(x, y, width, height);
    if (frame.origin.x < 5) {
        frame.origin.x = 5;
    }
    if ((frame.origin.x + frame.size.width) > kScreenWidth-5) {
        frame.origin.x = kScreenWidth-5 - frame.size.width;
    }
    return frame;
}


- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self drawTrangleWithContext:context];
    [self drawContainerWithContext:context];
}

// 画三角
- (void)drawTrangleWithContext:(CGContextRef)context {
    CGMutablePathRef path = CGPathCreateMutable();
    CGPoint point = CGPointMake(self.width-18, 0);
    CGFloat width = 10;
    CGPathMoveToPoint(path, NULL, point.x,point.y);
    CGPathAddLineToPoint(path, NULL, point.x-width/2, point.y+width/2);
    CGPathAddLineToPoint(path, NULL, point.x+width/2, point.y+width/2);
    CGContextAddPath(context, path);
    [_bgColor set];
    CGContextFillPath(context);
    CGPathRelease(path);
}

- (void)drawContainerWithContext:(CGContextRef)context {
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 5, self.width-5, self.height-20)cornerRadius:3];
    [_bgColor set];
    CGContextAddPath(context, path.CGPath);
    CGContextFillPath(context);
}

- (void)show:(BOOL)animated selectIndex:(NSInteger)selectIndex{
    _backgroundButton.enabled = NO;
    self.selectIndex = selectIndex;
    if (!_backgroundButton) {
        _backgroundButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backgroundButton setFrame:[UIScreen mainScreen].bounds];
        [_backgroundButton setBackgroundColor:[UIColor clearColor]];
        [_backgroundButton addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
        [_tableView reloadData];
        [_backgroundButton addSubview:self];
    }
    
    [[UIApplication sharedApplication].delegate.window addSubview:_backgroundButton];
    
    __weak typeof(self) weakSelf = self;
    if (animated) {
        CGPoint arrowPoint = [self convertPoint:self.point fromView:_backgroundButton];
        self.layer.anchorPoint = CGPointMake(arrowPoint.x / self.frame.size.width, arrowPoint.y / self.frame.size.height);
        self.frame = [self customeViewFrame];
        
        self.alpha = 0.0;
        self.transform = CGAffineTransformMakeScale(0.1, 0.1);
        [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.transform = CGAffineTransformMakeScale(1.05, 1.05);
            self.alpha = 1.0;
        } completion:^(BOOL finished) {
            if (finished) {
                [UIView animateWithDuration:0.08 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                    self.transform = CGAffineTransformIdentity;
                } completion:^(BOOL finished) {
                    weakSelf.backgroundButton.enabled = YES;
                }];
            }
        }];
    }
}

- (void)dismiss {
    [self dismiss:YES];
}

- (void)dismiss:(BOOL)animated {
    if (!animated) {
        [_backgroundButton removeFromSuperview];
        return;
    }
    [UIView animateWithDuration:0.3 animations:^{
        self.transform = CGAffineTransformMakeScale(0.1, 0.1);
        self.alpha = 0.0;
        if (_willDismiss) {
            _willDismiss();
        }
    } completion:^(BOOL finished) {
        [_backgroundButton removeFromSuperview];
    }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.itemArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    static NSString *cellId = @"cellId";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
//    if (!cell) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId];
//        cell.backgroundColor = self.backgroundColor;
//        cell.frame = CGRectMake(0.0, 0.0, _tableView.width, CELLHEIGHT5);
//        UILabel *labelItem = [[UILabel alloc] initWithFrame:cell.bounds];
//        
//        labelItem.textAlignment = NSTextAlignmentCenter;
//        labelItem.tag = 1001;
//        labelItem.textColor = [UIColor dw_opaqueColorWithHexString:WHITE_COLOR];
//        labelItem.font = NORMAL_FONT;
//        [cell.contentView addSubview:labelItem];
//        
//        UIImageView * imageViewSeparatorLine = [[UIImageView alloc] initWithFrame:CGRectMake(MARGINWIDTH, cell.height-0.5, 85, CGFloatFromPixel(1))];
//        [cell.contentView addSubview:imageViewSeparatorLine];
//        imageViewSeparatorLine.backgroundColor = [UIColor dw_opaqueColorWithHexString:@"#434343"];
//        
//        UIView *backView = [[UIView alloc] initWithFrame:self.bounds];
//        backView.backgroundColor = [UIColor dw_opaqueColorWithHexString:@"#414141"];
//        cell.selectedBackgroundView = backView;
//    }
//    UILabel *labelItem = [cell.contentView viewWithTag:1001];
//    labelItem.text = self.itemArray[indexPath.row];
//    if (indexPath.row == _selectIndex) {
//        labelItem.textColor = [UIColor dw_opaqueColorWithHexString:MAIN_COLOR];
//        
//    } else {
//        labelItem.textColor = [UIColor dw_opaqueColorWithHexString:WHITE_COLOR];
//    }
//    return cell;
    
    return nil;
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (_didSeletRow) {
        _didSeletRow(self ,indexPath.row);
    }
    [self dismiss:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}





@end
