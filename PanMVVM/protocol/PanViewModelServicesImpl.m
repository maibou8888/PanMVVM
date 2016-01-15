//
//  PanViewModelServicesImpl.m
//  PanMVVM
//
//  Created by 王明哲 on 16/1/8.
//  Copyright © 2016年 王明哲. All rights reserved.
//

#import "PanViewModelServicesImpl.h"

@interface PanViewModelServicesImpl ()

@end

@implementation PanViewModelServicesImpl
@synthesize modelServices = _modelServices;

- (instancetype)init {
    self = [super init];
    if (self) {
        _modelServices = [[PanModelServicesImpl alloc] init];
    }
    return self;
}

- (void)pushViewModel:(id<PanViewModelProtocol>)viewModel animated:(BOOL)animated {}

- (void)popViewModelAnimated:(BOOL)animated {}

- (void)popToRootViewModelAnimated:(BOOL)animated {}

- (void)presentViewModel:(id<PanViewModelProtocol>)viewModel animated:(BOOL)animated completion:(VoidBlock)completion {}

- (void)dismissViewModelAnimated:(BOOL)animated completion:(VoidBlock)completion {}

- (void)resetRootViewModel:(id<PanViewModelProtocol>)viewModel {}

@end
