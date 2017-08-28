//
//  NSDate+Util.m
//  fanShare
//
//  Created by wangqiqi on 15/9/29.
//  Copyright © 2015年 duxing. All rights reserved.
//

#import "NSDate+Util.h"
#import <DWUtilKit/NSDate+DWKit.h>

#define  DWDateFormatter(ClassName,dateFormat) \
- (NSString *)ClassName{ \
    static NSDateFormatter *formattor = nil; \
    static dispatch_once_t ClassName##_onceToken; \
    dispatch_once(&ClassName##_onceToken, ^{  \
        formattor = [[NSDateFormatter alloc] init]; \
        [formattor setDateFormat:dateFormat];  \
        [formattor setLocale:[NSLocale currentLocale]]; \
    }); \
    if (self == nil || self.timeIntervalSince1970 == 0) { \
        return @""; \
    } \
    return [formattor stringFromDate:self]; \
}

@implementation NSDate (Util)

- (BOOL)dw_isEarlierThanDate:(NSDate *)date {
    if (date) {
        if ([date timeIntervalSinceDate:self] > 0) {
            return YES;
        }
    }
    return NO;
}

/**
 * 今天-->  HH:mm
 * 昨天-->  昨日 HH:mm
 * 今年-->  MM月dd日
 * 不是今年-->  yyyy年MM月dd日
 */
+ (NSString *)dw_showDateFormatterStyleMessageDate:(NSDate *)date {
    if (date.timeIntervalSince1970 == 0 || date == nil) {
        return @"";
    }
    if (date.isToday) {
        return [date dw_showHourMinute];
    } else if (date.isYesterday) {
        return [NSString stringWithFormat:@"昨日 %@",[date dw_showHourMinute]];
    } else if (date.isThisYear) {
        return [date dw_showMonthDay];
    } else {
        return [date dw_showYearMonthDay];
    }
}

/**
 * 今天-->  今天
 * 昨天-->  昨日
 * 今年-->  MM月dd日
 * 今年-->  yyyy年MM月dd日
 */
+ (NSString *)dw_showDateFormatterStyleCallMessageDate:(NSDate *)date {
    if (date.timeIntervalSince1970 == 0 || date == nil) {
        return @"";
    }
    if (date.isToday) {
        return @"今天";
    } else if (date.isYesterday) {
        return @"昨天";
    } else if (date.isThisYear) {
        return [date dw_showMonthDay];
    } else {
        return [date dw_showYearMonthDay];
    }

}


/**
 * 今天-->  今天(周X)
 * 昨天-->  昨日(周X)
 * 今年-->  MM月dd日(周X)
 */
+ (NSString *)dw_showDateFormatterStyleWithZHMessageDate:(NSDate *)date {
    if (date.timeIntervalSince1970 == 0 || date == nil) {
        return @"";
    }
    if (date.isToday) {
        return [NSString stringWithFormat:@"今天(%@)",date.weekdayZH];
    } else if (date.isYesterday) {
        return [NSString stringWithFormat:@"昨日(%@)",date.weekdayZH];
    } else  {
        return [NSString stringWithFormat:@"%@(%@)",[date dw_showMonthDay],date.weekdayZH];
    }
}

/**
 *  当前月份-> 本月
 *  今年   -> MM月
 *  不是今年-> yyyy年MM月
 */
+ (NSString *)dw_showDateFormatterStyleCurrentDate:(NSDate *)currentDate compareDate:(NSDate *)compateDate {
    if (compateDate == nil) {
        return @"";
    }
    if (currentDate.month == compateDate.month) {
        return @"本月";
    } else if (currentDate.year == compateDate.year) {
        return [NSString stringWithFormat:@"%ld月",(long)compateDate.month];
    } else {
        return [compateDate dw_showYearMonth];
    }
}

DWDateFormatter(dw_showHourMinute, @"HH:mm");

DWDateFormatter(dw_showHourMinuteSeconds, @"HH:mm:ss");

DWDateFormatter(dw_showYearMonth, @"yyyy年MM月");

DWDateFormatter(dw_showMonthDay, @"MM月dd日");

DWDateFormatter(dw_showYearMonthDay, @"yyyy年MM月dd日");

DWDateFormatter(dw_showMonthDayWithDash, @"MM-dd");

DWDateFormatter(dw_showMonthDayAndHourMinuteWithDashAndSemicolon, @"MM-dd HH:mm");

DWDateFormatter(dw_showYearMonthDayWithDash, @"yyyy-MM-dd");

DWDateFormatter(dw_showYearMonthDayWithPoint, @"yyyy.MM.dd");

DWDateFormatter(dw_showYearMonthDayAndHourMinuteWithDashAndSemicolon, @"yyyy-MM-dd HH:mm");

DWDateFormatter(dw_showYearMonthDayAndHourMinuteWithPointAndSemicolon, @"yyyy.MM.dd HH:mm");


@end
