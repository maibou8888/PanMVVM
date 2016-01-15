//
//  PanNavigationControllerStack.h
//  PanMVVM
//
//  Created by 王明哲 on 16/1/9.
//  Copyright © 2016年 王明哲. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PanViewModelServices.h"

@protocol PanViewModelServices;

@interface PanNavigationControllerStack : NSObject

// Initialization method. This is the preferred way to create a new navigation controller stack.
//
// services - The service bus of Model layer.
//
// Returns a new navigation controller stack.
- (instancetype)initWithServices:(id<PanViewModelServices>)services;

// Pushes the navigation controller.
//
// navigationController - the navigation controller
- (void)pushNavigationController:(UINavigationController *)navigationController;

// Pops the top navigation controller in the stack.
//
// Returns the popped navigation controller.
- (UINavigationController *)popNavigationController;

@end
