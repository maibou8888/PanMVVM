//
//  PanViewProtocol.h
//  PanMVVM
//
//  Created by 王明哲 on 16/1/8.
//  Copyright © 2016年 王明哲. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PanViewModelProtocol.h"

@protocol PanViewModelProtocol;

@protocol PanViewProtocol <NSObject>

@required

// Initialization method. This is the preferred way to create a new view.
//
// viewModel - corresponding view model
//
// Returns a new view.
- (instancetype)initWithViewModel:(id<PanViewModelProtocol>)viewModel;

// The `viewModel` parameter in `-initWithViewModel:` method.
@property (nonatomic, strong, readonly) id<PanViewModelProtocol> viewModel;

@optional

// Binds the corresponding view model to the view.
- (void)bindViewModel;


@end
