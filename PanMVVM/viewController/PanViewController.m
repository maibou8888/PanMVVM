//
//  PanViewController.m
//  PanMVVM
//
//  Created by 王明哲 on 16/1/8.
//  Copyright © 2016年 王明哲. All rights reserved.
//

#import "PanViewController.h"
#import "PanViewModel.h"

#import "TWMessageBarManager.h"
#import "MRCLoadingTitleView.h"

@interface PanViewController ()

@property (nonatomic, strong, readwrite) PanViewModel *viewModel;

@end

@implementation PanViewController

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    PanViewController *viewController = [super allocWithZone:zone];
    
    @weakify(viewController)
    [[viewController
      rac_signalForSelector:@selector(viewDidLoad)]
     subscribeNext:^(id x) {
         @strongify(viewController)
         [viewController bindViewModel];
     }];

    return viewController;
}

- (id<PanViewProtocol>)initWithViewModel:(id)viewModel {
    self = [super init];
    if (self) {
        //bindViewModel 方法里面进行RAC
        self.viewModel = viewModel;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.extendedLayoutIncludesOpaqueBars = YES;
}

- (void)bindViewModel {
    //titleView
    UIView *titleView = self.navigationItem.titleView;
    MRCLoadingTitleView *loadingTitleView = [[NSBundle mainBundle] loadNibNamed:@"MRCLoadingTitleView" owner:nil options:nil].firstObject;
    loadingTitleView.origin = CGPointMake((SW - loadingTitleView.width) / 2.0, 0);
    
    //progress
    @weakify(self)
    [self.viewModel.excutingSignal subscribeNext:^(NSNumber *executing) {
        @strongify(self)
        if (executing.boolValue) {
            self.navigationItem.titleView = loadingTitleView;
        } else {
            self.navigationItem.titleView = titleView;
        }
    }];

    //处理error
    [self.viewModel.errors subscribeNext:^(NSError *error) {
        MRCError(error.localizedDescription);
    }];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.viewModel.willDisappearSignal sendNext:nil];
}
@end
