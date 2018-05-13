//
//  DADateTool.h
//  DATools
//
//  Created by caowenhui on 2017/12/21.
//  Copyright © 2017年 caowenhui. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 日期工具类
 */
@interface DADateTool : NSObject
// 从身份证上获取年龄 18位身份证
+ (NSString *)getIdentityCardAge:(NSString *)numberStr;
//获取出生日期
+ (NSString *)birthdayStrFromIdentityCard:(NSString *)numberStr;
// 从身份证上获取性别
+ (NSString *)getIdentityCardSex:(NSString *)numberStr;

@end
