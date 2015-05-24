//
//  AppDelegate.h
//  BookBag
//
//  Created by reylen on 15-5-23.
//  Copyright (c) 2015年 ray. All rights reserved.
//

#define Current_Bag_Id @"Current_Bag_Id"

#import <UIKit/UIKit.h>
#import "BBRootViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) BBRootViewController *viewController;

@property (copy, nonatomic) NSString    *currentBookBagID;

@end

