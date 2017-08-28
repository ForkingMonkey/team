//
//  DWNoDataView.m
//  retial
//
//  Created by wangqiqi on 2017/8/22.
//  Copyright © 2017年 duxing. All rights reserved.
//

#import "DWNoDataView.h"

@interface DWNoDataView()

@property (nonatomic, strong) UIView *customView;
@property (nonatomic, strong) UITapGestureRecognizer *tapGesture;

@property (nonatomic, assign) BOOL fadeInOnDisplay;
@property (nonatomic, assign) BOOL fadeOutOnDisapper;

@end

@implementation DWNoDataView
@synthesize contentView = _contentView;
@synthesize titleLabel = _titleLabel, detailLabel = _detailLabel, imageView = _imageView, button = _button;

- (instancetype)init {
    if (self = [super init]) {
        [self setupUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.contentView];
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapContentView:)];
    [self.contentView addGestureRecognizer:tap];
}

- (void)didMoveToSuperview {
    CGRect superviewBounds = self.superview.bounds;
    self.frame = CGRectMake(0.0, self.verticalTopMargin, CGRectGetWidth(superviewBounds), CGRectGetHeight(superviewBounds)-self.verticalTopMargin);
    self.contentView.transform = CGAffineTransformMakeScale(0.0, 0.0);
    
    void (^fadeInBlock)(void) = ^{self.alpha = 1.0; self.contentView.transform = CGAffineTransformIdentity;};
    if (_fadeInOnDisplay) {
        [UIView animateWithDuration:0.25 animations:fadeInBlock completion:^(BOOL finished) {
        }];
    } else {
        fadeInBlock();
    }
}

- (void)removeFromSuperview {
    void (^fadeOutBlock)(void) = ^{self.alpha = 0.0;self.contentView.transform = CGAffineTransformMakeScale(0.0, 0.0);};
    if (_fadeOutOnDisapper) {
        [UIView animateWithDuration:0.25 animations:fadeOutBlock completion:^(BOOL finished) {
            [super removeFromSuperview];
        }];
    } else {
        fadeOutBlock();
        [super removeFromSuperview];
    }
}

#pragma mark - Public Method

- (void)showInView:(UIView *)superView byURLErrorCode:(NSInteger)errorCode animated:(BOOL)animated {
    if (!superView) {
        return;
    }
    [self dw_prepareForReuse];
    
    switch (errorCode) {
        case NSURLErrorTimedOut:
            self.imageView.image = [UIImage imageNamed:@"default_error"];
            self.titleLabel.text = @"加载超时";
            break;
        case NSURLErrorNotConnectedToInternet:
            self.imageView.image = [UIImage imageNamed:@"default_error"];
            self.titleLabel.text = @"加载超时";
            break;
        default:
            self.imageView.image = [UIImage imageNamed:@"default_error"];
            break;
    }
    if (self.superview) {
        [self removeFromSuperview];
    }
    
    self.fadeInOnDisplay = animated;
    [superView addSubview:self];
    [self setNeedsUpdateConstraints];
    
}

- (void)showInView:(UIView *)superView animated:(BOOL)animated {
    if (!superView) {
        return;
    }
    [self dw_prepareForReuse];
    
    self.imageView.image = [UIImage imageNamed:@"default_error"];
    self.titleLabel.text = @"暂无数据";
    
    if (self.superview && [self.superview isEqual:superView]) {
        [self setNeedsUpdateConstraints];
        return;
    } else if (self.superview) {
        self.fadeOutOnDisapper = NO;
        [self removeFromSuperview];
    }
    
    self.fadeInOnDisplay = animated;
    [superView addSubview:self];
    [self setNeedsUpdateConstraints];
}

- (void)dismiss:(BOOL)animated {
    self.fadeOutOnDisapper = animated;
    [self removeFromSuperview];
}

#pragma mark - Event Respond Methods

- (void)didTapButton:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(dw_noDataView:didTapButton:)]) {
        [self.delegate dw_noDataView:self didTapButton:sender];
    }
}

- (void)didTapContentView:(UIGestureRecognizer *)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(dw_noDataView:didTapView:)]) {
        [self.delegate dw_noDataView:self didTapView:sender.view];
    }
}

- (void)dw_prepareForReuse {
    [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    _imageView = nil;
    _titleLabel = nil;
    _detailLabel = nil;
    _button = nil;
    _customView = nil;
    [self dw_removeAllConstraints];
}

- (void)dw_removeAllConstraints {
    [self removeConstraints:self.constraints];
    [self.contentView removeConstraints:self.contentView.constraints];
}

- (void)updateConstraints {
    [super updateConstraints];
    
    [self addConstraint: [self layoutConstraintRelationEqualWithView:self.contentView toView:self attribute:NSLayoutAttributeCenterX constant:0.0]];
    [self addConstraint: [self layoutConstraintRelationEqualWithView:self.contentView toView:self attribute:NSLayoutAttributeTopMargin constant:self.verticalContentMargin ?: 0]];
    [self addConstraint:[self layoutConstraintRelationEqualWithView:self.contentView toView:self attribute:NSLayoutAttributeWidth constant:0.0]];
    
    if (_customView) {
        [self.contentView addConstraint:[self layoutConstraintRelationEqualWithView:_customView toView:self.contentView attribute:NSLayoutAttributeWidth constant:0.0]];
        [self.contentView addConstraint:[self layoutConstraintRelationEqualWithView:_customView toView:self.contentView attribute:NSLayoutAttributeHeight constant:0.0]];
        return;
    }
    CGFloat width = CGRectGetWidth(self.frame) ? : CGRectGetWidth([UIScreen mainScreen].bounds);
    CGFloat padding = 15; // default 375 -> 25
    CGFloat verticalSpace = self.verticalOffset ?: 10.0;
    CGFloat labelWidth = width > 2*padding ? width - 2*padding : width;
    
    NSMutableArray *subViews = [NSMutableArray array];
    [subViews addObject:self.contentView];
    if (_imageView.superview) {
        UIView *subView = subViews.lastObject;
        [self.contentView addConstraint:[self layoutConstraintRelationEqualWithView:_imageView toView:subView attribute:NSLayoutAttributeCenterX constant:0.0]];
        [self.contentView addConstraint:[self layoutConstraintRelationEqualWithView:_imageView toView:subView attribute:NSLayoutAttributeTopMargin constant:verticalSpace]];
        [subViews addObject:_imageView];
    } else {
        _imageView = nil;
    }
    
    if([self canShowTitle]) {
        UIView *subView = subViews.lastObject;
        _titleLabel.preferredMaxLayoutWidth = labelWidth;
        [self.contentView addConstraint:[self layoutConstraintRelationEqualWithView:_titleLabel toView:self.contentView attribute:NSLayoutAttributeCenterX constant:0.0]];
        [self.contentView addConstraint:[self layoutConstraintRelationEqualWithView:_titleLabel toView:subView attribute:NSLayoutAttributeBottom constant:verticalSpace]];
        [self.contentView addConstraint:[self layoutConstraintRelationEqualWithView:_titleLabel toView:subView attribute:NSLayoutAttributeLeft constant:padding]];
        [self.contentView addConstraint:[self layoutConstraintRelationEqualWithView:_titleLabel toView:subView attribute:NSLayoutAttributeRight constant:-padding]];
        [subViews addObject:_titleLabel];
    } else {
        [_titleLabel removeFromSuperview];
        _titleLabel = nil;
    }
    
    if ([self canShowDetail]) {
        UIView *subView = subViews.lastObject;
        _detailLabel.preferredMaxLayoutWidth = labelWidth;
        [self.contentView addConstraint:[self layoutConstraintRelationEqualWithView:_detailLabel toView:self.contentView attribute:NSLayoutAttributeCenterX constant:0.0]];
        [self.contentView addConstraint:[self layoutConstraintRelationEqualWithView:_detailLabel toView:subView attribute:NSLayoutAttributeBottom constant:verticalSpace]];
        [self.contentView addConstraint:[self layoutConstraintRelationEqualWithView:_detailLabel toView:subView attribute:NSLayoutAttributeLeft constant:padding]];
        [self.contentView addConstraint:[self layoutConstraintRelationEqualWithView:_detailLabel toView:subView attribute:NSLayoutAttributeRight constant:-padding]];
        [subViews addObject:_detailLabel];
    } else {
        [_detailLabel removeFromSuperview];
        _detailLabel = nil;
    }
    
    if ([self canShowButton]) {
        UIView *subView = subViews.lastObject;
        [self.contentView addConstraint:[self layoutConstraintRelationEqualWithView:_button toView:self.contentView attribute:NSLayoutAttributeCenterX constant:0.0]];
        [self.contentView addConstraint:[self layoutConstraintRelationEqualWithView:_button toView:subView attribute:NSLayoutAttributeBottom constant:verticalSpace]];
        [self.contentView addConstraint:[self layoutConstraintRelationEqualWithView:_button toView:subView attribute:NSLayoutAttributeLeft constant:padding]];
        [self.contentView addConstraint:[self layoutConstraintRelationEqualWithView:_button toView:subView attribute:NSLayoutAttributeRight constant:-padding]];
        [subViews addObject:_button];
    } else {
        [_button removeFromSuperview];
        _button = nil;
    }
    
    if (subViews.lastObject && ![subViews.lastObject isEqual:self.contentView]) {
        [self layoutConstraintRelationEqualWithView:subViews.lastObject toView:self.contentView attribute:NSLayoutAttributeBottom constant:-verticalSpace];
    }
}

#pragma mark - Config Methods

- (BOOL)canShowImage {
    return (_imageView.image && _imageView.superview);
}

- (BOOL)canShowTitle {
    return (_titleLabel.attributedText.string.length && _titleLabel.superview);
}

- (BOOL)canShowDetail {
    return (_detailLabel.attributedText.string.length && _titleLabel.superview);
}

- (BOOL)canShowButton {
    return ([_button attributedTitleForState:UIControlStateNormal].string.length > 0 ||
            [_button imageForState:UIControlStateNormal]) && _button.superview;
}

- (NSLayoutConstraint *)layoutConstraintRelationEqualWithView:(UIView *)view toView:(UIView *)toView attribute:(NSLayoutAttribute)attribute constant:(CGFloat)constant{
    return [NSLayoutConstraint constraintWithItem:view
                                        attribute:attribute
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:toView
                                        attribute:attribute
                                       multiplier:1.0
                                         constant:constant];
}

#pragma mark - Setters

- (void)setCustomView:(UIView *)customView {
    if (!customView) {
        return;
    }
    if (_customView) {
        [_customView removeFromSuperview];
        _customView = nil;
    }
    
    _customView = customView;
    _customView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:_customView];
}

#pragma mark - Getters

- (UIView *)contentView {
    if (!_contentView) {
        _contentView = [[UIView alloc] init];
        _contentView.translatesAutoresizingMaskIntoConstraints = NO;
        _contentView.backgroundColor = [UIColor clearColor];
    }
    return _contentView;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.translatesAutoresizingMaskIntoConstraints = NO;
        _imageView.backgroundColor = [UIColor clearColor];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [_contentView addSubview:_imageView];
    }
    return _imageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _titleLabel.backgroundColor = [UIColor clearColor];
        
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.numberOfLines = 0;
        
        _titleLabel.font = [UIFont systemFontOfSize:17.0];
        _titleLabel.textColor = [UIColor blueColor];
        [_contentView addSubview:_titleLabel];
    }
    return _titleLabel;
}

- (UILabel *)detailLabel {
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc] init];
        _detailLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _detailLabel.backgroundColor = [UIColor clearColor];
        
        _detailLabel.textAlignment = NSTextAlignmentCenter;
        _detailLabel.numberOfLines = 0;
        
        _detailLabel.font = [UIFont systemFontOfSize:14.0];
        _detailLabel.textColor = [UIColor lightGrayColor];
        
        [_contentView addSubview:_detailLabel];
    }
    return _detailLabel;
}

- (UIButton *)button {
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.translatesAutoresizingMaskIntoConstraints = NO;
        _button.backgroundColor = [UIColor clearColor];
        _button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        _button.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        
        _button.titleLabel.font = [UIFont systemFontOfSize:14.0];
        [_button setTitleColor:[UIColor lightTextColor] forState:UIControlStateNormal];
        
        [_button addTarget:self action:@selector(didTapButton:) forControlEvents:UIControlEventTouchUpInside];
        [_contentView addSubview:_button];
    }
    return _button;
}

@end
