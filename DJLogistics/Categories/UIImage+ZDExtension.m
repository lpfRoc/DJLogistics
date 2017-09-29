//
//  UIImage+ZDExtension.m
//  Loan
//
//  Created by Roc on 16/9/29.
//  Copyright © 2016年 zhengDa. All rights reserved.
//

#import "UIImage+ZDExtension.h"

@implementation UIImage (ZDExtension)
#pragma mark 生成纯色图
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end
