# GXAlert
基于UIView的menu分类，领导再也不会说我写个菜单效果慢了！菜单太多也不用再打项目经理了！
首先恭喜您发现了宝藏！其实这个分类的作用在于帮助开发者开发常见的菜单弹出效果而非菜单效果，开发者只需要专注于菜单本身的UIView开发便可。

# 喜欢就给个star哦，QQ：279694479


先上demo菜单效果（比较朴素，请别在意）
--

![](/GXAlert.gif '描述')


Requirements
--
- iOS 7.0 or later
- Xcode 9.0 or later

Usage in you Podfile:
--

```
pod 'GXAlert'
```

使用方法
--
首先#import "UIView+GXAlertView.h"，然后专注于创建你的菜单的view就行，接下来菜单效果就交给GXAlert的扩展方法吧。

```objc

/**
 * 基于window的alert 
 */
 
- (void)showAlertStyle:(GXAlertStyle)alertStyle;

- (void)showAlertStyle:(GXAlertStyle)alertStyle backgoundTapDismissEnable:(BOOL)backgoundTapDismissEnable;

- (void)showAlertStyle:(GXAlertStyle)alertStyle backgoundTapDismissEnable:(BOOL)backgoundTapDismissEnable usingSpring:(BOOL)usingSpring;

- (void)showAlertStyle:(GXAlertStyle)alertStyle backgoundTapDismissEnable:(BOOL)backgoundTapDismissEnable usingSpring:(BOOL)usingSpring tapBlock:(GXAlertBlock)tapBlock;

- (void)showAlertStyle:(GXAlertStyle)alertStyle backgoundTapDismissEnable:(BOOL)backgoundTapDismissEnable usingSpring:(BOOL)usingSpring tapBlock:(GXAlertBlock)tapBlock dismissBlock:(GXAlertBlock)dismissBlock;

/**
* 基于view的alert 
*/

- (void)showToView:(UIView *)view alertStyle:(GXAlertStyle)alertStyle;

- (void)showToView:(UIView *)view alertStyle:(GXAlertStyle)alertStyle backgoundTapDismissEnable:(BOOL)backgoundTapDismissEnable;

- (void)showToView:(UIView *)view alertStyle:(GXAlertStyle)alertStyle backgoundTapDismissEnable:(BOOL)backgoundTapDismissEnable usingSpring:(BOOL)usingSpring;

- (void)showToView:(UIView *)view alertStyle:(GXAlertStyle)alertStyle backgoundTapDismissEnable:(BOOL)backgoundTapDismissEnable usingSpring:(BOOL)usingSpring tapBlock:(GXAlertBlock)tapBlock;

- (void)showToView:(UIView *)view alertStyle:(GXAlertStyle)alertStyle backgoundTapDismissEnable:(BOOL)backgoundTapDismissEnable usingSpring:(BOOL)usingSpring tapBlock:(GXAlertBlock)tapBlock dismissBlock:(GXAlertBlock)dismissBlock;

/**
* 手动hide
*/

- (void)hideToView;

- (void)hideToView:(BOOL)animated;

+ (BOOL)hideAlertForView:(UIView *)view;

+ (BOOL)hideAlertForView:(UIView *)view animated:(BOOL)animated;

```

License
--
MIT
