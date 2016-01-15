//
//  PanViewModel.m
//  PanMVVM
//
//  Created by 王明哲 on 16/1/8.
//  Copyright © 2016年 王明哲. All rights reserved.
//

#import "PanViewModel.h"

@interface PanViewModel ()

@property (nonatomic, strong, readwrite) id<PanViewModelServices> services;
@property (nonatomic, strong, readwrite) id params;

@end

@implementation PanViewModel

@synthesize services = _services;
@synthesize params   = _params;
@synthesize errors   = _errors;
@synthesize willDisappearSignal = _willDisappearSignal;

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    PanViewModel *viewModel = [super allocWithZone:zone];
    
    @weakify(viewModel)
    [[viewModel
      rac_signalForSelector:@selector(initWithServices:params:)]
    	subscribeNext:^(id x) {
            @strongify(viewModel)
            [viewModel initialize];
        }];
    
    return viewModel;
}

- (instancetype)initWithServices:(id<PanViewModelServices>)viewModelServices params:(id)params {
    self = [super init];
    if (self) {
        self.services = viewModelServices;
        self.params   = params;
    }
    return self;
}

- (RACSubject *)errors {
    if (!_errors) _errors = [RACSubject subject];
    return _errors;
}

- (RACSubject *)willDisappearSignal {
    if (!_willDisappearSignal) _willDisappearSignal = [RACSubject subject];
    return _willDisappearSignal;
}

- (void)initialize {}

@end
