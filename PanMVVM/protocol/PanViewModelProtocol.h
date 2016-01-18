//
//  PanViewModelProtocol.h
//  PanMVVM
//
//  Created by 王明哲 on 16/1/8.
//  Copyright © 2016年 王明哲. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PanViewModelServices;

@protocol PanViewModelProtocol <NSObject>

@required

//初始化viewModelServices,后面为参数
- (instancetype)initWithServices:(id<PanViewModelServices>)viewModelServices params:(id)params;

@property (nonatomic, strong, readonly) id<PanViewModelServices> services;
@property (nonatomic, strong, readonly) id params;

@optional

//errorSignal
@property (nonatomic, strong, readonly) RACSubject *errors;

//excutingSignal
@property (nonatomic, strong, readonly) RACSubject *excutingSignal;

// viewWillDisappear signal
@property (nonatomic, strong, readonly) RACSubject *willDisappearSignal;

//viewModel binding method
- (void)initialize;

@end
