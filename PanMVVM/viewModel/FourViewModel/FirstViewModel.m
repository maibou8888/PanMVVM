//
//  FirstViewModel.m
//  PanMVVM
//
//  Created by 王明哲 on 16/1/9.
//  Copyright © 2016年 王明哲. All rights reserved.
//

#import "FirstViewModel.h"
#import "DetailViewModel.h"

@interface FirstViewModel ()

@property (nonatomic , strong , readwrite) NSArray *model;
@property (nonatomic , strong , readwrite) RACCommand *requestCommand;
@property (nonatomic , strong , readwrite) RACCommand *detailCommand;

@end

@implementation FirstViewModel

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
    
    self.detailCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal*(id input) {
        return [RACSignal createSignal:^RACDisposable*(id<RACSubscriber> subscriber) {
            @strongify(self);
          
            DetailViewModel *detailViewModel = [[DetailViewModel alloc] initWithServices:self.services params:@"228"];
            [self.services pushViewModel:detailViewModel animated:YES];
            [subscriber sendCompleted];
            return nil;
        }];
    }];
}

-(RACSignal *)requestHomeData {
    return [[self.services modelServices] investDataSiginal];
}

@end
