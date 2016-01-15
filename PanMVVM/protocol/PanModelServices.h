//
//  PanModelServices.h
//  PanMVVM
//
//  Created by 王明哲 on 16/1/14.
//  Copyright © 2016年 王明哲. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PanModelServices <NSObject>

/*
 *  投资列表
 *  borrowStatus -> 0：在售产品 **** 1：预售产品
 */
-(RACSignal *)investDataSiginal;

/*
 *  投资详情
 */
-(RACSignal *)investDetailSiginal;

@end
