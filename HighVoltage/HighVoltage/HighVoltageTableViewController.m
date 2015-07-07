//
//  HighVoltageTableViewController.m
//  HighVoltage
//
//  Created by Apple on 3/12/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved. //
//

#import "HighVoltageTableViewController.h"
#import "CalculationsTableViewController.h"

#import "CalculationsBrain.h"

@interface HighVoltageTableViewController () <UITextFieldDelegate, UIPopoverPresentationControllerDelegate>


{
    NSMutableArray *energyEmptyStore;
    NSMutableArray *energyTypeArray;
    NSDictionary *cellConnectionIdentifier;
}


//- (IBAction)clearButton:(UIBarButtonItem *)sender;




@end


@implementation HighVoltageTableViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    energyTypeArray = [[NSMutableArray alloc] initWithObjects:@"Volts(V)", @"Amps(A)", @"Ohms(Ω)", @"Watts(W)", nil];
    energyEmptyStore = [[NSMutableArray alloc] init];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [energyEmptyStore count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[energyEmptyStore objectAtIndex:indexPath.row] forIndexPath:indexPath];
    
    
    
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


#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"DestinationViewControllerSegue"])
    {
        CalculationsTableViewController *destVC = (CalculationsTableViewController *)[segue destinationViewController]; //cast as generic destinationViewController
        destVC.delegate = self;
        destVC.popoverPresentationController.delegate = self;
        energyTypeArray = CalculationsTableViewController.arrayThatDoesNothing;
        float contentHeight = 44.0f * ([energyTypeArray count]+1 ); //44 is the default height of a cell<----44
        destVC.preferredContentSize = CGSizeMake(100.0f, contentHeight); //width and height
    }
}
// cmd 3 makes the sim smaller
-(void)energyTypeWasSelected:(NSMutableArray *)energyString
{
    cellConnectionIdentifier = @{@"Volts(V)":@"ElectricalPotential", @"Amps(A)":@"Current", @"Ohms(Ω)":@"Resistance", @"Watts(W)":@"Power"};
    [energyTypeArray addObject:[cellConnectionIdentifier objectForKey:energyString]];
    [self.tableView reloadData];
    NSLog(@"%@", energyString);
}


#pragma mark - PopoverPresentationController Delegate

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller
{
    return UIModalPresentationNone;
}

#pragma mark - Action Handlers

//- (IBAction)clearButton:(UIBarButtonItem *)sender
//{
//    CalculationsBrain *anItem = [[CalculationsBrain alloc] init];
//    [energyTypeArray addObject:anItem];
//    [self.tableView reloadData];
//}
@end
