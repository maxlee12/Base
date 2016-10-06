//
//  BaseTabBarController.m
//  GLink
//
//  Created by lawrence on 16/9/23.
//  Copyright © 2016年 lawrence. All rights reserved.
//

#import "BaseTabBarController.h"
#import "BaseNavtionController.h"
@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupBasic];
}

- (void)setupBasic
{

}

- (void)addChildViewController:(UIViewController *)childController notmalimageNamed:(NSString *)imageName selectedImage:(NSString *)selectedImageName title:(NSString *)title
{
    BaseNavtionController *nav = [[BaseNavtionController alloc] initWithRootViewController:childController];
    childController.tabBarItem.image = [UIImage imageNamed:imageName];
    childController.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
    childController.title = title;
    [childController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName :BasicColor} forState:UIControlStateNormal];
    
    [self addChildViewController:nav];
}

#warning mark -law-shouldLookLook
#pragma mark 代理方法
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    if ([viewController.tabBarItem.image isEqual:[UIImage imageNamed:@"toolbar_live"]]){
        
        //特殊处理不显示Bar的cintroller
        return NO;
    }
    
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
