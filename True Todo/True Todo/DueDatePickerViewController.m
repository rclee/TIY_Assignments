//
//  DueDatePickerViewController.m
//  True Todo
//
//  Created by Apple on 3/27/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "DueDatePickerViewController.h"

@interface DueDatePickerViewController ()

- (IBAction)cancelButton:(UIBarButtonItem *)sender;
- (IBAction)doneButton:(UIBarButtonItem *)sender;

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation DueDatePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    //    [self.delegate dueDateWasChosen:self.datePicker.date];
    
    
}

- (IBAction)cancelButton:(UIBarButtonItem *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)doneButton:(UIBarButtonItem *)sender
{
    
    self.toDoItem = [[TodoObject alloc] initWithDate:self.datePicker.date];
    
    //    [self.delegate dueDateWasChosen:self.datePicker.date];
    
    //    self.dueDateProp = self.datePicker.date;
    [self dismissViewControllerAnimated:YES completion:nil];
    
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
