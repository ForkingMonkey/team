//
//  DWTextField.h
//  dodopay
//
//  Created by wangqiqi on 15/8/26.
//  Copyright (c) 2015年 duxing. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  限制文本长度、根据键盘判断可接受的字符（过滤不符合规则的粘贴）
 */
@interface DWTextField : UITextField

// 输入最大的文本长度，默认为1000
@property (nonatomic, assign) NSUInteger maxTextLength;

// 使用delegateForward替代delegate，delegate被内部使用
@property (nonatomic, weak) id<UITextFieldDelegate> delegateForward;

@end
