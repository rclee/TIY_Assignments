//
//  DatePickerViewController.m
//  Age Calculator
//
//  Created by Apple on 3/2/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "DatePickerViewController.h"

@interface DatePickerViewController ()

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation DatePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.delegate birthDateWasChosen:self.datePicker.date];
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
