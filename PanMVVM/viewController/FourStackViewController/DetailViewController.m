//
//  DetailViewController.m
//  PanMVVM
//
//  Created by 王明哲 on 16/1/9.
//  Copyright © 2016年 王明哲. All rights reserved.
//

#import "DetailViewController.h"
#import "DetailViewModel.h"

@interface DetailViewController ()

@property (nonatomic, strong, readwrite) DetailViewModel *viewModel;

@end

@implementation DetailViewController
@synthesize viewModel = _viewModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"详细";
    
    [self.viewModel.requestCommand execute:nil];
    [self.viewModel.requestCommand.errors subscribe:self.viewModel.errors];
    
    [[RACObserve(self.viewModel, model) ignore:nil] subscribeNext:^(id x) {
        NSLog(@"responceData %@",x);
    }];
}

@end
