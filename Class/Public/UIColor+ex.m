//
//  UIColor+ex.m
//  BookBag
//
//  Created by reylen on 15-5-24.
//  Copyright (c) 2015年 ray. All rights reserved.
//

#import "UIColor+ex.h"

@implementation UIColor(Extension)

+ (UIColor *)systemColor {
    return [UIColor colorWithHex:0x2789f6];
}
+ (UIColor *)spBackColor {
    return [UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1.0];
}
+ (UIColor *)colorWithR:(CGFloat)r g:(CGFloat)g b:(CGFloat)b {
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0];
}
+ (UIColor*) colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue
{
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
                           green:((float)((hexValue & 0xFF00) >> 8))/255.0
                            blue:((float)(hexValue & 0xFF))/255.0 alpha:alphaValue];
}

+ (UIColor*) colorWithHex:(NSInteger)hexValue
{
    
    return [UIColor colorWithHex:hexValue alpha:1.0];
}

// eg:#11bb20
+ (UIColor*) colorWithHexJinStr:(NSString*)JinhexValue
{
    
    NSString *colorStr = [NSString stringWithFormat:@"%@",JinhexValue];
    if (JinhexValue.length == 4) {
        
        NSRange rang0 = {0,1};
        NSRange rang1 = {1,1};
        NSRange rang2 = {2,1};
        NSRange rang3 = {3,1};
        
        
        NSString *f = [JinhexValue substringWithRange:rang0];
        NSString *r = [JinhexValue substringWithRange:rang1];
        NSString *g = [JinhexValue substringWithRange:rang2];
        NSString *b = [JinhexValue substringWithRange:rang3];
        
        colorStr = [NSString stringWithFormat:@"%@%@%@%@%@%@%@",f,r,r,g,g,b,b];
    }
    
    unsigned hexValue = 0x0;
    NSScanner *scanner = [NSScanner scannerWithString:colorStr];
    
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&hexValue];
    return [UIColor colorWithHex:hexValue alpha:1.0];
}

+ (NSString *) hexFromUIColor: (UIColor*) color {
    if (CGColorGetNumberOfComponents(color.CGColor) < 4) {
        const CGFloat *components = CGColorGetComponents(color.CGColor);
        color = [UIColor colorWithRed:components[0]
                                green:components[0]
                                 blue:components[0]
                                alpha:components[1]];
    }
    
    if (CGColorSpaceGetModel(CGColorGetColorSpace(color.CGColor)) != kCGColorSpaceModelRGB) {
        return [NSString stringWithFormat:@"#FFFFFF"];
    }
    
    return [NSString stringWithFormat:@"#%x%x%x", (int)((CGColorGetComponents(color.CGColor))[0]*255.0),
            (int)((CGColorGetComponents(color.CGColor))[1]*255.0),
            (int)((CGColorGetComponents(color.CGColor))[2]*255.0)];
}


@end
