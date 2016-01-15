//
//  PanModelServicesImpl.m
//  PanMVVM
//
//  Created by 王明哲 on 16/1/14.
//  Copyright © 2016年 王明哲. All rights reserved.
//

#import "PanModelServicesImpl.h"

@interface PanModelServicesImpl()<PanModelServices>

@end

@implementation PanModelServicesImpl

-(RACSignal *)investDataSiginal {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager new];
    RACSignal *investSignal = [manager rac_POST:CombineURL(investURL) parameters:nil];
    return [investSignal replayLazily];
}

-(RACSignal *)investDetailSiginal {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager new];
    RACSignal *investSignal = [manager rac_POST:CombineURL(invDetailURL) parameters:nil];;
    return [investSignal replayLazily];
}

@end
