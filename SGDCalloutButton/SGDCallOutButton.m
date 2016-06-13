//
//  CallOutButton.m
//  SGDCalloutButton
//
//  Created by Shubham Daramwar on 6/13/16.
//  Copyright © 2016 Shubham Daramwar. All rights reserved.
//


#import "SGDCallOutButton.h"
#import "CallOut.h"
//#import "UIFont+EVScaledFont.h"
#import "DropDownTable.h"
#import "DropdownTableViewCell.h"

@interface SGDCallOutButton()<UITableViewDelegate,UITableViewDataSource>
{
    CallOut * callOutView ;
    DropdownTableViewCell * cell ;
    float expectedTableWidth ;
    UIButton * removeButton;
    
}
@property(nonatomic,retain)  DropDownTable * dropdownTable;
@end

@implementation SGDCallOutButton
@synthesize dropdownTable = dropdownTable;

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
//    self.callOutButtonStyle = CallOutButtonStyleList;
    
    expectedTableWidth = 0;
    for (NSString * temp in self.list) {
        
        CGSize expectedLabelSize = [temp sizeWithFont:self.titleLabel.font
                                    constrainedToSize:CGSizeMake(self.superview.bounds.size.width, 25)
                                        lineBreakMode:cell.textLabel.lineBreakMode];
    
        if (expectedLabelSize.width > expectedTableWidth ) {
            expectedTableWidth = expectedLabelSize.width;
            NSLog(@" expectedTableWidth %f",expectedTableWidth);
        }
        
    }
    expectedTableWidth +=7;
    
    callOutView = [[NSBundle mainBundle] loadNibNamed:@"CallOut" owner:self options:nil].lastObject;

//    callOutView.title.font = callOutView.text.font = [UIFont scaledSystemFontWithStyle:Thin withSize:Footnote];
    callOutView.frame = self.superview.window.bounds;
//    CGRect newFrame = [self convertRect:self.bounds toView:nil];
//    float topSpacing = newFrame.origin.y + newFrame.size.height;
//    CGPoint center = CGPointMake(newFrame.origin.x + newFrame.size.width/2,newFrame.origin.y + newFrame.size.height/2);
//    
//    (callOutView.topSpacing).constant = topSpacing;
//    
//    (callOutView.leftSpacing).constant = center.x - 10;
//    (callOutView.downArrowLeftSpacing).constant = center.x - 10;
//    
//    
//    
//    [callOutView.downArrow setHidden:YES];
//    [callOutView.downArrowBottomSpacing setActive:NO];
//     NSLog(@"Box height %f ",callOutView.box.bounds.size.height);
//    
//    
//    
//    
//    if (callOutView.topSpacing.constant + callOutView.box.bounds.size.height + newFrame.size.height + 20 >= self.superview.window.frame.size.height)
//    {
//        
//        
//        callOutView.triangle.hidden = YES;
//        callOutView.downArrow.hidden = NO;
//      
//        callOutView.downArrow.transform = CGAffineTransformMakeRotation(M_PI);
//        float bottomSpacing = self.superview.window.bounds.size.height
//        - (newFrame.origin.y );
//
//        
//        callOutView.topSpacing.constant = callOutView.topSpacing.constant - bottomSpacing;
//        
//    }
    
   

    [self addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    dropdownTable  = [DropDownTable sharedInstance];
    
}


-(void)setFrames{
    CGRect newFrame = [self convertRect:self.bounds toView:nil];
    float topSpacing = newFrame.origin.y + newFrame.size.height;
    CGPoint center = CGPointMake(newFrame.origin.x + newFrame.size.width/2,newFrame.origin.y + newFrame.size.height/2);
    
    
    
    (callOutView.topSpacing).constant = topSpacing;
    
    (callOutView.leftSpacing).constant = center.x - 10;
    (callOutView.downArrowLeftSpacing).constant = center.x - 10;
    
    
    
    [callOutView.downArrow setHidden:YES];
    [callOutView.downArrowBottomSpacing setActive:NO];
    NSLog(@"Box height %f ",callOutView.box.bounds.size.height);
    
    
    
    
    if (callOutView.topSpacing.constant + callOutView.box.bounds.size.height + newFrame.size.height + 20 >= self.superview.window.frame.size.height)
    {
        
        
        callOutView.triangle.hidden = YES;
        callOutView.downArrow.hidden = NO;
        
        callOutView.downArrow.transform = CGAffineTransformMakeRotation(M_PI);
        float bottomSpacing = [UIScreen mainScreen].bounds.size.height
        - (newFrame.origin.y );
        
        float bts = callOutView.topSpacing.constant -bottomSpacing;
        callOutView.topSpacing.constant =  bts;
        
    }
}

-(void)click{
    [self setFrames];
//    if (self.callOutButtonStyle == CallOutButtonStyleInfo){
        callOutView.title.text = self.callOutTitle;
        callOutView.text.text  = self.callOutText;
        
        if (callOutView.title.text.length !=0 || callOutView.text.text.length !=0) {
            [self.superview.window addSubview:callOutView];
            callOutView.alpha = 0;
            [UIView animateWithDuration:0.2 animations:^{
                callOutView.alpha = 1;
                
            }];
            
        }
//    }else
        if (self.callOutButtonStyle == CallOutButtonStyleList){
        
        [self presentDropdown];
    }
    
}


-(void)presentDropdown{
    
    CGRect newFrame = [self convertRect:self.bounds toView:nil];
    
    
    [UIView animateWithDuration:0.2 animations:^{
        if (dropdownTable) {
            
            dropdownTable.frame = CGRectMake(newFrame.origin.x + newFrame.size.width,newFrame.origin.y + newFrame.size.height/2 + 1, 0, 0);
            dropdownTable.background.frame = CGRectMake(newFrame.origin.x +newFrame.size.width,newFrame.origin.y + newFrame.size.height/2 + 1, 0, 0);
        }
    }completion:^(BOOL finished){
        [dropdownTable removeFromSuperview];
        [dropdownTable.background removeFromSuperview];
        /////////////
        
        
        
        if (self.list.count != 0) {
            
            float screenHeight = [UIScreen mainScreen].bounds.size.height ;
            float maxHeight = screenHeight - newFrame.origin.y - newFrame.size.height -20;
            float minHeight = 25 * self.list.count;
            if (self.list.count == 0) {
                minHeight = 0;
            }
            float tableHeight = fminf(minHeight, maxHeight);
            
            dropdownTable = [DropDownTable sharedInstance];
            dropdownTable.backgroundColor = [UIColor orangeColor];
            dropdownTable.frame = CGRectMake(newFrame.origin.x + newFrame.size.width,
                                             newFrame.origin.y + newFrame.size.height/2 + 1,
                                             0, 0);
            dropdownTable.background.frame = CGRectMake(newFrame.origin.x + newFrame.size.width ,
                                                        newFrame.origin.y + newFrame.size.height/2 + 1,
                                                        0, 0);
            [UIView animateWithDuration:0.2 animations:^{
                dropdownTable.frame = CGRectMake(newFrame.origin.x,newFrame.origin.y + newFrame.size.height/2 +1, expectedTableWidth, tableHeight);
                dropdownTable.background.frame = CGRectMake(newFrame.origin.x,newFrame.origin.y + newFrame.size.height/2 +1, expectedTableWidth , tableHeight);
            }];
            NSLog(@" expectedTableWidth %f",expectedTableWidth);
            dropdownTable.delegate = self;
            dropdownTable.dataSource = self;
            [dropdownTable registerClass:[DropdownTableViewCell class] forCellReuseIdentifier:@"cell"];
            dropdownTable.backgroundColor = [UIColor whiteColor];
            dropdownTable.separatorStyle = UITableViewCellSeparatorStyleNone;
            
            //@@@@@@@@@@@@@ BACKGROUD BUTTON @@@@@@@@@@@@@@@
            removeButton = [[UIButton alloc]initWithFrame:[UIScreen mainScreen].bounds];
            [removeButton addTarget:self action:@selector(hideDropdown) forControlEvents:UIControlEventTouchUpInside];
            [self.superview.window addSubview:removeButton];
            
            [self.superview.window addSubview:dropdownTable.background];
            [self.superview.window addSubview:dropdownTable];
        }}];
}

-(void)hideDropdown{
    CGRect newFrame = [self convertRect:self.bounds toView:nil];

    if (dropdownTable) {
        
        [UIView animateWithDuration:0.2 animations:^{
            dropdownTable.frame = CGRectMake(newFrame.origin.x + newFrame.size.width,newFrame.origin.y + newFrame.size.height/2 + 1, 0, 0);
            dropdownTable.background.frame = CGRectMake(newFrame.origin.x + newFrame.size.width,newFrame.origin.y + newFrame.size.height/2 + 1, 0, 0);
        }completion:^(BOOL finished){
            [dropdownTable removeFromSuperview];
            [dropdownTable.background removeFromSuperview];
            [removeButton removeFromSuperview];
        }];
    }
}

#pragma mark
#pragma mark TABLEVIEW DELEGATE METHODES
#pragma mark


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.list.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = (self.list)[indexPath.row];
    cell.textLabel.font = self.titleLabel.font;
    cell.textLabel.adjustsFontSizeToFitWidth = YES;
    cell.selectionStyle = UITableViewCellEditingStyleNone;
    cell.textLabel.textColor = [UIColor blackColor];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 25;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    if ([self.EVtextFieldDelegate respondsToSelector:@selector(textFieldDidSelectDopdown:withIndex:)]) {
//        [self.EVtextFieldDelegate textFieldDidSelectDopdown:self withIndex:indexPath.row];
//    }
    
    [self hideDropdown];
}

@end
