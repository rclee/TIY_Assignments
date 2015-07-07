//
//  CounterMainTableViewController.m
//  Counter APP
//
//  Created by Apple on 3/17/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "CounterMainTableViewController.h"

#import "StepperTableViewCell.h"

#import "CounterObject.h"

@interface CounterMainTableViewController () <UITextFieldDelegate>
{
    NSMutableArray *stepperSteps;
}

- (IBAction)addStepper:(UIBarButtonItem *)sender;
- (IBAction)ClearAll:(UIBarButtonItem *)sender;



@end

@implementation CounterMainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    stepperSteps = [[NSMutableArray alloc] init];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return [stepperSteps count];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
     StepperTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"StepperCell" forIndexPath:indexPath];
    
    CounterObject *item = stepperSteps[indexPath.row];
    
    cell.stepperTextField.text = @"";
    
    if (item)
    {
        if (item.counterObjectString) // equal to (todoItem.title)
        {
            [cell.stepperCountLabel setText:item.counterObjectString];
        }
        else
        {
            [cell.stepperCountLabel becomeFirstResponder];
        }
        
    }
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) // enum
    {
        
        [stepperSteps removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    }
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    BOOL rc = NO;
    
    if (![textField.text isEqualToString:@""])
    {
        [textField resignFirstResponder];
        rc = YES;
        
        UIView *contentView = [textField superview]; // handle to textField
        StepperTableViewCell *cell = (StepperTableViewCell *)[contentView superview]; // handle to the cell
        NSIndexPath *path = [self.tableView indexPathForCell:cell]; // handle to the location of the cell
        CounterObject *anItem = stepperSteps[path.row]; // handle to todoItem
        anItem.counterObjectString = textField.text; // stored todoItem in TextField
    }
    
    return rc;
}


#pragma mark - Action Handlers

- (IBAction)ClearAll:(UIBarButtonItem *)sender
{
    [stepperSteps removeAllObjects];
    [self.tableView reloadData];
    
}


- (IBAction)addStepper:(UIBarButtonItem *)sender
{
     CounterObject *anItem = [[CounterObject alloc] init];
    [stepperSteps addObject:anItem];
    
    NSUInteger row = [stepperSteps indexOfObject:anItem];
    [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:row inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
}

@end
