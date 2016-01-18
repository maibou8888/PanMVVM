//
//  PanViewProtocol.h
//  PanMVVM
//
//  Created by 王明哲 on 16/1/8.
//  Copyright © 2016年 王明哲. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PanViewModelProtocol;

@protocol PanViewProtocol <NSObject>

@required

//绑定viewModel
- (instancetype)initWithViewModel:(id<PanViewModelProtocol>)viewModel;

//当前视图的viewModel
@property (nonatomic, strong, readonly) id<PanViewModelProtocol> viewModel;

@optional

//绑定方法
- (void)bindViewModel;


@end
