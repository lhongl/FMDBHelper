//
//  DataTime.m
//  类的封装
//
//  Created by WanDing on 16/6/17.
//  Copyright © 2016年 WanDing. All rights reserved.
//

#import "DataTime.h"

@implementation DataTime
+ (NSInteger)compareDate:(NSString*)dateOne withDate:(NSString*)dateTwo{
    
    NSInteger ci;
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"yyyy-MM-dd"];
    NSDate *dt1 = [[NSDate alloc] init];
    NSDate *dt2 = [[NSDate alloc] init];
    dt1 = [df dateFromString:dateOne];
    dt2 = [df dateFromString:dateTwo];
    NSComparisonResult result = [dt1 compare:dt2];
    switch (result)
    {
            //date02比date01大
        case NSOrderedAscending: ci=1; break;
            //date02比date01小
        case NSOrderedDescending: ci=-1; break;
            //date02=date01
        case NSOrderedSame: ci=0; break;
        default: NSLog(@"erorr dates %@, %@", dt2, dt1); break;
    }
    return ci;
}

+ (NSInteger)getOneDataYear:(NSDate *)date{
    
    NSDateComponents * comps = [DataTime get:date];
    
    NSInteger year=[comps year];
    
    return year;
}

+ (NSInteger)getOneDataMonth:(NSDate *)date{
    
    NSDateComponents * comps = [DataTime get:date];
    
    NSInteger month=[comps month];
    
    return month;
}

+ (NSInteger)getOneDataDay:(NSDate *)date{
    
    NSDateComponents * comps = [DataTime get:date];
    NSInteger day=[comps day];
    
    return day;
}

+ (NSInteger)getnewDataYear{
    NSDate *date = [NSDate date];
    NSDateComponents * comps = [DataTime get:date];
    NSInteger year=[comps year];
    
    return year;
}

+ (NSInteger)getnewDataMonth{
    NSDate *date = [NSDate date];
    NSDateComponents * comps = [DataTime get:date];
    NSInteger month=[comps month];
    
    return month;
}

+ (NSInteger)getnewDataDay{
    NSDate *date = [NSDate date];
    NSDateComponents * comps = [DataTime get:date];
    NSInteger day=[comps day];
    return day;
}

+ (NSString *)getDataYewaAndMonthAndDay{
    NSDate *date = [NSDate date];
    NSDateComponents * comps = [DataTime get:date];
    NSInteger day=[comps day];
    NSInteger month=[comps month];
    NSInteger year=[comps year];
    NSString *data = [NSString stringWithFormat:@"%ld-%ld-%ld",(long)year,(long)month,(long)day];
    
    return data ;
    
}
+ (NSString *)getDateStringWhichDay:(NSDate *)date {
    
    NSDateComponents * comps = [DataTime get:date];
    NSInteger day=[comps day];
    NSInteger month=[comps month];
    NSInteger year=[comps year];
    NSString *data = [NSString stringWithFormat:@"%ld-%ld-%ld",(long)year,(long)month,(long)day];
    
    return data ;
    
    
}

+ (NSString *)getSpotDataYewaAndMonthAndDay{
    NSDate *date = [NSDate date];
    NSDateComponents * comps = [DataTime get:date];
    NSInteger day=[comps day];
    NSInteger month=[comps month];
    NSInteger year=[comps year];
    NSString *data = [NSString stringWithFormat:@"%ld.%ld.%ld",(long)year,(long)month,(long)day];
    
    return data ;
    
}

+ (NSDateComponents *)get:(NSDate *)date{
    if (!date) {
        NSLog(@"%s|日期格式有误",__func__);
        return nil;
    }
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] ;
    NSDateComponents *comps = [[NSDateComponents alloc] init] ;
    NSInteger unitFlags = NSYearCalendarUnit |
    
    NSMonthCalendarUnit |
    
    NSDayCalendarUnit |
    
    NSWeekdayCalendarUnit |
    
    NSHourCalendarUnit |
    
    NSMinuteCalendarUnit |
    
    NSSecondCalendarUnit;
    
    comps = [calendar components:unitFlags fromDate:date];
    
    return comps;
    
}

+ (NSString *)getSpotDateStringWhichDay:(NSDate *)date {
    
    NSDateComponents * comps = [DataTime get:date];
    NSInteger day=[comps day];
    NSInteger month=[comps month];
    NSInteger year=[comps year];
    NSString *data = [NSString stringWithFormat:@"%ld.%ld.%ld",(long)year,(long)month,(long)day];
    
    return data ;
    
}

+ (NSInteger)getdaysFromDate:(NSString *)startDate toDate:(NSString *)endDate {
    
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate * data4 = [formatter dateFromString:startDate];
    NSDate *start = [data4 dateByAddingTimeInterval:8*60*60];
    
    
    NSDate * data5 = [formatter dateFromString:endDate];
    NSDate *end = [data5 dateByAddingTimeInterval:8*60*60];
    
    //得到相差秒数
    NSTimeInterval time = [end timeIntervalSinceDate:start];
    int days = ((int)time)/(3600*24);
    int hours = ((int)time)%(3600*24)/3600;
    int minute = ((int)time)%(3600*24)/3600/60;
    if (days <= 0 && hours <= 0&&minute<= 0) {
        return 0;
    }
    else {
        NSLog(@"%@",[[NSString alloc] initWithFormat:@"%i天%i小时%i分钟",days,hours,minute]);
        // 之所以要 + 1，是因为 此处的days 计算的结果 不包含当天 和 最后一天\
        （如星期一 和 星期四，计算机 算的结果就是2天（星期二和星期三），日常算，星期一——星期四相差3天，所以需要+1）\
        对于时分 没有进行计算 可以忽略不计
        return days + 1;
    }
}

+ (NSInteger)daysFromEndDate:(NSString *)getData{
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate * data4 = [formatter dateFromString:getData];
    NSDate *start = [data4 dateByAddingTimeInterval:8*60*60];
    
    NSDate *date = [NSDate date]; // 获得时间对象
    NSString *dateStr = [formatter stringFromDate:date];
    NSDate * data5 = [formatter dateFromString:dateStr];
    NSDate *end = [data5 dateByAddingTimeInterval:8*60*60];
    
    
    //得到相差秒数
    NSTimeInterval time = [start timeIntervalSinceDate:end];
    int days = ((int)time)/(3600*24);
    int hours = ((int)time)%(3600*24)/3600;
    int minute = ((int)time)%(3600*24)/3600/60;
    if (days <= 0 && hours <= 0&&minute<= 0) {
        return 0;
    }
    else {
        NSLog(@"%@",[[NSString alloc] initWithFormat:@"%i天%i小时%i分钟",days,hours,minute]);
        // 之所以要 + 1，是因为 此处的days 计算的结果 不包含当天 和 最后一天\
        （如星期一 和 星期四，计算机 算的结果就是2天（星期二和星期三），日常算，星期一——星期四相差3天，所以需要+1）\
        对于时分 没有进行计算 可以忽略不计
        return days + 1;
    }
}

+ (NSInteger)daysFromStartDate:(NSString *)getData {
    //    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    //    // 话说在真机上需要设置区域，才能正确获取本地日期，天朝代码:zh_CN
    //    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    //    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate * data4 = [formatter dateFromString:getData];
    NSDate *start = [data4 dateByAddingTimeInterval:8*60*60];
    
    NSDate *date = [NSDate date]; // 获得时间对象
    NSString *dateStr = [formatter stringFromDate:date];
    NSDate * data5 = [formatter dateFromString:dateStr];
    NSDate *end = [data5 dateByAddingTimeInterval:8*60*60];
    
    
    //得到相差秒数
    NSTimeInterval time = [end timeIntervalSinceDate:start];
    int days = ((int)time)/(3600*24);
    int hours = ((int)time)%(3600*24)/3600;
    int minute = ((int)time)%(3600*24)/3600/60;
    if (days <= 0 && hours <= 0&&minute<= 0) {
        return 0;
    }
    else {
        NSLog(@"%@",[[NSString alloc] initWithFormat:@"%i天%i小时%i分钟",days,hours,minute]);
        // 之所以要 + 1，是因为 此处的days 计算的结果 不包含当天 和 最后一天\
        （如星期一 和 星期四，计算机 算的结果就是2天（星期二和星期三），日常算，星期一——星期四相差3天，所以需要+1）\
        对于时分 没有进行计算 可以忽略不计
        return days + 1;
    }
}
+ (BOOL)date:(NSString*)date isBetweenDate:(NSString*)beginDate andDate:(NSString*)endDate
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    NSDate * getdata = [formatter dateFromString:date];
    NSDate *getOnedata = [getdata dateByAddingTimeInterval:8*60*60];
    
    NSDate * getbeginData = [formatter dateFromString:beginDate];
    NSDate *getbeg = [getbeginData dateByAddingTimeInterval:8*60*60];
    
    NSDate * getendData = [formatter dateFromString:endDate];
    NSDate *getend = [getendData dateByAddingTimeInterval:8*60*60];
    
    if ([getOnedata compare:getbeg] ==NSOrderedAscending)
        return NO;
    
    if ([getOnedata compare:getend] ==NSOrderedDescending)
        return NO;
    
    return YES;
}
+ (BOOL)date:(NSString*)date andDate:(NSString*)endDate
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    NSDate * getdata = [formatter dateFromString:date];
    NSDate *getOnedata = [getdata dateByAddingTimeInterval:8*60*60];
    
    NSString *data1 = [DataTime getDataYewaAndMonthAndDay];
    NSDate * getbeginData = [formatter dateFromString:data1];
    NSDate *getbeg = [getbeginData dateByAddingTimeInterval:8*60*60];
    
    NSDate * getendData = [formatter dateFromString:endDate];
    NSDate *getend = [getendData dateByAddingTimeInterval:8*60*60];
    
    if ([getOnedata compare:getbeg] ==NSOrderedAscending)
        return NO;
    
    if ([getOnedata compare:getend] ==NSOrderedDescending)
        return NO;
    
    return YES;
}

+ (BOOL)date:(NSString*)date isBeginDate:(NSString*)oneDate
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    NSDate * getdata = [formatter dateFromString:date];
    NSDate *getOnedata = [getdata dateByAddingTimeInterval:8*60*60];
    
    NSDate * getbeginData = [formatter dateFromString:oneDate];
    NSDate *getbeg = [getbeginData dateByAddingTimeInterval:8*60*60];
    NSString *data1 = [DataTime getDataYewaAndMonthAndDay];
    NSDate * getendData = [formatter dateFromString:data1];
    NSDate *getend = [getendData dateByAddingTimeInterval:8*60*60];
    
    if ([getOnedata compare:getbeg] ==NSOrderedAscending)
        return NO;
    
    if ([getOnedata compare:getend] ==NSOrderedDescending)
        return NO;
    
    return YES;
}

+ (NSString *)getOneDataOraftrtYear:(NSInteger)year afterMonth:(NSInteger)month afterAay:(NSInteger)day{
    //得到当前的时间
    NSDate * mydate = [NSDate date];
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    //    NSString *currentDateStr = [dateFormatter stringFromDate:[NSDate date]];
    //    DebugLog(@"---当前的时间的字符串 =%@",currentDateStr);
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents *comps = nil;
    
    comps = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitMonth fromDate:mydate];
    
    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    
    [adcomps setYear:year];
    
    [adcomps setMonth:month];
    
    [adcomps setDay:day];
    NSDate *newdate = [calendar dateByAddingComponents:adcomps toDate:mydate options:0];
    NSString *beforDate = [dateFormatter stringFromDate:newdate];
    
    return beforDate;
}

+ (NSDate *)getFrontData:(NSInteger)data{
    
    NSInteger dis = data; //前后的天数
    NSDate*nowDate = [NSDate date];
    
    NSDate* theDate;
    if(dis!=0)
        
    {
        NSTimeInterval  oneDay = 24*60*60*1;  //1天的长度
        
        theDate = [nowDate initWithTimeIntervalSinceNow: -oneDay*dis ];
        
    }
    
    else
        
    {
        
        theDate = nowDate;
        
    }
    return theDate;
}

+ (NSDate *)getBackData:(NSInteger)data{
    
    NSInteger dis = data; //前后的天数
    NSDate*nowDate = [NSDate date];
    
    NSDate* theDate;
    if(dis!=0)
        
    {
        NSTimeInterval  oneDay = 24*60*60*1;  //1天的长度
        
        
        theDate = [nowDate initWithTimeIntervalSinceNow: +oneDay*dis ];
        
        
    }
    
    else
        
    {
        
        theDate = nowDate;
        
    }
    return theDate;
}

+ (NSString *)getDataForMonthAndDay{
    NSInteger day = [DataTime getnewDataDay];
    NSInteger Month = [DataTime getnewDataMonth];
    NSString *time = [NSString stringWithFormat:@"%ld月%ld日",Month,day];
    return time;
}

+ (NSString *)getDataForMonthAndDay:(NSDate *)date{
    NSInteger day = [DataTime getOneDataDay:date];
    NSInteger Month = [DataTime getOneDataMonth:date];
    NSString *time = [NSString stringWithFormat:@"%ld月%ld日",Month,day];
    return time;
}

+ (NSDate *)getNSDateFromString:(NSString *)dataStr{
    NSDateFormatter *format=[[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-dd"];
    
    NSDate *fromdate=[format dateFromString:dataStr];
    
    NSTimeZone *fromzone = [NSTimeZone systemTimeZone];
    
    NSInteger frominterval = [fromzone secondsFromGMTForDate: fromdate];
    NSDate *fromDate = [fromdate  dateByAddingTimeInterval: frominterval];
    return fromDate;
}

+ (NSString *)getOneData:(NSString *)date AfterYear:(NSInteger)year afterMonth:(NSInteger)month afterDay:(NSInteger)day{
    //得到当前的时间
    NSDate * mydate = [DataTime getNSDateFromString:date];
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    //    NSString *currentDateStr = [dateFormatter stringFromDate:[NSDate date]];
    //    DebugLog(@"---当前的时间的字符串 =%@",currentDateStr);
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents *comps = nil;
    
    comps = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitMonth fromDate:mydate];
    
    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    
    [adcomps setYear:year];
    
    [adcomps setMonth:month];
    
    [adcomps setDay:day];
    NSDate *newdate = [calendar dateByAddingComponents:adcomps toDate:mydate options:0];
    NSString *beforDate = [dateFormatter stringFromDate:newdate];
    
    return beforDate;
}
+ (NSString *)getDataLikeYYYY_MM_DD{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    //用[NSDate date]可以获取系统当前时间
    NSString *currentDateStr = [dateFormatter stringFromDate:[NSDate date]];
    
    return currentDateStr;
    
}

+ (NSString *)getDataLikeYYYY_MM_DD:(NSDate *)date{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    //用[NSDate date]可以获取系统当前时间
    NSString *currentDateStr = [dateFormatter stringFromDate:date];
    
    return currentDateStr;
    
}

+ (NSString *)getDataLikeYYYYMMDD{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyy.MM.dd"];
    //用[NSDate date]可以获取系统当前时间
    NSString *currentDateStr = [dateFormatter stringFromDate:[NSDate date]];
    
    return currentDateStr;
    
}

+ (NSString *)getDataLikeYYYYMMDD:(NSDate *)date{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyy.MM.dd"];
    //用[NSDate date]可以获取系统当前时间
    NSString *currentDateStr = [dateFormatter stringFromDate:date];
    
    return currentDateStr;
    
}

+ (NSString *)getDataLikeYYYYMMHHssmm:(NSDate *)date{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    //用[NSDate date]可以获取系统当前时间
    NSString *currentDateStr = [dateFormatter stringFromDate:date];
    
    return currentDateStr;
    
}


+ ( NSDate*)GetStringToDate:(NSString *)dateStr{
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    
    [inputFormatter setDateFormat:@"yyyy-MM-dd"];
    
    NSDate* inputDate = [inputFormatter dateFromString:dateStr];
    
    return inputDate;
}

+ (NSString*)weekDayStr:(NSDate *)format {
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"7", @"1", @"2", @"3", @"4", @"5", @"6", nil];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    
    [calendar setTimeZone: timeZone];
    
    NSCalendarUnit calendarUnit = NSWeekdayCalendarUnit;
    
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:format];
    
    return [weekdays objectAtIndex:theComponents.weekday];
}

+ (NSString *)getNewewaftrtYear:(NSInteger)year afterMonth:(NSInteger)month afterAay:(NSInteger)day{
    //得到当前的时间
    NSDate * mydate = [NSDate date];
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    //    NSString *currentDateStr = [dateFormatter stringFromDate:[NSDate date]];
    //    DebugLog(@"---当前的时间的字符串 =%@",currentDateStr);
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents *comps = nil;
    
    comps = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitMonth fromDate:mydate];
    
    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    
    [adcomps setYear:year];
    
    [adcomps setMonth:month];
    
    [adcomps setDay:day];
    NSDate *newdate = [calendar dateByAddingComponents:adcomps toDate:mydate options:0];
    NSString *beforDate = [dateFormatter stringFromDate:newdate];
    
    return beforDate;
}


+ (NSString *)getOneData:(NSString *)date aftrtYear:(NSInteger)year afterMonth:(NSInteger)month afterAay:(NSInteger)day{
    //得到当前的时间
    NSDate * mydate = [DataTime getNSDateFromString:date];
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    //    NSString *currentDateStr = [dateFormatter stringFromDate:[NSDate date]];
    //    DebugLog(@"---当前的时间的字符串 =%@",currentDateStr);
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents *comps = nil;
    
    comps = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitMonth fromDate:mydate];
    
    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    
    [adcomps setYear:year];
    
    [adcomps setMonth:month];
    
    [adcomps setDay:day];
    NSDate *newdate = [calendar dateByAddingComponents:adcomps toDate:mydate options:0];
    NSString *beforDate = [dateFormatter stringFromDate:newdate];
    
    return beforDate;
}

+ (NSInteger)ageWithDateOfBirth:(NSString *)dateString
{
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    
    [inputFormatter setDateFormat:@"yyyy-MM-dd"];
    
    NSDate* inputDate = [inputFormatter dateFromString:dateString];
    if (!inputDate) {
        NSLog(@"%s|日期格式有误",__func__);
        return -1;
    }
    // 出生日期转换 年月日
    NSDateComponents *components1 = [[NSCalendar currentCalendar] components:NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit fromDate:inputDate];
    NSInteger brithDateYear  = [components1 year];
    NSInteger brithDateDay   = [components1 day];
    NSInteger brithDateMonth = [components1 month];
    
    // 获取系统当前 年月日
    NSDateComponents *components2 = [[NSCalendar currentCalendar] components:NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit fromDate:[NSDate date]];
    NSInteger currentDateYear  = [components2 year];
    NSInteger currentDateDay   = [components2 day];
    NSInteger currentDateMonth = [components2 month];
    
    // 计算年龄
    NSInteger iAge = currentDateYear - brithDateYear - 1;
    if ((currentDateMonth > brithDateMonth) || (currentDateMonth == brithDateMonth && currentDateDay >= brithDateDay)) {
        iAge++;
    }
    
    return iAge;
}

+ (NSInteger)getSSFromDate:(NSString *)startDate toDate:(NSString *)endDate {
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate * data4 = [formatter dateFromString:startDate];
    NSDate *start = [data4 dateByAddingTimeInterval:8*60*60];
    
    
    NSDate * data5 = [formatter dateFromString:endDate];
    NSDate *end = [data5 dateByAddingTimeInterval:8*60*60];
    
    //得到相差秒数
    NSTimeInterval time = [end timeIntervalSinceDate:start];
    
    return time;
}

+ (NSInteger)getSSFromDateToNew:(NSString *)startDate{
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate * data4 = [formatter dateFromString:startDate];
    NSDate *start = [data4 dateByAddingTimeInterval:8*60*60];
    
    NSDate *end = [[NSDate date] dateByAddingTimeInterval:8*60*60];
    
    //得到相差秒数
    NSTimeInterval time = [end timeIntervalSinceDate:start];
    
    return time;
    return time;
}

@end
