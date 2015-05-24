//
//  UIImage+Color.m
//  BookBag
//
//  Created by reylen on 15-5-24.
//  Copyright (c) 2015年 ray. All rights reserved.
//

#import "UIImage+Color.h"

@implementation UIImage(Color)

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context,
                                   color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}

+ (UIImage *)imageWithColor:(UIColor *)color height:(CGFloat)height {
    return [self imageWithColor:color size:CGSizeMake(20, height)];
}

+ (UIImage *)imageWithColor:(UIColor *)color width:(CGFloat)width {
    return [self imageWithColor:color size:CGSizeMake(width, 44)];
}


@end
