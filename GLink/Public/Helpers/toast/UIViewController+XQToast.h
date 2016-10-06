//
//  UIViewController+XQToast.h
//  Pear
//
//  Created by Lawrence on 16/4/11.
//  Copyright © 2016年 Henry. All rights reserved.
//

#import <UIKit/UIKit.h>
//toast样式表
typedef NS_ENUM(NSInteger,XQToast) {
    XQToast_error,
    XQToast_success,
    XQToast_fade,
    XQToast_deafult,
    
};

//hud样式表
typedef NS_ENUM(NSInteger,XQHUD) {
    
    XQHUD_deafult,  //MBHUD
    XQHUD_XQ,       //XQHUD
    XQHUD_EXNAVI,       //XQHUD
};

@interface UIViewController (XQToast)

//普通toast
-(void)showToast:(NSString*)text inView:(UIView*)view type:(XQToast)XQ_Toast;
//网络特殊toast
-(UIView *)ShowNoNetworkViewOnView:(CGRect)frame;
//显示HUD 自己的和MBHUD
-(void)showHUDOnView:(UIView*)view type:(XQHUD)XQ_HUD animated:(BOOL)animated;
-(void)hideHudOnView:(UIView*)view animated:(BOOL)animated;

@end
