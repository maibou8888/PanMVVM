//
//  PanRouter.m
//  PanMVVM
//
//  Created by 王明哲 on 16/1/9.
//  Copyright © 2016年 王明哲. All rights reserved.
//

#import "PanRouter.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourViewController.h"
#import "HomePageViewController.h"

#import "FirstViewModel.h"
#import "SecondViewModel.h"
#import "ThirdViewModel.h"
#import "FourViewModel.h"
#import "HomePageViewModel.h"

static PanRouter *_sharedInstance = nil;

@interface PanRouter ()

@property (nonatomic, copy) NSDictionary *viewModelViewMappings; // viewModel到view的映射

@end

@implementation PanRouter

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[super allocWithZone:NULL] init];
    });
    return _sharedInstance;
}

- (id<PanViewProtocol>)viewControllerForViewModel:(id<PanViewModelProtocol>)viewModel {
    NSString *viewController = [self.viewModelViewMappings valueForKey:NSStringFromClass(((NSObject *)viewModel).class)];
    
    NSParameterAssert([NSClassFromString(viewController) conformsToProtocol:@protocol(PanViewProtocol)]);
    NSParameterAssert([NSClassFromString(viewController) instancesRespondToSelector:@selector(initWithViewModel:)]);
    
    return [[NSClassFromString(viewController) alloc] initWithViewModel:viewModel];
}

- (NSDictionary *)viewModelViewMappings {
    return @{
             @"FirstViewModel"   : @"FirstViewController",
             @"SecondViewModel"  : @"SecondViewController",
             @"ThirdViewModel"   : @"ThirdViewController",
             @"FourViewModel"    : @"FourViewController",
             @"HomePageViewModel": @"HomePageViewController",
             @"DetailViewModel"  : @"DetailViewController"
            };
}

@end
