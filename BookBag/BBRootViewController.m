//
//  BBRootViewController.m
//  BookBag
//
//  Created by reylen on 15-5-23.
//  Copyright (c) 2015年 ray. All rights reserved.
//

#import "BBRootViewController.h"

@interface BBRootViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (retain, nonatomic)   NSArray *dataArray;
@end

@implementation BBRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self initUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)dealloc {
    [_headerView release];
    [_button1 release];
    [_button2 release];
    [_button3 release];
    [_tableView release];
    [_infoButton release];
    [super dealloc];
}

- (void) initUI {
    
//    _button1.backgroundColor = [UIColor whiteColor];
//    _button2.backgroundColor = [UIColor whiteColor];
//    _button3.backgroundColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem  = [[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemOrganize target:self action:@selector(settingAction:)] autorelease];
    
    self.tableView.hidden = YES;
    self.infoButton.titleLabel.numberOfLines = 0;
    self.infoButton.titleLabel.textAlignment = NSTextAlignmentCenter;
}
#pragma mark - 

- (NSArray *)dataArray {
    
    if (_dataArray == nil) {
        _dataArray = [[NSArray alloc]initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"bookbagConfig" ofType:@"plist"]];
    }
    
    return _dataArray;
}

#pragma mark - Action
- (IBAction)tapAction:(id)sender {
    [self button1TouchAction:nil];
}
- (IBAction)settingAction:(id)sender {
    
}

- (IBAction)button1TouchAction:(id)sender {
    
    BBCreateBookbagViewController *create = [[[BBCreateBookbagViewController alloc]initWithNibName:nil bundle:nil] autorelease];
    [self.navigationController pushViewController:create  animated:YES];
}

- (IBAction)button2TouchAction:(id)sender {
}

- (IBAction)button3TouchAction:(id)sender {
}

- (IBAction)infoButtonTouchAction:(id)sender {
    
    [self button1TouchAction:nil];
}

#pragma mark - TableView Delegate

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.dataArray count];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [[[self dataArray] objectAtIndex:section] count];
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 60;
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    switch (section) {
        case 0:
            return @"书包";
            break;
        case 1:
            return @"电子书包";
        default:
            return nil;
            break;
    }
    
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    NSArray *infoArray = [[self.dataArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    NSString *value = [infoArray firstObject];
    
    cell.textLabel.text = value;
    cell.imageView.image = [UIImage imageNamed:[infoArray lastObject]];
    
    return cell;
}

@end
