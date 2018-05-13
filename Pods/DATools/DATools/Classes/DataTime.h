//
//  DataTime.h
//  类的封装
//
//  Created by WanDing on 16/6/17.
//  Copyright © 2016年 WanDing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataTime : NSData

+ (NSInteger)compareDate:(NSString*)dateOne withDate:(NSString*)dateTwo;

+ (NSInteger)getnewDataYear;

+ (NSInteger)getnewDataMonth;

+ (NSInteger)getnewDataDay ;

+ (NSString *)getDataYewaAndMonthAndDay ;

+ (NSString *)getSpotDataYewaAndMonthAndDay;

+ (NSString *)getDateStringWhichDay:(NSDate *)date;

+ (NSString *)getSpotDateStringWhichDay:(NSDate *)date;

+ (NSInteger)getdaysFromDate:(NSString *)startDate toDate:(NSString *)endDate ;
+ (NSInteger)daysFromStartDate:(NSString *)getData;

+ (NSInteger)daysFromEndDate:(NSString *)getData;

+ (BOOL)date:(NSString*)date isBetweenDate:(NSString*)beginDate andDate:(NSString*)endDate;

+ (BOOL)date:(NSString*)date isBeginDate:(NSString*)oneDate;

+ (BOOL)date:(NSString*)date andDate:(NSString*)endDate ;

+ (NSString *)getOneDataOraftrtYear:(NSInteger)year afterMonth:(NSInteger)month afterAay:(NSInteger)day;

+ (NSInteger)getOneDataYear:(NSDate *)date;

+ (NSInteger)getOneDataMonth:(NSDate *)date;

+ (NSInteger)getOneDataDay:(NSDate *)date;

+ (NSDate *)getFrontData:(NSInteger)data;
/**
 *  获取几天后的日期
 *
 *  @param getDataForMonthAndDay getDataForMonthAndDay description
 *
 *  @return <#return value description#>
 */
+ (NSDate *)getBackData:(NSInteger)data;
/**
 *  获取有汉字的月日
 *
 *  @return <#return value description#>
 */
+ (NSString *)getDataForMonthAndDay;

/**
 *  根据时间获取有汉字的月日
 *
 *  @return <#return value description#>
 */
+ (NSString *)getDataForMonthAndDay:(NSDate *)date;

/**
 *  string转换成NSdate
 *
 *  @param dataStr <#dataStr description#>
 *
 *  @return <#return value description#>
 */
+ (NSDate *)getNSDateFromString:(NSString *)dataStr;

/**
 *  获取一个时间某个时间
 *
 *  @param date  时间
 *  @param year  年
 *  @param month 月
 *  @param day   日
 *
 *  @return <#return value description#>
 */
+ (NSString *)getOneData:(NSString *)date AfterYear:(NSInteger)year afterMonth:(NSInteger)month afterDay:(NSInteger)day;
/**
 *  获取YYYY_MM_DD
 *
 *  @return <#return value description#>
 */
+ (NSString *)getDataLikeYYYY_MM_DD;

/**
 *  获取YYYY_MM_DD
 *
 *  @return <#return value description#>
 */
+ (NSString *)getDataLikeYYYY_MM_DD:(NSDate *)date;
/**
 *  获取YYYY.MM.DD
 *
 *  @return <#return value description#>
 */
+ (NSString *)getDataLikeYYYYMMDD;
/**
 *  获取YYYY.MM.DD
 *
 *  @return <#return value description#>
 */
+ (NSString *)getDataLikeYYYYMMDD:(NSDate *)date;

/**
 *  获取YYYY.MM.DD HH:MM:SS
 *
 *  @return <#return value description#>
 */
+ (NSString *)getDataLikeYYYYMMHHssmm:(NSDate *)date;
/**
 *  字符串日期获取date
 *
 *  @param dateStr <#dateStr description#>
 *
 *  @return <#return value description#>
 */
+ ( NSDate*)GetStringToDate:(NSString *)dateStr;

/**
 *  通过日期获取星期几
 */
+ (NSString*)weekDayStr:(NSDate *)format ;

/**
 *  获取某个日期几天后的日期
 */
+ (NSString *)getOneData:(NSDate *)date aftrtYear:(NSInteger)year afterMonth:(NSInteger)month afterAay:(NSInteger)day;

/**
 *  日期计算年龄
 *
 *  @param date <#date description#>
 *
 *  @return <#return value description#>
 */
+ (NSInteger)ageWithDateOfBirth:(NSString *)dateString;
/**
 *  两个时间相差的ss
 *
 *  @param startDate <#startDate description#>
 *  @param endDate   <#endDate description#>
 *
 *  @return <#return value description#>
 */
+ (NSInteger)getSSFromDate:(NSString *)startDate toDate:(NSString *)endDate;

/**
 *  一个时间到现在相差时间
 *
 *  @param startDate <#startDate description#>
 *
 *  @return <#return value description#>
 */
+ (NSInteger)getSSFromDateToNew:(NSString *)startDate;

+ (NSString *)getNewewaftrtYear:(NSInteger)year afterMonth:(NSInteger)month afterAay:(NSInteger)day;
@end
