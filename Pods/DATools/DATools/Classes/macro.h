//
//  macro.h
//  DATools
//
//  Created by caowenhui on 2017/12/14.
//  Copyright © 2017年 caowenhui. All rights reserved.
//

#ifndef macro_h
#define macro_h

//屏幕宽度
#define kDEVICEWIDTH  [UIScreen mainScreen].bounds.size.width
//屏幕高度
#define kDEVICEHEIGHT  [UIScreen mainScreen].bounds.size.height
//状态栏高度
#define kStatusBarHeight  CGRectGetHeight([UIApplication sharedApplication].statusBarFrame)
//导航栏+状态栏高度（兼容iPhoneX）
#define kSafeAreaTopHeight (kStatusBarHeight+44)
//底部高度（兼容iPhoneX）
#define kSafeAreaBottomHeight ((kDEVICEHEIGHT == 812.0 ? 34 : 0))
//是否iPad
#define isPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

//=============================判断是否为空=============================
#define kStringIsEmpty(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str isEqualToString:@"<null>"] || [str length] < 1 ? YES : NO )

#define kArrayIsEmpty(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)

#define kDictIsEmpty(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0)

//颜色
#define kColorFromRGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define kColorFromRGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

//--------------------view边框和切角-----------------
#define ViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]


#define ViewRadius(View, Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\

//日志打印
#ifdef DEBUG
#define DLog( s, ... ) NSLog( @"<%p %@:(%d)> %@", self, [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )
#else
#define DLog( s, ... ) do { } while(0);
#endif

//弱引用
#define kweakSelf(type)  __weak typeof(type) weak##type = type;
#define kstrongSelf(type) __strong typeof(type) type = weak##type;

//获取系统对象
#define kAppWindow [UIApplication sharedApplication].keyWindow

#define kApplication [UIApplication sharedApplication]

#define kUserDefaults [NSUserDefaults standardUserDefaults]

#define kNotificationCenter [NSNotificationCenter defaultCenter]

//文件路径
#define kDocumentDIR NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject

#endif /* macro_h */
