//
//  CallOut.m
//  SGDCalloutButton
//
//  Created by Shubham Daramwar on 6/13/16.
//  Copyright © 2016 Shubham Daramwar. All rights reserved.
//

#import "CallOut.h"
const int Call_CORNER_RADIUS = 3;

@interface CallOut ()

@end

@implementation CallOut


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    self.box.layer.cornerRadius = Call_CORNER_RADIUS;
    self.box.layer.borderWidth = 1;
    self.box.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.box.layer.masksToBounds = YES;
    self.box.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    self.box.layer.shadowOffset = CGSizeMake(0,0);
    self.box.layer.shadowRadius = 2;
    self.box.layer.shadowOpacity = 1.0;
    self.box.clipsToBounds = NO;
    
}
- (IBAction)close:(UIButton *)sender {
    
    [UIView animateWithDuration:0.2 animations:^{
        self.alpha = 0;
    }completion:^(BOOL finished){
        [self removeFromSuperview];
    }];
    
    
}
- (IBAction)removeClick:(UIButton *)sender {
    [UIView animateWithDuration:0.2 animations:^{
        self.alpha = 0;
    }completion:^(BOOL finished){
        [self removeFromSuperview];
    }];
}


@end
