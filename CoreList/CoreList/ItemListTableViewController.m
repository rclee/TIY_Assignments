//
//  ItemListTableViewController.m
//  CoreList
//
//  Created by Apple on 3/31/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "ItemListTableViewController.h"
#import "ModalViewController.h"
#import "CoreDataStack.h"

#import "ListItem.h"

#import "ItemCell.h"

@interface ItemListTableViewController ()
{
    NSMutableArray *itemListArray;
    CoreDataStack *cdStack;
}

//- (IBAction)addNewItem:(UIBarButtonItem *)sender;

@end

@implementation ItemListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    cdStack = [CoreDataStack coreDataStackWithModelName:@"CoreListModel"];
    cdStack.coreDataStoreType = CDSStoreTypeSQL;
    
    itemListArray = [[NSMutableArray alloc] init];
                     
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"ListItem" inManagedObjectContext:cdStack.managedObjectContext];
    
    NSFetchRequest *fetch = [[NSFetchRequest alloc] init];
    
    fetch.entity = entity;
    
    itemListArray = nil;
    itemListArray = [[cdStack.managedObjectContext executeFetchRequest:fetch error:nil] mutableCopy];
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [itemListArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ItemCell" forIndexPath:indexPath];
    
    
    ListItem *itemList = itemListArray[indexPath.row];
    cell.itemLabel.text = itemList.name;
    
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

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"SegueModalViewController"])
    {
//        UINavigationController *navController = [segue destinationViewController];
        ModalViewController *modalVC = [segue destinationViewController];
        modalVC.cdStack = cdStack;
    }
}


//- (IBAction)addNewItem:(UIBarButtonItem *)sender
//{
//    
//}

@end
