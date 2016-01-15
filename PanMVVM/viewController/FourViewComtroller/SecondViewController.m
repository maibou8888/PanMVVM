//
//  SecondViewController.m
//  PanMVVM
//
//  Created by 王明哲 on 16/1/9.
//  Copyright © 2016年 王明哲. All rights reserved.
//

#import "SecondViewController.h"
#import "SecondViewModel.h"

@interface SecondViewController ()

@property (nonatomic, strong, readwrite) SecondViewModel *viewModel;

@end

@implementation SecondViewController
@synthesize viewModel = _viewModel;

-(instancetype)initWithViewModel:(id<PanViewModelProtocol>)viewModel {
    self = [super init];
    if (self) {
        self.viewModel = viewModel;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"detail"]
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:nil
                                                                             action:nil];
    //设置全局command事件
    self.navigationItem.rightBarButtonItem.rac_command = self.viewModel.detailCommand;
}

@end
