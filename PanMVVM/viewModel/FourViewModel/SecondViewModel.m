//
//  SecondViewModel.m
//  PanMVVM
//
//  Created by 王明哲 on 16/1/9.
//  Copyright © 2016年 王明哲. All rights reserved.
//

#import "SecondViewModel.h"
#import "DetailViewModel.h"

@interface SecondViewModel ()

@property (nonatomic , strong , readwrite) RACCommand *detailCommand;

@end

@implementation SecondViewModel

-(void)initialize {
    [super initialize];
    
    @weakify(self)
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

@end
