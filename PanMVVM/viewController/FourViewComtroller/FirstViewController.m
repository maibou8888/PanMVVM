//
//  FirstViewController.m
//  PanMVVM
//
//  Created by 王明哲 on 16/1/9.
//  Copyright © 2016年 王明哲. All rights reserved.
//

#import "FirstViewController.h"
#import "FirstViewModel.h"

@interface FirstViewController ()

@property (nonatomic, strong, readwrite) FirstViewModel *viewModel;

@end

@implementation FirstViewController
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
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                                           target:nil action:nil];
    self.navigationItem.rightBarButtonItem.rac_command = self.viewModel.detailCommand;
    
    //requestCommand
    [self.viewModel.requestCommand execute:nil];
    [self.viewModel.requestCommand.errors subscribe:self.viewModel.errors];
    [self.viewModel.requestCommand.executing subscribe:self.viewModel.excutingSignal];
    
    [[RACObserve(self.viewModel, model) ignore:nil] subscribeNext:^(NSArray * responceArray) {
        NSLog(@"responceArray %@",responceArray);
    }];
}
@end
