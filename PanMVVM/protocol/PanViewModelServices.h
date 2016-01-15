//
//  PanViewModelServices.h
//  PanMVVM
//
//  Created by 王明哲 on 16/1/8.
//  Copyright © 2016年 王明哲. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PanViewModelProtocol.h"
#import "PanModelServicesImpl.h"

typedef void (^VoidBlock)();

@protocol PanViewModelProtocol;

@protocol PanViewModelServices <NSObject>

@property (nonatomic, strong, readonly) id<PanModelServices> modelServices;

// Pushes the corresponding view controller.
//
// Uses a horizontal slide transition.
// Has no effect if the corresponding view controller is already in the stack.
//
// viewModel - the view model
// animated  - use animation or not
- (void)pushViewModel:(id<PanViewModelProtocol>)viewModel animated:(BOOL)animated;

// Pops the top view controller in the stack.
//
// animated - use animation or not
- (void)popViewModelAnimated:(BOOL)animated;

// Pops until there's only a single view controller left on the stack.
//
// animated - use animation or not
- (void)popToRootViewModelAnimated:(BOOL)animated;

// Present the corresponding view controller.
//
// viewModel  - the view model
// animated   - use animation or not
// completion - the completion handler
- (void)presentViewModel:(id<PanViewModelProtocol>)viewModel animated:(BOOL)animated completion:(VoidBlock)completion;

// Dismiss the presented view controller.
//
// animated   - use animation or not
// completion - the completion handler
- (void)dismissViewModelAnimated:(BOOL)animated completion:(VoidBlock)completion;

// Reset the corresponding view controller as the root view controller of the application's window.
//
// viewModel - the view model
- (void)resetRootViewModel:(id<PanViewModelProtocol>)viewModel;


@end
