//
//  DWRedDotView.m
//  o2o
//
//  Created by wangqiqi on 16/7/19.
//  Copyright © 2016年 duxing. All rights reserved.
//

#import "DWRedDotView.h"
#import <DWUtilKit/DWUtilities.h>

@implementation DWRedDotView {
    NSString *_strCount;
    CGFloat _widthString;
    CGFloat _heightString;
}

- (instancetype)initWithCount:(NSInteger)count {
    self = [super initWithFrame:CGRectMake(0, 0, 0, 0)];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        _count = count;
        [self reload];
    }
    return self;
}

+ (CGFloat)height {
    return 18.0;
}

+ (UIFont *)textFont {
    return [UIFont systemFontOfSize:12.0];
}

+ (CGFloat)cornerRadius {
    return 9.0;
}

- (void)setCount:(NSInteger)count {
    self.hidden = count == 0;
    if (_count == count) {
        return;
    }
    _count = count;
    [self reload];
}

- (void)reload {
    NSString *string = [NSString stringWithFormat:@"%@", @(_count)];
    if (_count > 99) {
        string = @"99+";
    }
    _strCount = string;
    [self sizeToFit];
    [self setNeedsDisplay];
}

- (CGSize)sizeThatFits:(CGSize)size {
    CGRect bounds = [_strCount boundingRectWithSize:CGSizeMake(1000, [self.class height]) options:0 attributes:@{NSFontAttributeName:[self.class textFont]} context:nil];
    CGFloat width = ceil(bounds.size.width);
    _widthString = width;
    _heightString = ceil(bounds.size.height);
    width += 6.0;
    if (width < 2 * [self.class cornerRadius]) {
        width = 2 * [self.class cornerRadius];
    }
    return CGSizeMake(width, [self.class height]);
}

- (void)drawRect:(CGRect)rect {
    [[UIColor whiteColor] setStroke];
    [[UIColor redColor] setFill];
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(1, 1, self.frame.size.width-2, self.frame.size.height-2) cornerRadius:([self.class cornerRadius] - 1)];
    [bezierPath fill];
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), CGFloatFromPixel(2));
    [bezierPath stroke];
    
    CGFloat y = (self.bounds.size.height-_heightString)/2;
    CGRect frameDraw = CGRectMake(self.bounds.size.width/2-_widthString/2, y, _widthString, _heightString);
    [_strCount drawInRect:frameDraw withAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor], NSFontAttributeName:[self.class textFont]}];
}

@end
