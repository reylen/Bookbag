//
//  UIImage+Color.h
//  BookBag
//
//  Created by reylen on 15-5-24.
//  Copyright (c) 2015年 ray. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage(Color)

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;
+ (UIImage *)imageWithColor:(UIColor *)color height:(CGFloat) height;
+ (UIImage *)imageWithColor:(UIColor *)color width:(CGFloat) width;

@end
