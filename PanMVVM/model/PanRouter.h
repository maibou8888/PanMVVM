//
//  PanRouter.h
//  PanMVVM
//
//  Created by 王明哲 on 16/1/9.
//  Copyright © 2016年 王明哲. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PanViewProtocol.h"

@protocol PanViewProtocol;

@interface PanRouter : NSObject

// Retrieves the shared router instance.
//
// Returns the shared router instance.
+ (instancetype)sharedInstance;

// Retrieves the view corresponding to the given view model.
//
// viewModel - The view model
//
// Returns the view corresponding to the given view model.
- (id<PanViewProtocol>)viewControllerForViewModel:(id<PanViewModelProtocol>)viewModel;

@end
