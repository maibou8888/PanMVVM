//
//  SecondViewModel.h
//  PanMVVM
//
//  Created by 王明哲 on 16/1/9.
//  Copyright © 2016年 王明哲. All rights reserved.
//

#import "PanViewModel.h"

@interface SecondViewModel : PanViewModel

@property (nonatomic , strong) RACCommand *detailCommand;

@end
