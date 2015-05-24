//
//  PublicUtils.h
//  BookBag
//
//  Created by reylen on 15-5-24.
//  Copyright (c) 2015年 ray. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PublicUtils : NSObject

#pragma mark - Public
+ (NSString *) docmentPath;
+ (NSString *) libraryPath;

#pragma mark - bookbag
+ (NSString *) bookbagPath;
+ (NSArray *) myBookbagsArray;
+ (BOOL) saveBookbag:(NSArray *) bookbags;
+ (NSDictionary *) bookBagInfoWithID:(NSString *) guid;

+ (NSString *) guidString;
+ (NSString *) stringFromDate:(NSDate *) date;

@end
