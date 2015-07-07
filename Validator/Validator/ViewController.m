//
//  ViewController.m
//  Validator
//
//  Created by Apple on 3/9/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "ViewController.h"
#import "Validator.h"

@interface ViewController () <UITextFieldDelegate>

{
    Validator *validator;
}

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *streetAddressTextField;
@property (weak, nonatomic) IBOutlet UITextField *cityTextField;
@property (weak, nonatomic) IBOutlet UITextField *stateTextField;
@property (weak, nonatomic) IBOutlet UITextField *zipTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextField;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Form Validator";
    validator = [[Validator alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    BOOL rc = NO;
    if (textField == self.nameTextField)
    {
        rc = [validator validateNameTextField:self.nameTextField.text];
        if (rc)
        {
            [self.nameTextField resignFirstResponder];
            [self.streetAddressTextField becomeFirstResponder];
        }
    }
    if (textField == self.streetAddressTextField)
    {
        rc = [validator validateAddress:self.streetAddressTextField.text];
        if (rc)
        {
            [self.streetAddressTextField resignFirstResponder];
            [self.cityTextField becomeFirstResponder];
        }
    }
    if (textField == self.cityTextField)
    {
        rc = [validator validateCity:self.cityTextField.text];
        if (rc)
        {
            [self.cityTextField resignFirstResponder];
            [self.stateTextField becomeFirstResponder];
        }
    }
    if (textField == self.stateTextField)
    {
        rc = [validator validateState:self.stateTextField.text];
        if (rc)
        {
            [self.stateTextField resignFirstResponder];
            [self.zipTextField becomeFirstResponder];
        }
    }
    if (textField == self.zipTextField)
    {
        rc = [validator validateZipCode:self.zipTextField.text];
        if (rc)
        {
            [self.nameTextField resignFirstResponder];
            [self.streetAddressTextField becomeFirstResponder];
        }
    }
    if (textField == self.phoneNumberTextField)
    {
        rc = [validator validatePhoneNumber:self.phoneNumberTextField.text];
    }
    if (rc)
    {
        [textField resignFirstResponder];
    }
    
    return rc;
}











@end
