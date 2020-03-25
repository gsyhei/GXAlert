//
//  ViewController.m
//  GXAlertSample
//
//  Created by Gin on 2020/3/24.
//  Copyright © 2020 gin. All rights reserved.
//

#import "ViewController.h"
#import "MenuView.h"
#import "UIView+GXAlertView.h"

#define SCREEN_HEIGHT   [[UIScreen mainScreen] bounds].size.height
#define SCREEN_WIDTH    [[UIScreen mainScreen] bounds].size.width

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"GXAlert";
}

- (IBAction)button1Click:(id)sender {
    MenuView *menu = [[MenuView alloc] initWithFrame:CGRectMake(0, 0, 300, 150)];    
    [menu showAlertStyle:GXAlertStyleAlert backgoundTapDismissEnable:YES usingSpring:YES];
}

- (IBAction)button2Click:(id)sender {
    MenuView *menu = [[MenuView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
    [menu showAlertStyle:GXAlertStyleSheet backgoundTapDismissEnable:YES usingSpring:YES];
}

- (IBAction)button3Click:(id)sender {
    MenuView *menu = [[MenuView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
    [menu showAlertStyle:GXAlertStyleSheetTop backgoundTapDismissEnable:YES usingSpring:YES];
}

- (IBAction)button4Click:(id)sender {
    MenuView *menu = [[MenuView alloc] initWithFrame:CGRectMake(0, 0, 200, SCREEN_WIDTH)];
    [menu showAlertStyle:GXAlertStyleSheetLeft backgoundTapDismissEnable:YES usingSpring:YES];
}

- (IBAction)button5Click:(id)sender {
    MenuView *menu = [[MenuView alloc] initWithFrame:CGRectMake(0, 0, 200, SCREEN_WIDTH)];
    [menu showAlertStyle:GXAlertStyleSheetRight backgoundTapDismissEnable:YES usingSpring:YES];
}


@end
