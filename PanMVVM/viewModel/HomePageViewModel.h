//
//  HomePageViewModel.h
//  PanMVVM
//
//  Created by 王明哲 on 16/1/9.
//  Copyright © 2016年 王明哲. All rights reserved.
//

#import "PanViewModel.h"
#import "FirstViewModel.h"
#import "SecondViewModel.h"
#import "ThirdViewModel.h"
#import "FourViewModel.h"

@interface HomePageViewModel : PanViewModel

@property (nonatomic, strong, readonly) FirstViewModel *firstViewModel;
@property (nonatomic, strong, readonly) SecondViewModel *secondViewModel;
@property (nonatomic, strong, readonly) ThirdViewModel *thirdViewModel;
@property (nonatomic, strong, readonly) FourViewModel *fourViewModel;

@end
