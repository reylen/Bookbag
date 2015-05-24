//
//  BBCreateBookbagViewController.m
//  BookBag
//
//  Created by reylen on 15-5-24.
//  Copyright (c) 2015年 ray. All rights reserved.
//

#import "BBCreateBookbagViewController.h"
#import "PublicUtils.h"
#import "AppDelegate.h"

@interface BBCreateBookbagViewController (){
    MBProgressHUD* HUD;
}
@end

@implementation BBCreateBookbagViewController
- (AppDelegate *) appDelegate {
    
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
    
}
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


- (void)dealloc {
    [_textField release];
    [super dealloc];
}
#pragma mark - Action
- (void) dismissHUD {
    
    HUD.labelText = @"创建成功";
    [HUD hide:YES afterDelay:.5];
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (IBAction)doneAction:(id)sender {
    
    HUD = [[MBProgressHUD showHUDAddedTo:self.view animated:YES] retain];
    
    //常用的设置
    //小矩形的背景色
    HUD.color = [UIColor blackColor];//这儿表示无背景

    //是否有庶罩
    HUD.dimBackground = YES;
    
    NSString *value = _textField.text;
    value = [value stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    if (value.length > 0) {
        
        //显示的文字
        HUD.labelText = @"创建中";
        
        NSString *_guid = [PublicUtils guidString];
        NSDictionary *info = @{@"id":_guid,@"title":value,@"createDate":[PublicUtils stringFromDate:[NSDate date]]};
        
        NSMutableArray *bookbags = [NSMutableArray array];
        
        if ([PublicUtils myBookbagsArray].count > 0) {
            [bookbags addObjectsFromArray:[PublicUtils myBookbagsArray]];
        }
        
        [bookbags addObject:info];
        BOOL success = [PublicUtils saveBookbag:bookbags];
        if (!success) {
            HUD.labelText = @"创建失败";
            [HUD hide:YES afterDelay:.8];
        }
        else
        {
            [[NSUserDefaults standardUserDefaults] setObject:_guid forKey:Current_Bag_Id];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            [self appDelegate].currentBookBagID = _guid;
            [self performSelector:@selector(dismissHUD) withObject:nil afterDelay:.6];
        }
    }
    else
    {
        //显示的文字
        HUD.labelText = @"输入不能为空字符";
        [HUD hide:YES afterDelay:1.0];
    }
    
}

#pragma mark - MBPro


@end
