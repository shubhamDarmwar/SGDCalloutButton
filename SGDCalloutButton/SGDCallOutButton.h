//
//  CallOutButton.h
//  SGDCalloutButton
//
//  Created by Shubham Daramwar on 6/13/16.
//  Copyright © 2016 Shubham Daramwar. All rights reserved.
//


#import <UIKit/UIKit.h>

typedef  NS_ENUM(int, CallOutButtonStyle) {
    CallOutButtonStyleNone,CallOutButtonStyleInfo,CallOutButtonStyleList
};


@interface SGDCallOutButton : UIButton



@property (nonatomic,retain)  IBInspectable  NSString * callOutTitle;
@property(nonatomic,retain)  IBInspectable NSString * callOutText;
@property IBInspectable CallOutButtonStyle  callOutButtonStyle;
@property (nonatomic,retain) NSArray * list;
@end
