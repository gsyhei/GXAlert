//
//  UIView+GXAlertView.m
//  PTChatDemo
//
//  Created by GuoShengyong on 2017/12/26.
//  Copyright © 2017年 protruly. All rights reserved.
//

#import "UIView+GXAlertView.h"
#import <objc/runtime.h>


@implementation UIView (GXAlertView)

static const char GX_MANAGER = '\0';
- (void)setGx_manager:(GXAlertManager *)gx_manager {
    objc_setAssociatedObject(self, &GX_MANAGER, gx_manager, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (GXAlertManager *)gx_manager {
    return objc_getAssociatedObject(self, &GX_MANAGER);
}

#pragma mark - Class

+ (BOOL)hideAlertForView:(UIView *)view {
    return [self hideAlertForView:view animated:YES];
}

+ (BOOL)hideAlertForView:(UIView *)view animated:(BOOL)animated {
    UIView *hud = [self alertForView:view];
    if (hud != nil) {
        [hud hideToView:animated];
        return YES;
    }
    return NO;
}

+ (UIView *)alertForView:(UIView *)view {
    NSEnumerator *subviewsEnum = [view.subviews reverseObjectEnumerator];
    for (UIView *subview in subviewsEnum) {
        if ([subview isKindOfClass:self]) {
            return subview;
        }
    }
    return nil;
}

#pragma mark - Utility

- (void)showAlertStyle:(GXAlertStyle)alertStyle {
    [self showToView:nil alertStyle:alertStyle backgoundTapDismissEnable:NO usingSpring:NO tapBlock:nil dismissBlock:nil];
}

- (void)showAlertStyle:(GXAlertStyle)alertStyle backgoundTapDismissEnable:(BOOL)backgoundTapDismissEnable {
    [self showToView:nil alertStyle:alertStyle backgoundTapDismissEnable:backgoundTapDismissEnable usingSpring:NO tapBlock:nil dismissBlock:nil];
}

- (void)showAlertStyle:(GXAlertStyle)alertStyle backgoundTapDismissEnable:(BOOL)backgoundTapDismissEnable usingSpring:(BOOL)usingSpring {
    [self showToView:nil alertStyle:alertStyle backgoundTapDismissEnable:backgoundTapDismissEnable usingSpring:usingSpring tapBlock:nil dismissBlock:nil];
}

- (void)showAlertStyle:(GXAlertStyle)alertStyle backgoundTapDismissEnable:(BOOL)backgoundTapDismissEnable usingSpring:(BOOL)usingSpring tapBlock:(GXAlertBlock)tapBlock {
    [self showToView:nil alertStyle:alertStyle backgoundTapDismissEnable:backgoundTapDismissEnable usingSpring:usingSpring tapBlock:tapBlock dismissBlock:nil];
}

- (void)showAlertStyle:(GXAlertStyle)alertStyle backgoundTapDismissEnable:(BOOL)backgoundTapDismissEnable usingSpring:(BOOL)usingSpring tapBlock:(GXAlertBlock)tapBlock dismissBlock:(GXAlertBlock)dismissBlock {
    [self showToView:nil alertStyle:alertStyle backgoundTapDismissEnable:backgoundTapDismissEnable usingSpring:usingSpring tapBlock:tapBlock dismissBlock:dismissBlock];
}

- (void)showToView:(UIView *)view alertStyle:(GXAlertStyle)alertStyle {
    [self showToView:view alertStyle:alertStyle backgoundTapDismissEnable:NO usingSpring:NO tapBlock:nil dismissBlock:nil];
}

- (void)showToView:(UIView *)view alertStyle:(GXAlertStyle)alertStyle backgoundTapDismissEnable:(BOOL)backgoundTapDismissEnable {
    [self showToView:view alertStyle:alertStyle backgoundTapDismissEnable:backgoundTapDismissEnable usingSpring:NO tapBlock:nil dismissBlock:nil];
}

- (void)showToView:(UIView *)view alertStyle:(GXAlertStyle)alertStyle backgoundTapDismissEnable:(BOOL)backgoundTapDismissEnable usingSpring:(BOOL)usingSpring {
    [self showToView:view alertStyle:alertStyle backgoundTapDismissEnable:backgoundTapDismissEnable usingSpring:usingSpring tapBlock:nil dismissBlock:nil];
}

- (void)showToView:(UIView *)view alertStyle:(GXAlertStyle)alertStyle backgoundTapDismissEnable:(BOOL)backgoundTapDismissEnable usingSpring:(BOOL)usingSpring tapBlock:(GXAlertBlock)tapBlock {
    [self showToView:view alertStyle:alertStyle backgoundTapDismissEnable:backgoundTapDismissEnable usingSpring:usingSpring tapBlock:tapBlock dismissBlock:nil];
}

- (void)showToView:(UIView *)view alertStyle:(GXAlertStyle)alertStyle backgoundTapDismissEnable:(BOOL)backgoundTapDismissEnable usingSpring:(BOOL)usingSpring tapBlock:(GXAlertBlock)tapBlock dismissBlock:(GXAlertBlock)dismissBlock {
    GXAlertManager *manager = [[GXAlertManager alloc] initWithSuperview:view alertView:self];
    manager.alertStyle = alertStyle;
    manager.backgoundTapDismissEnable = backgoundTapDismissEnable;
    manager.usingSpring = usingSpring;
    manager.tapBlock = tapBlock;
    manager.dismissBlock = dismissBlock;
    [manager show];
    self.gx_manager = manager;
}

- (void)hideToView {
    [self hideToView:YES];
}

- (void)hideToView:(BOOL)animated {
    if (self.gx_manager) {
        [self.gx_manager hide:animated];
    }
}

@end
