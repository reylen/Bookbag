//
//  PublicUtils.m
//  BookBag
//
//  Created by reylen on 15-5-24.
//  Copyright (c) 2015年 ray. All rights reserved.
//

#import "PublicUtils.h"

@implementation PublicUtils

+ (NSString *) docmentPath {
    
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
}

+ (NSString *) libraryPath {
    
    return [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) firstObject];
}

+ (NSString *) bookbagPath {
    
    return [[self docmentPath] stringByAppendingPathComponent:@"mybookbag.plist"];
}

+ (NSArray *) myBookbagsArray {
    return [NSArray arrayWithContentsOfFile:[self bookbagPath]];
}

+ (BOOL) saveBookbag:(NSArray *) bookbags {
    
    return [bookbags writeToFile:[self bookbagPath] atomically:YES];
}

+ (NSDictionary *) bookBagInfoWithID:(NSString *) guid {
    
    NSArray *myBags = [PublicUtils myBookbagsArray];
    for (NSDictionary*info in myBags) {
        if ([[info objectForKey:@"id"] isEqualToString:guid]) {
            return info;
        }
    }
    
    return nil;
}

+ (NSString *) guidString
{
    CFUUIDRef uuid_ref = CFUUIDCreate(NULL);
    CFStringRef uuid_string_ref= CFUUIDCreateString(NULL, uuid_ref);
    
    CFRelease(uuid_ref);
    NSString *uuid = [NSString stringWithString:(NSString*)uuid_string_ref];
    
    CFRelease(uuid_string_ref);
    return uuid;
}



+ (NSString *) stringFromDate:(NSDate *) date {
    
    NSDateFormatter *dateformatter = [[[NSDateFormatter alloc]init] autorelease];
    [dateformatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [dateformatter stringFromDate:date];
}
@end
