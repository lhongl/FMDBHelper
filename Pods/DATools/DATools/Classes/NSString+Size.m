//
//  NSString+Size.m
//  DATools
//
//  Created by caowenhui on 2017/12/21.
//  Copyright © 2017年 caowenhui. All rights reserved.
//

#import "NSString+Size.h"

@implementation NSString (Size)

- (CGFloat)textWidthWithFontSize:(CGFloat)fontSize {
    CGSize textSize = [self sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]}];
    return textSize.width;
}

- (CGSize)textSizeWithWidth:(CGFloat)textWidth fontSize:(CGFloat)fontSize {
    NSDictionary *dict = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
    
    CGRect rect = [self boundingRectWithSize:CGSizeMake(textWidth, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    //返回计算出的行高
    return rect.size;
}

- (CGFloat)textViewHeightWithWidth:(CGFloat)textViewWidth fontSize:(CGFloat)fontSize {
    CGFloat width = textViewWidth - 16;
    CGFloat height = [self textSizeWithWidth:width fontSize:fontSize].height;
    return height+16;
}

@end
