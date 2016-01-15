//
//  AppDelegate.m
//  PanMVVM
//
//  Created by 王明哲 on 16/1/8.
//  Copyright © 2016年 王明哲. All rights reserved.
//

#import "AppDelegate.h"
#import "HomePageViewModel.h"
#import "PanViewModelServicesImpl.h"

@interface AppDelegate ()

@property (nonatomic, strong) PanViewModelServicesImpl *services;
@property (nonatomic, strong, readwrite) PanNavigationControllerStack *navigationControllerStack;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.services = [[PanViewModelServicesImpl alloc] init];
    self.navigationControllerStack = [[PanNavigationControllerStack alloc] initWithServices:self.services];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    //settings
    [self configureAppearance];
    [self.services resetRootViewModel:[self createInitialViewModel]];
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (id<PanViewModelProtocol>)createInitialViewModel {
    return [[HomePageViewModel alloc] initWithServices:self.services params:nil];
}

- (void)configureAppearance {
    //背景色
    [UINavigationBar appearance].barTintColor = tabbarColor;
    
    //黑色背景 白色文字
    [UINavigationBar appearance].barStyle  = UIBarStyleBlack;
    [UINavigationBar appearance].tintColor = [UIColor whiteColor];
    [UINavigationBar appearance].titleTextAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:19],
                                                         NSForegroundColorAttributeName:[UIColor whiteColor]};
}

@end
