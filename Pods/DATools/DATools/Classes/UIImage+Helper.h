//
//  UIImage+Helper.h
//  NHImgMergePro
//
//  Created by mac on 16/4/28.
//  Copyright © 2016年 李宏亮. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Helper)

/**
 *	@brief	二维码
 *
 *	@param 	code 	传东西
 *	@param 	size 	大小
 *
 *	@return	会给你传个图
 */
+ (UIImage *)generateQRCode:(NSString *)code size:(CGSize)size;

/**
 *	@brief	条形码
 *

 */

+ (UIImage *)generateBarCode:(NSString *)code size:(CGSize)size;

/**
 *	@brief	merge image
 *
 *	@param 	icon 	the small icon image to merge in center
 *	@param 	size 	meger size
 *
 *	@return	merged image
 */
- (UIImage *)mergeImage:(UIImage *)icon size:(CGSize)size;

//颜色转图片
+ (UIImage *)imageWithColor:(UIColor *)color;

//颜色转图片
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;


//彩色二维码
+ (UIImage *)qrCodeImageWithContent:(NSString *)content
                      codeImageSize:(CGFloat)size
                               logo:(UIImage *)logo
                          logoFrame:(CGRect)logoFrame
                                red:(CGFloat)red
                              green:(CGFloat)green
                               blue:(NSInteger)blue;



/*
 
 // 01 先创建二维码图片、在合并logo图片生成最后的带logo的二维码图片。（logo的背景是白色的）
 UIImageView *imagView=[[UIImageView alloc]initWithFrame:CGRectMake(50, 4, 220, 220)];
 CGSize QRSize = CGSizeMake(220.0f, 220.0f);
 imagView.image=[UIImage generateQRCode:@"12121" size:QRSize ];
 
 CGSize LogoSize = CGSizeMake(40.0f, 40.0f);
 imagView.image= [imagView.image  mergeImage:[UIImage imageNamed:@"btn_login_gender_r"] size:LogoSize];
 [self.view addSubview: imagView];
 
 
 
 // 02 这里是生产条形码的图片
 UIImageView *imagView1=[[UIImageView alloc]initWithFrame:CGRectMake(50, 234, 220, 100)];
 CGSize size1 = CGSizeMake(220.0f, 220.0f);
 imagView1.image=[UIImage generateBarCode:@"v5" size:size1 ];
 [self.view addSubview:imagView1];
 
 
 
 
 // 03 直接一步生产带log的二维码图片（这里的logo不带白色背景的logo）
 UIImageView *imagView11=[[UIImageView alloc]initWithFrame:CGRectMake(50, 334, 220, 220)];
 imagView11.image=[UIImage qrCodeImageWithContent:@"在这里填写要转二维码的信息" codeImageSize:1000 logo:[UIImage imageNamed:@"btn_login_gender_r"] logoFrame:CGRectMake(400, 400, 200, 200) red:100 green:100 blue:100 ];
 [self.view addSubview:imagView11];
 
 
 */


@end
