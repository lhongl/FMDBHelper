//
//  NSString+Size.h
//  DATools
//
//  Created by caowenhui on 2017/12/21.
//  Copyright © 2017年 caowenhui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Size)

- (CGFloat)textWidthWithFontSize:(CGFloat)fontSize;

- (CGSize)textSizeWithWidth:(CGFloat)textWidth fontSize:(CGFloat)fontSize;

- (CGFloat)textViewHeightWithWidth:(CGFloat)textViewWidth fontSize:(CGFloat)fontSize;

@end
