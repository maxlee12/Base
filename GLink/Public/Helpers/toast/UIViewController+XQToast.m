//
//  UIViewController+XQToast.m
//  Pear
//
//  Created by Lawrence on 16/4/11.
//  Copyright © 2016年 Henry. All rights reserved.
//

#import "UIViewController+XQToast.h"
#import "ToastView.h"
#import "MBProgressHUD.h"
@implementation UIViewController (XQToast)
-(void)showToast:(NSString*)text inView:(UIView*)view type:(XQToast)XQ_Toast{
    
    switch (XQ_Toast) {
            
        case XQToast_success:
            [self showSuccessToast:text inView:view];
            break;
            
        case XQToast_error:
            [self showErrorToast:text inView:view];
            break;
            
        case XQToast_fade:
            [self showFadeToast:text inView:view];
            break;
            
        case XQToast_deafult:
            [self showDeafultToast:text inView:view];
            break;
            
        default:
            [self showDeafultToast:text inView:view];
            break;
    }
}
#pragma mark--toast
//error
-(void)showErrorToast:(NSString*)text inView:(UIView*)view{
    
    ToastView *toast= [[[NSBundle mainBundle] loadNibNamed:@"ToastView" owner:nil options:nil] firstObject];
    toast.titleLab.text = text;
    toast.image.image = [UIImage imageNamed:@"ico_notify_warning"];
    toast.center = CGPointMake(view.frame.size.width/2, 120);
    [view addSubview:toast];
    
    [UIView animateWithDuration:1 delay:0.5 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        toast.alpha = 0;
    } completion:^(BOOL finished) {
        [toast removeFromSuperview];
        toast.alpha = 1;
    }];
    
}

//success
-(void)showSuccessToast:(NSString*)text inView:(UIView*)view{
    
   UILabel* doneNoticeLab = [[UILabel alloc] initWithFrame:CGRectMake(40, SCREEN_H/2.0+50, SCREEN_W-80, 80)];
    doneNoticeLab.backgroundColor = [UIColor blackColor];
    doneNoticeLab.textColor = [UIColor whiteColor];
    doneNoticeLab.text = text;
    doneNoticeLab.numberOfLines = 0;
    doneNoticeLab.adjustsFontSizeToFitWidth = YES;
    doneNoticeLab.font = [UIFont systemFontOfSize:20.0];
    doneNoticeLab.textAlignment = NSTextAlignmentCenter;
    doneNoticeLab.alpha = 0.0;
    doneNoticeLab.layer.cornerRadius = 5.0;
    doneNoticeLab.clipsToBounds = YES;
    if(text.length != 0)
    {
        [view addSubview:doneNoticeLab];
        [UIView animateWithDuration:2 animations:^{
            doneNoticeLab.alpha = 0.8;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:2 animations:^{
                doneNoticeLab.alpha = 0.0;
            } completion:^(BOOL finished) {
                [doneNoticeLab removeFromSuperview];
            }];
        }];
    }
  
}

//fade
-(void)showFadeToast:(NSString*)text inView:(UIView*)view{
    
    ToastView *toast= [[[NSBundle mainBundle] loadNibNamed:@"ToastView" owner:nil options:nil] firstObject];
    toast.titleLab.text = text;
    toast.center = CGPointMake(view.frame.size.width/2, 120);
    [view addSubview:toast];
    
    [UIView animateWithDuration:1 delay:0.5 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        toast.alpha = 0;
    } completion:^(BOOL finished) {
        [toast removeFromSuperview];
        toast.alpha = 1;
    }];
}

//scale
-(void)showScaleToast:(NSString*)text inView:(UIView*)view {
    
    ToastView *toast= [[[NSBundle mainBundle] loadNibNamed:@"ToastView" owner:nil options:nil] firstObject];
    toast.titleLab.text = text;
    toast.center = CGPointMake(view.frame.size.width/2, 120);
    [view addSubview:toast];
    
    toast.transform = CGAffineTransformMakeScale(0, 0);
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        
        toast.transform = CGAffineTransformMakeScale(1, 1);
        
    } completion:^(BOOL finished) {
        
        toast.transform = CGAffineTransformMakeScale(1, 1);
        if (finished) {
            [UIView animateWithDuration:1 delay:1.5 options:UIViewAnimationOptionAllowUserInteraction animations:^{
                toast.transform = CGAffineTransformMakeScale(0.1, 0.1);
            }completion:^(BOOL finished) {
                toast.transform = CGAffineTransformMakeScale(1, 1);
                [toast removeFromSuperview];
            }];
        }
        
    }];
}

//deafult
-(void)showDeafultToast:(NSString*)text inView:(UIView*)view{
    
    //label设置
    UILabel *textLabel = [[UILabel alloc] init];
    textLabel.font = [UIFont systemFontOfSize:16];
    textLabel.text = text;
    textLabel.textAlignment = NSTextAlignmentCenter;
    textLabel.textColor = [UIColor whiteColor];
    textLabel.backgroundColor = [UIColor clearColor];
    textLabel.numberOfLines = 0;//根据最大行数需求来设置
    textLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    CGSize maximumLabelSize = CGSizeMake(SCREEN_W*0.7,480);//labelsize的最大值
    //关键语句
    CGSize expectSize = [textLabel sizeThatFits:maximumLabelSize];
    //别忘了把frame给回label,如果用xib加了约束的话可以只改一个约束的值
    textLabel.frame = CGRectMake(0, 0, expectSize.width, expectSize.height);

    //label背景view设置
    
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, expectSize.width+8*2, expectSize.height+4*2)];
    backView.layer.cornerRadius = backView.frame.size.height/2;
    backView.clipsToBounds = YES;
    backView.backgroundColor = [UIColor lightGrayColor];
    textLabel.center = backView.center;
    [backView addSubview:textLabel];
    
    backView.center = view.center;
    
    [UIView animateWithDuration:2.5 delay:0.5 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        [view addSubview:backView];
        backView.alpha = 0;
    } completion:^(BOOL finished) {
        [backView removeFromSuperview];
        backView.alpha = 1;
    }];
}


#pragma mark---XQ_HUD

-(void)showHUDOnView:(UIView*)view type:(XQHUD)XQ_HUD animated:(BOOL)animated{
    
    //除开navi的view
    UIView *exceptNaviView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_W, SCREEN_H)];
    exceptNaviView.tag = 1211121212;
    exceptNaviView.backgroundColor = [UIColor clearColor];
    
    switch (XQ_HUD) {
        case XQHUD_deafult:
            //用第三方
            [MBProgressHUD showHUDAddedTo:view animated:animated];
            break;
            
        case XQHUD_XQ:
            [self showXQHud];
            break;
            
        case XQHUD_EXNAVI:
            
            [self.view addSubview:exceptNaviView];
            [MBProgressHUD showHUDAddedTo:exceptNaviView animated:animated];
            break;
            
        default:

            [MBProgressHUD showHUDAddedTo:view animated:animated];
            break;
    }
    
}


//自己的hud
-(void)showXQHud{

    UIControl* control = [[UIControl alloc] initWithFrame:self.view.frame];
    control.tag = 10086111;
    control.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
    //
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    imageView.center = self.view.center;
    imageView.image = [UIImage imageNamed:@"tempHeader"];
    [control addSubview:imageView];
    [self.view addSubview:control];
    [self.view bringSubviewToFront:control];
    
    [self animationX:imageView];
}

//隐藏hud
-(void)hideHudOnView:(UIView*)view animated:(BOOL)animated{
    UIControl *control = (UIControl*)[self.view viewWithTag:10086111];
    [control removeFromSuperview];
    
    UIView *exceptNaviView = [self.view viewWithTag:1211121212];
    [exceptNaviView removeFromSuperview];
    
    [MBProgressHUD hideAllHUDsForView:view animated:animated];
}


-(void)animationY:(UIView*)imageView{
    
    [UIView animateWithDuration:0.3 animations:^{
        imageView.transform = CGAffineTransformMakeScale(-1.0, 1.0);
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.3 animations:^{
            imageView.transform = CGAffineTransformMakeScale(1.0, 1.0);
        }completion:^(BOOL finished) {
            [self animationX:imageView];
        }];
        
    }];
    
}

-(void)animationX:(UIView*)imageView{
    [UIView animateWithDuration:0.3 animations:^{
        imageView.transform = CGAffineTransformMakeScale(1.0,-1.0);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 animations:^{
            imageView.transform = CGAffineTransformMakeScale(1.0,1.0);
        }completion:^(BOOL finished) {
            [self animationY:imageView];
        }];
    }];
}



@end
