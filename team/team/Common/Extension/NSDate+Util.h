//
//  NSDate+Util.h
//  fanShare
//
//  Created by wangqiqi on 15/9/29.
//  Copyright © 2015年 duxing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Util)

/**
 *  是否self比参数date更早
 *  date为nil返回NO，date与self相同返回NO
 */
- (BOOL)dw_isEarlierThanDate:(NSDate *)date;

/**
 * 今天-->  HH:mm
 * 昨天-->  昨日 HH:mm
 * 今年-->  MM月dd日
 * 非今年--> yyyy年MM月dd日
 */
+ (NSString *)dw_showDateFormatterStyleMessageDate:(NSDate *)date;

/**
 * 今天-->  今天
 * 昨天-->  昨日
 * 今年-->  MM月dd日
 * 非今年-->  yyyy年MM月dd日
 */
+ (NSString *)dw_showDateFormatterStyleCallMessageDate:(NSDate *)date;

/**
 * 今天-->  今天(周X)
 * 昨天-->  昨日(周X)
 * 其他-->  MM月dd日(周X)
 */
+ (NSString *)dw_showDateFormatterStyleWithZHMessageDate:(NSDate *)date;

/**
 *  当前月份-> 本月
 *  今年   ->  MM月
 *  不是今年->  yyyy年MM月
 */
+ (NSString *)dw_showDateFormatterStyleCurrentDate:(NSDate *)currentDate compareDate:(NSDate *)compateDate;

/**
 *  @return HH:mm
 */
- (NSString *)dw_showHourMinute;

/**
 *  @return HH:mm:ss
 */
- (NSString *)dw_showHourMinuteSeconds;

/**
 *  @return yyyy年MM月
 */
- (NSString *)dw_showYearMonth;

/**
 *  @return MM月dd日
 */
- (NSString *)dw_showMonthDay;

/**
 *  @return yyyy年MM月dd日
 */
- (NSString *)dw_showYearMonthDay;

/**
 *  @return MM-dd
 */
- (NSString *)dw_showMonthDayWithDash;

/**
 *  @return MM-dd HH:mm
 */
- (NSString *)dw_showMonthDayAndHourMinuteWithDashAndSemicolon;

/**
 *  @return yyyy-MM-dd
 */
- (NSString *)dw_showYearMonthDayWithDash;

/**
 *  @return yyyy.MM.dd
 */
- (NSString *)dw_showYearMonthDayWithPoint;

/**
 *  @return yyyy-MM-dd HH:mm
 */
- (NSString *)dw_showYearMonthDayAndHourMinuteWithDashAndSemicolon;

/**
 *  @return yyyy.MM.dd HH:mm
 */
- (NSString *)dw_showYearMonthDayAndHourMinuteWithPointAndSemicolon;

@end
