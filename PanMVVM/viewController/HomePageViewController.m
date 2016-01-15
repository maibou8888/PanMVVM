//
//  HomePageViewController.m
//  PanMVVM
//
//  Created by 王明哲 on 16/1/9.
//  Copyright © 2016年 王明哲. All rights reserved.
//

#import "HomePageViewController.h"
#import "HomePageViewModel.h"

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourViewController.h"

@interface HomePageViewController ()

@property (nonatomic, strong) HomePageViewModel *homeViewModel;

@end

@implementation HomePageViewController

-(instancetype)initWithViewModel:(id<PanViewModelProtocol>)viewModel {
    self = [super init];
    if (self) {
        self.homeViewModel = viewModel;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINavigationController *firstNavigationController = ({
        FirstViewController *firstVC = [[FirstViewController alloc] initWithViewModel:self.homeViewModel.firstViewModel];

        firstVC.title = @"在售商品";
        UIImage *itemImage = [UIImage imageNamed:@"home_s.png"];
        firstVC.tabBarItem  = [[UITabBarItem alloc] initWithTitle:@"在售" image:itemImage tag:1];
        
        [[UINavigationController alloc] initWithRootViewController:firstVC];
    });
    
    UINavigationController *secondNavigationController = ({
        SecondViewController *secondVC = [[SecondViewController alloc] initWithViewModel:self.homeViewModel.secondViewModel];
        
        secondVC.title = @"预售商品";
        UIImage *itemImage = [UIImage imageNamed:@"money_s.png"];
        secondVC.tabBarItem  = [[UITabBarItem alloc] initWithTitle:@"预售" image:itemImage tag:2];
        
        [[UINavigationController alloc] initWithRootViewController:secondVC];
    });

    
    UINavigationController *thirdNavigationController = ({
        ThirdViewController *thirdVC = [[ThirdViewController alloc] initWithViewModel:self.homeViewModel.thirdViewModel];
        
        thirdVC.title = @"我的";
        UIImage *itemImage = [UIImage imageNamed:@"mine_s.png"];
        thirdVC.tabBarItem  = [[UITabBarItem alloc] initWithTitle:@"我的" image:itemImage tag:3];
        
        [[UINavigationController alloc] initWithRootViewController:thirdVC];
    });

    
    UINavigationController *fourNavigationController = ({
        FourViewController *fourVC = [[FourViewController alloc] initWithViewModel:self.homeViewModel.fourViewModel];
        
        fourVC.title = @"更多";
        UIImage *itemImage = [UIImage imageNamed:@"more_s.png"];
        fourVC.tabBarItem  = [[UITabBarItem alloc] initWithTitle:@"更多" image:itemImage tag:4];
        
        [[UINavigationController alloc] initWithRootViewController:fourVC];
    });

    self.tabBarController.viewControllers = @[firstNavigationController, secondNavigationController,
                                              thirdNavigationController, fourNavigationController];
    [PANDelegate.navigationControllerStack pushNavigationController:firstNavigationController];
    
    [[self
      rac_signalForSelector:@selector(tabBarController:didSelectViewController:)
      fromProtocol:@protocol(UITabBarControllerDelegate)]
     subscribeNext:^(RACTuple *tuple) {
         [PANDelegate.navigationControllerStack popNavigationController];
         [PANDelegate.navigationControllerStack pushNavigationController:tuple.second];
     }];
    
    [self.tabBarController.tabBar setTintColor:tabbarColor];
    self.tabBarController.delegate = self;
}

@end
