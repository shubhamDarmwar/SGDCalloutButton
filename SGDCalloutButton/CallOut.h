//
//  CallOut.h
//  SGDCalloutButton
//
//  Created by Shubham Daramwar on 6/13/16.
//  Copyright © 2016 Shubham Daramwar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CallOut : UIView

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topSpacing;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftSpacing;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *boxHeight;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *text;
@property (weak, nonatomic) IBOutlet UIView *box;
@property (weak, nonatomic) IBOutlet UIImageView *triangle;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *downArrowLeftSpacing;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *downArrowBottomSpacing;
@property (weak, nonatomic) IBOutlet UIImageView *downArrow;

@end
