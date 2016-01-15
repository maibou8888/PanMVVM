//
//  HomePageViewModel.m
//  PanMVVM
//
//  Created by 王明哲 on 16/1/9.
//  Copyright © 2016年 王明哲. All rights reserved.
//

#import "HomePageViewModel.h"

@interface HomePageViewModel ()

@property (nonatomic, strong, readwrite) FirstViewModel   *firstViewModel;
@property (nonatomic, strong, readwrite) SecondViewModel *secondViewModel;
@property (nonatomic, strong, readwrite) ThirdViewModel *thirdViewModel;
@property (nonatomic, strong, readwrite) FourViewModel *fourViewModel;

@end

@implementation HomePageViewModel

-(void)initialize {
    [super initialize];
    
    self.firstViewModel   = [[FirstViewModel alloc] initWithServices:self.services params:nil];
    self.secondViewModel = [[SecondViewModel alloc] initWithServices:self.services params:nil];
    self.thirdViewModel = [[ThirdViewModel alloc] initWithServices:self.services params:nil];
    self.fourViewModel = [[FourViewModel alloc] initWithServices:self.services params:nil];
}

@end
