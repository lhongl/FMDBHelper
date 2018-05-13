//
//  UIColor+Extension.h
//  MeMarry
//
//  Created by jinpufan on 15/7/9.
//  Copyright (c) 2015年 jinpufan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extension)
+ (UIColor *)colorWithHex:(long)hexColor;
+ (UIColor *)colorWithHex:(long)hexColor alpha:(CGFloat)alpha;
+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;
+ (UIColor *)colorWithHexString:(NSString *)hexString;
@end
