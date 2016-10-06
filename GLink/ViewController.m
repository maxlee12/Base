//
//  ViewController.m
//  GLink
//
//  Created by lawrence on 16/9/23.
//  Copyright © 2016年 lawrence. All rights reserved.
//

#import "ViewController.h"
#import "BaseNavtionController.h"
#import "BaseTabBarController.h"
#import "MainViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)loginClick:(id)sender
{
    [MBProgressHUD showMessage:@"登录中..."];
    
    
    [self jump];
    
}
/** 登陆成功之后跳转 */
- (void)jump
{
    
#warning mark -law-shouldLookLook
    
    MainViewController *mainVC = [[MainViewController alloc] init];
    BaseNavtionController *Navi = [[BaseNavtionController alloc] initWithRootViewController:mainVC];
    __weak typeof(self) weakSelf = self;
    //一秒之后跳转
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [MBProgressHUD hideHUD];
        [MBProgressHUD showSuccess:@"登陆成功"];
        
        [self presentViewController:Navi animated:YES completion:^{
            
            [[NSNotificationCenter defaultCenter] removeObserver:self];
            
        }];
    });
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
