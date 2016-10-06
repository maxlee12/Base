//
//  ToastView.m
//  Pear
//
//  Created by Lawrence on 16/4/11.
//  Copyright © 2016年 Henry. All rights reserved.
//

#import "ToastView.h"

@implementation ToastView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)awakeFromNib{
    self.image.clipsToBounds = YES;
    self.image.layer.cornerRadius = self.image.frame.size.width/2;
}

@end
