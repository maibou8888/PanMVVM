//
//  PanNavigationControllerStack.h
//  PanMVVM
//
//  Created by 王明哲 on 16/1/9.
//  Copyright © 2016年 王明哲. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PanViewModelServices;

@interface PanNavigationControllerStack : NSObject

//用service创建PanNavigationControllerStack
- (instancetype)initWithServices:(id<PanViewModelServices>)services;

//push & pop UINavigationController
- (void)pushNavigationController:(UINavigationController *)navigationController;
- (UINavigationController *)popNavigationController;

@end
