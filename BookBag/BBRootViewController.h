//
//  BBRootViewController.h
//  BookBag
//
//  Created by reylen on 15-5-23.
//  Copyright (c) 2015年 ray. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BBCreateBookbagViewController.h"
#import "BBBookbagListController.h"

@interface BBRootViewController : UIViewController

@property (retain, nonatomic) IBOutlet UIView *headerView;
@property (retain, nonatomic) IBOutlet UIButton *infoButton;

@property (retain, nonatomic) IBOutlet UIButton *button1;
@property (retain, nonatomic) IBOutlet UIButton *button2;
@property (retain, nonatomic) IBOutlet UIButton *button3;
@property (retain, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)button1TouchAction:(id)sender;
- (IBAction)button2TouchAction:(id)sender;
- (IBAction)button3TouchAction:(id)sender;
- (IBAction)infoButtonTouchAction:(id)sender;

@end
