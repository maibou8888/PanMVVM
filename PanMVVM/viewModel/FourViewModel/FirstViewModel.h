//
//  FirstViewModel.h
//  PanMVVM
//
//  Created by 王明哲 on 16/1/9.
//  Copyright © 2016年 王明哲. All rights reserved.
//

#import "PanViewModel.h"

@interface FirstViewModel : PanViewModel

@property (nonatomic , strong , readonly) NSArray *model;
@property (nonatomic , strong , readonly) RACCommand *requestCommand;
@property (nonatomic , strong , readonly) RACCommand *detailCommand;

@end
