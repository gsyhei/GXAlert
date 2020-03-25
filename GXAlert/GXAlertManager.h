//
//  GXAlertManager.h
//  PTChatDemo
//
//  Created by GuoShengyong on 2017/12/26.
//  Copyright © 2017年 protruly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, GXAlertStyle) {
    GXAlertStyleSheet      = 0,  ///< sheet风格
    GXAlertStyleAlert      = 1,  ///< alert风格
    GXAlertStyleSheetTop   = 2,  ///< sheet风格从上至下
    GXAlertStyleSheetLeft  = 3,  ///< sheet风格从左至右
    GXAlertStyleSheetRight = 4,  ///< sheet风格从右至左
};
typedef void(^GXAlertBlock)(id obj);

@interface GXAlertManager : NSObject
/**
 背景
 */
@property (nonatomic, readonly) UIView *backgoundView;
/**
 提醒视图
 */
@property (nonatomic, weak, readonly) UIView *alertView;
/**
 弹出风格
 */
@property (nonatomic, assign) GXAlertStyle alertStyle;
/**
 背景点击dismiss是否有效，default NO
 */
@property (nonatomic, assign) BOOL backgoundTapDismissEnable;
/**
 是否使用弹簧动画效果，default NO
*/
@property (nonatomic, assign) BOOL usingSpring;
/**
 点击背景的回调
 */
@property (nonatomic,   copy) GXAlertBlock tapBlock;
/**
 dismiss的回调
 */
@property (nonatomic,   copy) GXAlertBlock dismissBlock;

- (instancetype)initWithSuperview:(UIView*)superview alertView:(UIView*)alertView;

- (void)show;

- (void)hide:(BOOL)animated;

@end
