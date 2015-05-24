//
//  UIColor+ex.h
//  BookBag
//
//  Created by reylen on 15-5-24.
//  Copyright (c) 2015年 ray. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor(Extension)

+ (UIColor*) colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue;
+ (UIColor*) colorWithR:(CGFloat) r g:(CGFloat) g b:(CGFloat) b;
+ (UIColor*) colorWithHex:(NSInteger)hexValue;
+ (NSString *) hexFromUIColor: (UIColor*) color;
+ (UIColor*) colorWithHexJinStr:(NSString*)JinhexValue;
+ (UIColor*) systemColor;
+ (UIColor*) spBackColor;

@end
