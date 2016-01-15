//
//  DetailViewModel.m
//  PanMVVM
//
//  Created by 王明哲 on 16/1/9.
//  Copyright © 2016年 王明哲. All rights reserved.
//

#import "DetailViewModel.h"
#import "PanViewModelServicesImpl.h"

@interface DetailViewModel ()

@property (nonatomic , retain , readwrite) PanViewModelServicesImpl *services;

@end

@implementation DetailViewModel
@synthesize services;

-(instancetype)initWithServices:(id<PanViewModelServices>)viewModelServices params:(id)params {
    self = [super initWithServices:viewModelServices params:params];
    if (self) {
        self.projectID = (NSString *)params;
        self.services = viewModelServices;
    }
    return self;
}

-(void)initialize {
    [super initialize];
    
    @weakify(self)
    void (^doNext)(RACTuple *) = ^(RACTuple *tuple) {
        @strongify(self)
        self.model = tuple.first;
    };
    
    self.requestCommand = [[RACCommand alloc] initWithSignalBlock:^(id input) {
        return [[self requestHomeData] doNext:doNext];
    }];
}

-(RACSignal *)requestHomeData {
    return [[self.services modelServices] investDetailSiginal];
}


@end
