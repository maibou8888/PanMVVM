//
//  PanViewModelServices.h
//  PanMVVM
//
//  Created by 王明哲 on 16/1/8.
//  Copyright © 2016年 王明哲. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PanModelServicesImpl.h"

typedef void (^VoidBlock)();

@protocol PanViewModelProtocol;

@protocol PanViewModelServices <NSObject>

//model的service
@property (nonatomic, strong, readonly) id<PanModelServices> modelServices;

//视图之间的导航
- (void)pushViewModel:(id<PanViewModelProtocol>)viewModel animated:(BOOL)animated;

- (void)popViewModelAnimated:(BOOL)animated;

- (void)popToRootViewModelAnimated:(BOOL)animated;

- (void)presentViewModel:(id<PanViewModelProtocol>)viewModel animated:(BOOL)animated completion:(VoidBlock)completion;

- (void)dismissViewModelAnimated:(BOOL)animated completion:(VoidBlock)completion;

- (void)resetRootViewModel:(id<PanViewModelProtocol>)viewModel;


@end
