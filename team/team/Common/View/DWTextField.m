//
//  DWTextField.m
//  dodopay
//
//  Created by wangqiqi on 15/8/26.
//  Copyright (c) 2015年 duxing. All rights reserved.
//

#import "DWTextField.h"
#import <objc/runtime.h>

/**
 *  iOS8 之前的系统不能将UITextField的delegate设成self，否则有问题，见：http://stackoverflow.com/questions/13336981/uitextview-subclass-as-delegate-of-itself/13338493#13338493 & http://www.cocoabuilder.com/archive/cocoa/241465-iphone-why-can-a-uitextfield-be-its-own-delegate.html#241505
 */
@interface DWTextFieldDelegate : NSObject <UITextFieldDelegate>

@property (nonatomic, weak) DWTextField *textFieldOwn;

@end

@implementation DWTextFieldDelegate

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if ([_textFieldOwn.delegateForward respondsToSelector:@selector(textFieldShouldBeginEditing:)]) {
        return [_textFieldOwn.delegateForward textFieldShouldBeginEditing:textField];
    }
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if ([_textFieldOwn.delegateForward respondsToSelector:@selector(textFieldDidBeginEditing:)]) {
        [_textFieldOwn.delegateForward textFieldDidBeginEditing:textField];
    }
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    if ([_textFieldOwn.delegateForward respondsToSelector:@selector(textFieldShouldEndEditing:)]) {
        return [_textFieldOwn.delegateForward textFieldShouldEndEditing:textField];
    }
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if ([_textFieldOwn.delegateForward respondsToSelector:@selector(textFieldDidEndEditing:)]) {
        [_textFieldOwn.delegateForward textFieldDidEndEditing:textField];
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if ([_textFieldOwn.delegateForward respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)]) {
        BOOL res = [_textFieldOwn.delegateForward textField:textField shouldChangeCharactersInRange:range replacementString:string];
        if (!res) {
            return NO;
        }
    }
    
    // TODO:对其他键盘字符做限制
    if (_textFieldOwn.keyboardType == UIKeyboardTypeDecimalPad) {
        // 限制数字和'.'
        NSString *strRes = [textField.text stringByReplacingCharactersInRange:range withString:string];
        NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:@"1234567890."] invertedSet];
        NSString *filtered = [[strRes componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
        if (![filtered isEqualToString:strRes]) {
            return NO;
        }
    } else if (_textFieldOwn.keyboardType == UIKeyboardTypeNumberPad) {
        // 限制数字
        NSString *strRes = [textField.text stringByReplacingCharactersInRange:range withString:string];
        NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:@"1234567890"] invertedSet];
        NSString *filtered = [[strRes componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
        if (![filtered isEqualToString:strRes]) {
            return NO;
        }
    }
    
    NSInteger newLen = textField.text.length + string.length - range.length;
    return (newLen <= _textFieldOwn.maxTextLength);
}

- (BOOL)textFieldShouldClear:(UITextField *)textField {
    if ([_textFieldOwn.delegateForward respondsToSelector:@selector(textFieldShouldClear:)]) {
        return [_textFieldOwn.delegateForward textFieldShouldClear:textField];
    }
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ([_textFieldOwn.delegateForward respondsToSelector:@selector(textFieldShouldReturn:)]) {
        return [_textFieldOwn.delegateForward textFieldShouldReturn:textField];
    }
    return YES;
}

@end

@interface DWTextField () <UITextFieldDelegate>

@property (nonatomic, strong) DWTextFieldDelegate *delegateObject;

@end

@implementation DWTextField

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _maxTextLength = 1000;
        
        _delegateObject = [[DWTextFieldDelegate alloc] init];
        _delegateObject.textFieldOwn = self;
        
        self.delegate = _delegateObject;
        [self addTarget:self action:@selector(textFieldTextChanged:) forControlEvents:UIControlEventAllEditingEvents];
    }
    return self;
}

- (void)textFieldTextChanged:(id)sender {
    UITextField *textField = sender;
    if (textField.markedTextRange == nil && textField.text.length > _maxTextLength) {
        textField.text = [textField.text substringToIndex:_maxTextLength];
    }
}

@end
