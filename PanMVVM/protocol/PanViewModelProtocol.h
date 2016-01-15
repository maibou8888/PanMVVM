//
//  PanViewModelProtocol.h
//  PanMVVM
//
//  Created by 王明哲 on 16/1/8.
//  Copyright © 2016年 王明哲. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PanViewModelServices.h"

@protocol PanViewModelServices;

@protocol PanViewModelProtocol <NSObject>

@required

// Initialization method. This is the preferred way to create a new viewModel.
//
// services - The service bus of Model layer.
// params   - The parameters to be passed to view model.
//
// Returns a new view model.
- (instancetype)initWithServices:(id<PanViewModelServices>)viewModelServices params:(id)params;

// The `services` parameter in `-initWithServices:` method.
@property (nonatomic, strong, readonly) id<PanViewModelServices> services;

// The `params` parameter in `-initWithServices:params:` method.
@property (nonatomic, strong, readonly) id params;

@optional

// A RACSubject object, which representing all errors occurred in view model.
@property (nonatomic, strong, readonly) RACSubject *errors;

// viewWillDisappear signal
@property (nonatomic, strong, readonly) RACSubject *willDisappearSignal;

//viewModel binding method
- (void)initialize;

@end
