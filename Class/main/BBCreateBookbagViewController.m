//
//  BBCreateBookbagViewController.m
//  BookBag
//
//  Created by reylen on 15-5-24.
//  Copyright (c) 2015年 ray. All rights reserved.
//

#import "BBCreateBookbagViewController.h"

@interface BBCreateBookbagViewController ()

@end

@implementation BBCreateBookbagViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib
    self.title = @"创建书包";
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneAction:)] autorelease];
    
    [self.textField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)dealloc {
    [_textField release];
    [super dealloc];
}
#pragma mark - Action

- (IBAction)doneAction:(id)sender {
    
}

@end
