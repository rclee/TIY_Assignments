//
//  TicketsTableViewController.m
//  Jackpot
//
//  Created by Apple on 3/3/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "TicketsTableViewController.h"
#import "Ticket.h"
#import "WinningTicketViewController.h"

@interface TicketsTableViewController ()
{
    NSMutableArray *tickets;
}

@property (weak, nonatomic) IBOutlet UIBarButtonItem *addButton;


- (IBAction)createTicket:(id)sender;

@end

@implementation TicketsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Lottery Tickets";
    tickets = [[NSMutableArray alloc] init];
}


- (void)didReceiveMemoryWarning {
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
    return [tickets count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TicketCell" forIndexPath:indexPath];
    
    //cell.textLabel.text = a [indexPath.row];
    Ticket *aTicket = tickets[indexPath.row];
    cell.textLabel.text = [aTicket description];
    
    cell.detailTextLabel.text = @"";
    
    return cell; //Modify this ^
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

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"CheckTicketsSegue"])
    {
        WinningTicketViewController *textFieldVC = (WinningTicketViewController *)[segue destinationViewController];
        textFieldVC.delegate = self;
    }
}

- (void)winningTicketNumberWasChosen:(NSArray *)lottoWinningNumbers
{

    //self.destinationTimeLabel.text = [dateFormatTimeCircuit stringFromDate:destinationDate]; 
    
}



#pragma mark - Action Handlers

- (IBAction)createTicket:(id)sender;
{
    Ticket *aTicket =[Ticket ticketUsingQuickPick];
    [tickets addObject:aTicket];
    [self.tableView reloadData];
}

@end


// winning numbers / interface / button / compare against current numbers if numbers are winners display winnings + total winning amount
// winning amounts
//




