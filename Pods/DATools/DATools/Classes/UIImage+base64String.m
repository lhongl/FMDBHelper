//
//  UIImage+base64String.m
//  MobileDoctor
//
//  Created by caowenhui on 2017/11/15.
//  Copyright © 2017年 Doctor Around. All rights reserved.
//

#import "UIImage+base64String.h"

@implementation UIImage (base64String)

+ (UIImage *)imageWithBase64String:(NSString *)string {
    if (!string||[string isEqualToString:@""]) {
        return nil;
    }
    NSData *data = [[NSData alloc] initWithBase64EncodedString:string options:NSDataBase64DecodingIgnoreUnknownCharacters];
    UIImage *image = [UIImage imageWithData:data];
    return image;
}

+ (void)imageWithBase64String:(NSString *)string compltion:(void (^)(UIImage *))completion {
    if (!string||[string isEqualToString:@""]) {
        if (completion) {
            completion(nil);
        }
        return;
    }
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData *data = [[NSData alloc] initWithBase64EncodedString:string options:NSDataBase64DecodingIgnoreUnknownCharacters];
        UIImage *image = [UIImage imageWithData:data];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (completion) {
                completion(image);
            }
        });
    });
}

@end
