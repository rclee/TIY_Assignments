//
//  ModalViewController.m
//  CoreList
//
//  Created by Apple on 3/31/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "ModalViewController.h"
#import "ListItem.h"

@interface ModalViewController ()<UITextFieldDelegate>

- (IBAction)saveItemButton:(UIButton *)sender;
- (IBAction)cancelButton:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UITextField *itemTextField;


@end

@implementation ModalViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.itemTextField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{

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

#pragma mark - Action Handlers

- (IBAction)saveItemButton:(UIButton *)sender
{
    
    ListItem *aItem = [NSEntityDescription insertNewObjectForEntityForName:@"ListItem" inManagedObjectContext:self.cdStack.managedObjectContext];
    
    aItem.name = self.itemTextField.text;
    
//    [self.cdStack addObject:aItem];
    
    if (![self.itemTextField.text isEqualToString:@""])
    {
        [self saveDataOrError];
        [self.itemTextField resignFirstResponder];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (IBAction)cancelButton:(UIButton *)sender
{
   [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - TextField Delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    BOOL rc = NO;
    if (![textField.text isEqualToString:@""])
    {
        rc = YES;
        [self saveDataOrError];
        [self.itemTextField resignFirstResponder];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else
    {
        [self.itemTextField becomeFirstResponder];
    }
    return rc;
}

- (void)saveDataOrError
{
    [self.cdStack saveOrFail:^(NSError *errorOrNil)
     {
         if (errorOrNil)
         {
             NSLog(@"Error from CDStack: %@", [errorOrNil localizedDescription]);
             
         }
     }];
}

@end
