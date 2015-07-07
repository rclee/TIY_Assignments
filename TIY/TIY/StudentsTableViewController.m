//
//  StudentsTableViewController.m
//  TIY
//
//  Created by Apple on 3/31/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "StudentsTableViewController.h"
#import "CoreDataStack.h"

#import "Student.h"

#import "StudentCell.h"

static NSString * const StudentCellIdentifier = @"StudentCell"; // good to use when typing a string that may be typed incorrectly

@interface StudentsTableViewController () <UITextFieldDelegate>
{
    NSMutableArray *students;
    CoreDataStack *cdStack;
}

- (IBAction)addNewStudent:(UIBarButtonItem *)sender;

@end

@implementation StudentsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    [self.tableView registerClass:[StudentCell class] forCellReuseIdentifier:StudentCellIdentifier]; // needs to be done when you enter a custom class
    
    
    cdStack = [CoreDataStack coreDataStackWithModelName:@"TIYModel"];
    cdStack.coreDataStoreType = CDSStoreTypeSQL;
    
    students = [[NSMutableArray alloc] init];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Student" inManagedObjectContext:cdStack.managedObjectContext];
    
    NSFetchRequest *fetch = [[NSFetchRequest alloc] init];
    
    fetch.entity = entity;
    
    students = nil;
    students = [[cdStack.managedObjectContext executeFetchRequest:fetch error:nil] mutableCopy];
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [students count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    StudentCell *cell = [tableView dequeueReusableCellWithIdentifier:StudentCellIdentifier forIndexPath:indexPath];
    
    Student *aStudent = students[indexPath.row]; // the matching student object from the array
    if ([aStudent.lastName isEqualToString:@""])
    {
        [cell.nameTextField becomeFirstResponder];
    }
    else
    {
        [cell.nameTextField setText:aStudent.lastName];
    }
    
    if (aStudent.ageValue == 0)
    {
        [cell.ageTextField becomeFirstResponder];
    }
    else
    {
        [cell.ageTextField setText:[NSString stringWithFormat:@"%d", aStudent.ageValue]];
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

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

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

#pragma mark - Action Handlers

- (IBAction)addNewStudent:(UIBarButtonItem *)sender
{
    Student *aStudent = [NSEntityDescription insertNewObjectForEntityForName:@"Student" inManagedObjectContext:cdStack.managedObjectContext];
    [students addObject:aStudent]; // do this in modal view
    
//    aStudent.name = textfield.text
    NSInteger index = [students indexOfObject:aStudent];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
}

#pragma mark - TextField delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    BOOL rc = NO;
    
    UIView *contentView = [textField superview];
    StudentCell *cell = (StudentCell *)[contentView superview]; // handle to the cell
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    Student *aStudent = students[indexPath.row];
    
    if (![textField.text isEqualToString:@""])
    {
        rc = YES;
        if ([textField.placeholder isEqualToString:@"Age"])
        {
            [cell.nameTextField becomeFirstResponder];
        }
        else
        {
            aStudent.lastName = textField.text;
            aStudent.ageValue = 0; // (cell.ageTextField.text) ? [cell.ageTextField.text intValue] : 0;
            [textField resignFirstResponder];
            [self saveCoreDataUpdates];
        }
    }
    return rc;
}

- (void)saveCoreDataUpdates //before dimissing the view....in the IBAction
{
    [cdStack saveOrFail:^(NSError *errorOrNil)
    {
        if (errorOrNil)
        {
            NSLog(@"Error from CDStack: %@", [errorOrNil localizedDescription]);
            
        }
    }];
}

@end


























