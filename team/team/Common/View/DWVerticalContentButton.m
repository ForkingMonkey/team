//
//  DWVerticalContentButton.m
//  o2o
//
//  Created by wangqiqi on 16/8/23.
//  Copyright © 2016年 duxing. All rights reserved.
//

#import "DWVerticalContentButton.h"

@implementation DWVerticalContentButton {
    CGFloat _fontHeight;
}

- (void)setVerticalPadding:(CGFloat)verticalPadding {
    _verticalPadding = verticalPadding;
    
    // 如果在`titleRectForContentRect:`或`imageRectForContentRect:`中引用self.titleLabel会引起循环调用导致栈溢出
    _fontHeight = self.titleLabel.font.pointSize;
    
    [self setNeedsLayout];
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    CGRect imageRect = [self imageRectForContentRect:contentRect];
    return CGRectMake(0, imageRect.origin.y+imageRect.size.height+_verticalPadding, contentRect.size.width, _fontHeight);
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    UIImage *image = [self imageForState:UIControlStateNormal];
    CGFloat y = floor(self.bounds.size.height/2 - (_fontHeight + image.size.height + _verticalPadding)/2);
    CGFloat x = floor(self.bounds.size.width/2 - image.size.width/2);
    return CGRectMake(x, y, image.size.width, image.size.height);
}

@end
