//
//  DWDesignStandardDefine.h
//  retial
//
//  Created by wangqiqi on 2017/8/24.
//  Copyright © 2017年 duxing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

///////////////// 颜色规范 /////////////////
#define BACKGROUND_COLOR  [UIColor ds_colorWithHexString:@"#f1f3f6"]   // 系统背景色
#define SELECTED_COLOR    [UIColor ds_colorWithHexString:@"#da0b0b"]  // 默认选中的颜色
#define LINE_COLOR        [UIColor ds_colorWithHexString:@"#ececec"]  // 分割线的颜色

#define MAIN_COLOR @"#00abf3"         // 主色调
#define SUB_MAIN_COLOR @"#da0b0b"     // 次主色调
//#define LINE_COLOR @"#ececec"         // 分割线
#define V_LINE_COLOR @"#cccccc"       // 竖的分割线
#define TITLE_COLOR @"#333333"        // 导航栏标题
#define MAIN_TITLE_COLOR @"#333333"   // 一般用于UITableViewCell的标题
#define MID_TITLE_COLOR @"#666666"    // 中间色
#define SUB_TITLE_COLOR @"#999999"    // 子标题
#define DESCRIPTION_COLOR @"#ececec"  // 描述、备注文字 (一般用于UITableViewCell下的描述文字)
#define ERROR_WARN_COLOR @"#e60012"   // 错误提示信息
#define DASH_LINE_COLOR @"#d3dbe5"    // dash line 颜色，见收银界面
#define TIP_MESSAGE_WARN_COLOR @"#dd4043"

#define CELL_BACKGROUND_COLOR @"#ffffff"// 列表项背景
#define WHITE_COLOR @"#ffffff"        // 白色
#define BLACK_COLOR @"#000000"        // 黑色


// main button background
#define MAIN_BUTTON_BG_NORMAL_COLOR @"#00abf3"
#define MAIN_BUTTON_BG_HIGHLIGHT_COLOR @"#009ada"
#define MAIN_BUTTON_BG_DISABLE_COLOR @"#999999"

// main button title
#define MAIN_BUTTON_TITLE_NORMAL_COLOR @"#ffffff"
#define MAIN_BUTTON_TITLE_HIGHLIGHT_COLOR @"#ffffff"
#define MAIN_BUTTON_TITLE_DISABLE_COLOR @"#ffffff"

// sub button background
#define SUB_BUTTON_BG_NORMAL_COLOR @"#ffffff"
#define SUB_BUTTON_BG_HIGHLIGHT_COLOR @"#e5e5e5"
#define SUB_BUTTON_BG_DISABLE_COLOR @"#ffffff"

// sub button title
#define SUB_BUTTON_TITLE_NORMAL_COLOR @"#333333"
#define SUB_BUTTON_TITLE_HIGHLIGHT_COLOR @"#333333"
#define SUB_BUTTON_TITLE_DISABLE_COLOR @"#999999"

// sub button border
#define SUB_BUTTON_BORDER_NORMAL_COLOR @"#c5c5c5"
#define SUB_BUTTON_BORDER_HIGHLIGHT_COLOR @"#c5c5c5"
#define SUB_BUTTON_BORDER_DISABLE_COLOR @"#c5c5c5"

// small button (normal) background
#define SMALL_BUTTON_BG_NORMAL_COLOR @"#ffffff"
#define SMALL_BUTTON_BG_HIGHLIGHT_COLOR @"#e5e5e5"
#define SMALL_BUTTON_BG_DISABLE_COLOR @"#ffffff"

// small button (normal) title
#define SMALL_BUTTON_TITLE_NORMAL_COLOR @"#333333"
#define SMALL_BUTTON_TITLE_HIGHLIGHT_COLOR @"#333333"
#define SMALL_BUTTON_TITLE_DISABLE_COLOR @"#999999"

// small button (normal) border is the same as sub button border

// small button (red) background
#define SMALL_BUTTON_RED_BG_NORMAL_COLOR @"ffffff"
#define SMALL_BUTTON_RED_BG_HIGHLIGHT_COLOR @"#e5e5e5"
#define SMALL_BUTTON_RED_BG_DISABLE_COLOR @"#ffffff"

// small button (red) title
#define SMALL_BUTTON_RED_TITLE_NORMAL_COLOR @"#e60012"
#define SMALL_BUTTON_RED_TITLE_HIGHLIGHT_COLOR @"e60012"
#define SMALL_BUTTON_RED_TITLE_DISABLE_COLOR @"#999999"

// small button (red) border
#define SMALL_BUTTON_RED_BORDER_NORMAL_COLOR @"#e60012"
#define SMALL_BUTTON_RED_BORDER_HIGHLIGHT_COLOR @"#e60012"
#define SMALL_BUTTON_RED_BORDER_DISABLE_COLOR @"#c5c5c5"

#define LINE_BUTTON_TITLE_COLOR @"#6789a9"

#define MARGINWIDTH           10    // 页面的左右边距
#define MARGINWIDTH2          15    // 页面的左右边距
#define MARGINWIDTH3          20    // 页面的左右边距
#define MARGINWIDTH4          12    // 页面的左右边距
#define SECTIONSPCE           15    // 列表组间距
#define CELLTOPMARGIN         10    // 第一个cell距顶部空白
#define CELLBOTTOMMARGIN      10    // 最后一个cell距底部空白
#define CELLSPCE              10    // 列表项间距
#define SECTION_TITLE_HEIGHT  30    // section标题
#define SECTIONHEIGHT1        40    // section 高度
#define SECTIONHEIGHT2        45    // section 高度

#define CELLHEIGHT1           41    // 单行 小图或无图
#define CELLHEIGHT2           71    // 两行 大图
#define CELLHEIGHT3           59    // 两行 无图
#define CELLHEIGHT4           91    // 三行 无图
#define CELLHEIGHT5           46    // 单行

#define V_Line_Height         20    // 竖直线的高度

#define NAVIGATIONMARGINWIDTH 15    // 导航栏左右baritem分别距离左右边距
#define SPACEWIDTH            22    // 段落
#define BUTTONHEIGHT          40    // 公共按钮高度
#define TOPTIPHEIGHT          40    // 顶部提示View高度
#define FOOTERCONTAINERHEIGHT 55    // 底部提示View高度
#define WHITEPOINTWIDTH       8     // 白点的宽度

///////////////// 页面尺寸规范 /////////////////

///////////////// 字体规范 /////////////////
// 导航栏标题
#define NAV_TITLE_FONT          [UIFont systemFontOfSize:16.0f]
#define NAV_TITLT_COLOR         [UIColor ds_colorWithHexString:@"#333333"]

// 标题文字
#define TITLE_FONT              [UIFont systemFontOfSize:18.0f]

// 描述解释文字
#define DESCRIPTION_FONT        [UIFont systemFontOfSize:12.0f]

#define LINE_BUTTON_FONT        [UIFont systemFontOfSize:14.0f]

#define CELL_SMALL_FONT         [UIFont systemFontOfSize:10.0f]
#define CELL_SMALL_BOLD_FONT    [UIFont boldSystemFontOfSize:10.0f]
#define SUPER_SMALL_FONT        [UIFont systemFontOfSize:12.0f]
#define SUPER_SMALL_BOLD_FONT   [UIFont boldSystemFontOfSize:12.0f]
#define SMALL_FONT              [UIFont systemFontOfSize:14.0f]
#define SMALL_BOLD_FONT         [UIFont boldSystemFontOfSize:14.0f]
#define MIDDLE_SMALL_FONT       [UIFont systemFontOfSize:16.0f]
#define MIDDLE_SMALL_BOLD_FONT  [UIFont boldSystemFontOfSize:16.0f]
#define NORMAL_FONT             [UIFont systemFontOfSize:17.0f]
#define NORMAL_BOLD_FONT        [UIFont boldSystemFontOfSize:17.0f]
#define BIG_FONT                [UIFont systemFontOfSize:18.0f]
#define BIG_BOLD_FONT           [UIFont boldSystemFontOfSize:18.0f]

#define BIG_BIG_FONT            [UIFont systemFontOfSize:30.0f]
#define BIG_BIG_BOLD_FONT       [UIFont boldSystemFontOfSize:30.0f]
#define SUPER_BIG_FONT          [UIFont systemFontOfSize:32.0f]
#define SUPER_BIG_BOLD_FONT     [UIFont boldSystemFontOfSize:32.0f]
#define HUGE_FONT               [UIFont systemFontOfSize:40.0f]
#define HUGE_BOLD_FONT          [UIFont boldSystemFontOfSize:40.0f]
#define SUPER_HUGE_FONT         [UIFont systemFontOfSize:45.0f]
#define SUPER_HUGE_BOLD_FONT    [UIFont boldSystemFontOfSize:45.0f]

///////////////// 字体规范 /////////////////


@interface DWDesignStandardDefine : NSObject

@end

@interface UIColor (DesignStandards)

+ (UIColor *)ds_colorWithHexString:(NSString *)hexString;

@end

@interface UIFont (DesignStandards)

+ (UIFont *)ds_normalFontOfSize:(CGFloat)fontSize;
+ (UIFont *)ds_boldFontOfSize:(CGFloat)fontSize;

@end
