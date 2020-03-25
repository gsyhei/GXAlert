//
//  UIView+GXAlertView.h
//  PTChatDemo
//
//  Created by GuoShengyong on 2017/12/26.
//  Copyright © 2017年 protruly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GXAlertManager.h"

@interface UIView (GXAlertView)

@property (nonatomic, weak) GXAlertManager *gx_manager;

- (void)showAlertStyle:(GXAlertStyle)alertStyle;

- (void)showAlertStyle:(GXAlertStyle)alertStyle backgoundTapDismissEnable:(BOOL)backgoundTapDismissEnable;

- (void)showAlertStyle:(GXAlertStyle)alertStyle backgoundTapDismissEnable:(BOOL)backgoundTapDismissEnable usingSpring:(BOOL)usingSpring;

- (void)showAlertStyle:(GXAlertStyle)alertStyle backgoundTapDismissEnable:(BOOL)backgoundTapDismissEnable usingSpring:(BOOL)usingSpring tapBlock:(GXAlertBlock)tapBlock;

- (void)showAlertStyle:(GXAlertStyle)alertStyle backgoundTapDismissEnable:(BOOL)backgoundTapDismissEnable usingSpring:(BOOL)usingSpring tapBlock:(GXAlertBlock)tapBlock dismissBlock:(GXAlertBlock)dismissBlock;


- (void)showToView:(UIView *)view alertStyle:(GXAlertStyle)alertStyle;

- (void)showToView:(UIView *)view alertStyle:(GXAlertStyle)alertStyle backgoundTapDismissEnable:(BOOL)backgoundTapDismissEnable;

- (void)showToView:(UIView *)view alertStyle:(GXAlertStyle)alertStyle backgoundTapDismissEnable:(BOOL)backgoundTapDismissEnable usingSpring:(BOOL)usingSpring;

- (void)showToView:(UIView *)view alertStyle:(GXAlertStyle)alertStyle backgoundTapDismissEnable:(BOOL)backgoundTapDismissEnable usingSpring:(BOOL)usingSpring tapBlock:(GXAlertBlock)tapBlock;

- (void)showToView:(UIView *)view alertStyle:(GXAlertStyle)alertStyle backgoundTapDismissEnable:(BOOL)backgoundTapDismissEnable usingSpring:(BOOL)usingSpring tapBlock:(GXAlertBlock)tapBlock dismissBlock:(GXAlertBlock)dismissBlock;


- (void)hideToView;

- (void)hideToView:(BOOL)animated;

+ (BOOL)hideAlertForView:(UIView *)view;

+ (BOOL)hideAlertForView:(UIView *)view animated:(BOOL)animated;

@end
