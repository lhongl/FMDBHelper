//
//  DADateTool.m
//  DATools
//
//  Created by caowenhui on 2017/12/21.
//  Copyright © 2017年 caowenhui. All rights reserved.
//

#import "DADateTool.h"

@implementation DADateTool

// 从身份证上获取年龄 18位身份证
+ (NSString *)getIdentityCardAge:(NSString *)numberStr {
    NSDateFormatter *formatterTow = [[NSDateFormatter alloc]init];
    
    [formatterTow setDateFormat:@"yyyy-MM-dd"];
    
    NSDate *bsyDate = [formatterTow dateFromString:[self birthdayStrFromIdentityCard:numberStr]];
    
    NSTimeInterval dateDiff = [bsyDate timeIntervalSinceNow];
    
    int age = trunc(dateDiff/(60*60*24))/365;
    
    return [NSString stringWithFormat:@"%d",-age];
}

+ (NSString *)birthdayStrFromIdentityCard:(NSString *)numberStr {
    
    NSMutableString *result = [NSMutableString stringWithCapacity:0];
    
    NSString *year = nil;
    
    NSString *month = nil;
    
    
    
    BOOL isAllNumber = YES;
    
    NSString *day = nil;
    
    if([numberStr length]<18)
        
        return result;
    //**从第6位开始 截取8个数
    
    NSString *fontNumer = [numberStr substringWithRange:NSMakeRange(6, 8)];
    //**检测前12位否全都是数字;
    
    const char *str = [fontNumer UTF8String];
    
    const char *p = str;
    
    while (*p!='\0') {
        
        if(!(*p>='0'&&*p<='9'))
            
            isAllNumber = NO;
        
        p++;
        
    }
    
    if(!isAllNumber)
        
        return result;
    
    year = [NSString stringWithFormat:@"19%@",[numberStr substringWithRange:NSMakeRange(8, 2)]];
    
    month = [numberStr substringWithRange:NSMakeRange(10, 2)];
    
    day = [numberStr substringWithRange:NSMakeRange(12,2)];
    
    [result appendString:year];
    
    [result appendString:@"-"];
    
    [result appendString:month];
    
    [result appendString:@"-"];
    
    [result appendString:day];
    
    return result;
}
/**
 
 *  从身份证上获取性别
 
 */
+ (NSString *)getIdentityCardSex:(NSString *)numberStr {
    
    NSString *sex = @"";
    
    //获取18位 二代身份证  性别
    
    if (numberStr.length==18)
        
    {
        int sexInt=[[numberStr substringWithRange:NSMakeRange(16,1)] intValue];
        
        if(sexInt%2!=0) {
            sex = @"男";
        }
        else{
            sex = @"女";
        }
    }
    //  获取15位 一代身份证  性别
    if (numberStr.length==15){
        int sexInt=[[numberStr substringWithRange:NSMakeRange(14,1)] intValue];
        if(sexInt%2!=0){
            sex = @"男";
        }
        else{
            sex = @"女";
        }
    }
    return sex;
}

@end
