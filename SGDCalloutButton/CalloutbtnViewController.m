//
//  CalloutbtnViewController.m
//  SGDCalloutButton
//
//  Created by Shubham Daramwar on 6/13/16.
//  Copyright © 2016 Shubham Daramwar. All rights reserved.
//


#import "CalloutbtnViewController.h"

@interface CalloutbtnViewController ()

@end

@implementation CalloutbtnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.btn.callOutButtonStyle = CallOutButtonStyleInfo;
    self.btn.callOutTitle = @"Title";
    self.btn.callOutText = @"Thanks for the info. I've got something going with your suggestions. The one thing that finally made it work in addition to declaring the class";
    
//    self.Btn2.callOutTitle = @"Title 2";
//    self.Btn2.callOutText = @" 2 Thanks for the info. I've got something going with your suggestions. The one thing that finally made it work in addition to declaring the class";
    
    self.Btn2.callOutButtonStyle = CallOutButtonStyleList;
    self.Btn2.list = @[@"222",@"2",@"3333",];
   
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
