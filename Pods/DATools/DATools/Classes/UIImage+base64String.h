//
//  UIImage+base64String.h
//  MobileDoctor
//
//  Created by caowenhui on 2017/11/15.
//  Copyright © 2017年 Doctor Around. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (base64String)
//syn
+ (UIImage *)imageWithBase64String:(NSString *)string;
//asyn
+ (void)imageWithBase64String:(NSString *)string compltion:(void(^)(UIImage *image))completion;

@end
