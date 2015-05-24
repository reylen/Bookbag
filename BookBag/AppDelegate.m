//
//  AppDelegate.m
//  BookBag
//
//  Created by reylen on 15-5-23.
//  Copyright (c) 2015年 ray. All rights reserved.
//

#import "AppDelegate.h"
#import "UIImage+Color.h"
#import "UIColor+ex.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [_viewController release];
    [_currentBookBagID release];
    
    [super dealloc];
}

- (void)setCurrentBookBagID:(NSString *)currentBookBagID {
    
    if (_currentBookBagID != currentBookBagID) {
        _currentBookBagID = currentBookBagID;
        if (_viewController && _viewController.tableView) {
            _viewController.tableView.hidden = NO;
            [_viewController.tableView reloadData];
        }

    }
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    CGRect frame = [UIScreen mainScreen].bounds;
    self.window = [[[UIWindow alloc]initWithFrame:frame] autorelease];
    
    self.currentBookBagID = [[NSUserDefaults standardUserDefaults] stringForKey:Current_Bag_Id];
    
    self.viewController = [[[BBRootViewController alloc]initWithNibName:nil bundle:nil] autorelease];
    self.viewController.title = @"我的书包";
    
    UINavigationController *navigationController = [[[UINavigationController alloc]initWithRootViewController:_viewController] autorelease];
    self.window.rootViewController = navigationController;
    
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    [navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor redColor] height:66] forBarPosition:UIBarPositionTop barMetrics:UIBarMetricsDefault];
    navigationBar.tintColor = [UIColor whiteColor];
    navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    
    [self.window makeKeyAndVisible];
    self.window.backgroundColor = [UIColor whiteColor];
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
