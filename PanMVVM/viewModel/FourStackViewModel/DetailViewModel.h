//
//  DetailViewModel.h
//  PanMVVM
//
//  Created by 王明哲 on 16/1/9.
//  Copyright © 2016年 王明哲. All rights reserved.
//

#import "PanViewModel.h"

@interface DetailViewModel : PanViewModel

@property (nonatomic , strong) NSArray *model;
@property (nonatomic , strong) NSString *projectID;
@property (nonatomic , strong) RACCommand *requestCommand;

@end
