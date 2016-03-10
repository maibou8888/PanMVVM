//
//  DetailViewModel.h
//  PanMVVM
//
//  Created by 王明哲 on 16/1/9.
//  Copyright © 2016年 王明哲. All rights reserved.
//

#import "PanViewModel.h"

@interface DetailViewModel : PanViewModel

@property (nonatomic , strong , readonly) NSArray *model;
@property (nonatomic , strong , readonly) NSString *projectID;
@property (nonatomic , strong , readonly) RACCommand *requestCommand;

@end
