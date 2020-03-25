//
//  GXAlertManager.m
//  PTChatDemo
//
//  Created by GuoShengyong on 2017/12/26.
//  Copyright © 2017年 protruly. All rights reserved.
//

#import "GXAlertManager.h"

#define IOS_OR_LATER(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SCREEN_HEIGHT   [[UIScreen mainScreen] bounds].size.height
#define SCREEN_WIDTH    [[UIScreen mainScreen] bounds].size.width

#define GX_ALERT_ANIMATION_DURATION   0.5
#define GX_ALERT_USINGSPRING_DAMPING  0.7
#define GX_ALERT_USINGSPRING_VELOCITY 1.0

@interface GXAlertManager ()
@property (nonatomic,   weak) UIView *superview;
@property (nonatomic, strong) UIView *backgoundView;
@property (nonatomic,   weak) UIView *alertView;
@end

@implementation GXAlertManager

- (void)dealloc {
    _backgoundView = nil;
    _alertView = nil;
}

- (instancetype)initWithSuperview:(UIView*)superview alertView:(UIView*)alertView {
    self = [super init];
    if (self) {
        _superview = superview;
        _alertView = alertView;
        [self createSubviews];
    }
    return self;
}

- (void)createSubviews {
    _backgoundView = [[UIControl alloc] init];
    _backgoundView.alpha = 0.0;
    _backgoundView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    _backgoundView.backgroundColor = [UIColor blackColor];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureRecognizer:)];
    [self.backgoundView addGestureRecognizer:tap];
}

- (void)show {
    if (!self.alertView.superview) {
        if (!self.superview) {
            self.superview = [[UIApplication sharedApplication].windows firstObject];
        }
        self.backgoundView.frame = self.superview.bounds;
        [self.superview addSubview:self.backgoundView];
        [self.superview addSubview:self.alertView];
    }
    switch (self.alertStyle) {
        case GXAlertStyleSheet: {
            CGRect frame = self.alertView.frame;
            frame.origin.y = self.backgoundView.frame.size.height;
            frame.size.width = self.backgoundView.frame.size.width;
            self.alertView.frame = frame;
            frame.origin.y = self.backgoundView.frame.size.height - self.alertView.frame.size.height;
            [GXAlertManager gx_animateWithUsingSpring:self.usingSpring animations:^{
                 self.backgoundView.alpha = 0.4;
                 self.alertView.frame = frame;
            } completion:NULL];
        }
            break;
        case GXAlertStyleAlert: {
            self.alertView.alpha = 0;
            self.alertView.center = self.superview.center;
            self.alertView.transform = CGAffineTransformScale(self.alertView.transform,0.1,0.1);
            [GXAlertManager gx_animateWithUsingSpring:self.usingSpring animations:^{
                 self.backgoundView.alpha = 0.4;
                 self.alertView.transform = CGAffineTransformIdentity;
                 self.alertView.alpha = 1.0;
            } completion:NULL];
        }
            break;
        case GXAlertStyleSheetTop: {
            CGRect frame = self.alertView.frame;
            frame.origin.y = -self.alertView.frame.size.height;
            frame.size.width = self.backgoundView.frame.size.width;
            self.alertView.frame = frame;
            frame.origin.y = 0;
            [GXAlertManager gx_animateWithUsingSpring:self.usingSpring animations:^{
                 self.backgoundView.alpha = 0.4;
                 self.alertView.frame = frame;
            } completion:NULL];
        }
            break;
        case GXAlertStyleSheetLeft: {
            CGRect frame = self.alertView.frame;
            frame.origin.x = -self.alertView.frame.size.width;
            frame.size.height = self.superview.frame.size.height;
            self.alertView.frame = frame;
            frame.origin.x = 0;
            [GXAlertManager gx_animateWithUsingSpring:self.usingSpring animations:^{
                 self.backgoundView.alpha = 0.4;
                 self.alertView.frame = frame;
            } completion:NULL];
        }
            break;
        case GXAlertStyleSheetRight: {
            CGRect frame = self.alertView.frame;
            frame.origin.x = self.superview.frame.size.width;
            frame.size.height = self.superview.frame.size.height;
            self.alertView.frame = frame;
            frame.origin.x = self.superview.frame.size.width - self.alertView.frame.size.width;
            [GXAlertManager gx_animateWithUsingSpring:self.usingSpring animations:^{
                 self.backgoundView.alpha = 0.4;
                 self.alertView.frame = frame;
            } completion:NULL];
        }
            break;
    }
}

- (void)hide:(BOOL)animated {
    if (!self.superview)
        return;
    if (!animated) {
        [self.backgoundView removeFromSuperview];
        [self.alertView removeFromSuperview];
        if (self.dismissBlock) {
            self.dismissBlock(self);
        }
        return;
    }
    switch (self.alertStyle) {
        case GXAlertStyleSheet: {
            CGRect frame = self.alertView.frame;
            frame.origin.y = self.backgoundView.frame.size.height;
            [UIView animateWithDuration:GX_ALERT_ANIMATION_DURATION/2.0 animations:^{
                 self.backgoundView.alpha = 0.0;
                 self.alertView.frame = frame;
             } completion:^(BOOL finished) {
                 if (finished) {
                     [self.backgoundView removeFromSuperview];
                     [self.alertView removeFromSuperview];
                 }
             }];
        }
            break;
        case GXAlertStyleAlert: {
            [UIView animateWithDuration:GX_ALERT_ANIMATION_DURATION/2.0 animations:^{
                self.backgoundView.alpha = 0.0;
                self.alertView.transform = CGAffineTransformScale(self.alertView.transform,0.1,0.1);
                self.alertView.alpha = 0.0;
            } completion:^(BOOL finished) {
                if (finished) {
                    [self.backgoundView removeFromSuperview];
                    [self.alertView removeFromSuperview];
                }
            }];
        }
            break;
        case GXAlertStyleSheetTop: {
            CGRect frame = self.alertView.frame;
            frame.origin.y = -self.alertView.frame.size.height;
            [UIView animateWithDuration:GX_ALERT_ANIMATION_DURATION/2.0 animations:^{
                self.backgoundView.alpha = 0.0;
                self.alertView.frame = frame;
            } completion:^(BOOL finished) {
                if (finished) {
                    [self.backgoundView removeFromSuperview];
                    [self.alertView removeFromSuperview];
                }
            }];
        }
            break;
        case GXAlertStyleSheetLeft: {
            CGRect frame = self.alertView.frame;
            frame.origin.x = -self.superview.frame.size.width;
            [UIView animateWithDuration:GX_ALERT_ANIMATION_DURATION/2.0 animations:^{
                self.backgoundView.alpha = 0.0;
                self.alertView.frame = frame;
            } completion:^(BOOL finished) {
                if (finished) {
                    [self.backgoundView removeFromSuperview];
                    [self.alertView removeFromSuperview];
                }
            }];
        }
                break;
        case GXAlertStyleSheetRight: {
            CGRect frame = self.alertView.frame;
            frame.origin.x = self.superview.frame.size.width;
            [UIView animateWithDuration:GX_ALERT_ANIMATION_DURATION/2.0 animations:^{
                self.backgoundView.alpha = 0.0;
                self.alertView.frame = frame;
            } completion:^(BOOL finished) {
                if (finished) {
                    [self.backgoundView removeFromSuperview];
                    [self.alertView removeFromSuperview];
                }
            }];
        }
            break;
    }
    if (self.dismissBlock) {
        self.dismissBlock(self);
    }
}

+ (void)gx_animateWithUsingSpring:(BOOL)usingSpring animations:(void (^)(void))animations completion:(void (^ __nullable)(BOOL finished))completion {
    
    if (IOS_OR_LATER(@"7.0") && usingSpring) {
        [UIView animateWithDuration:GX_ALERT_ANIMATION_DURATION
                              delay:0
             usingSpringWithDamping:GX_ALERT_USINGSPRING_DAMPING
              initialSpringVelocity:GX_ALERT_USINGSPRING_VELOCITY
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:animations
                         completion:completion];
    } else {
        [UIView animateWithDuration:GX_ALERT_ANIMATION_DURATION/2 animations:animations completion:completion];
    }
}

#pragma mark - UITapGestureRecognizer

- (void)tapGestureRecognizer:(UITapGestureRecognizer*)tap {
    if (self.backgoundTapDismissEnable) {
        [self hide:YES];
        if (self.tapBlock) {
            self.tapBlock(self);
        }
    }
}

@end

