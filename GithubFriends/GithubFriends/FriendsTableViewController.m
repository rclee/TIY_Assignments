//
//  FriendsTableViewController.m
//  GithubFriends
//
//  Created by Apple on 3/18/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "FriendsTableViewController.h"
#import "NewFriendViewController.h"
#import "FriendDetailViewController.h"

#import "FriendCell.h"

@interface FriendsTableViewController ()
{
    NSMutableArray *friends;
}

@end

@implementation FriendsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    friends = [[NSMutableArray alloc] init];
    [self.tableView registerClass:[FriendCell class] forCellReuseIdentifier:@"FriendCell"];
    
    UIBarButtonItem *addFriendButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addFriend)];
    self.navigationItem.rightBarButtonItem = addFriendButton;
    
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

    return [friends count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FriendCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FriendCell" forIndexPath:indexPath];
    
    
    NSDictionary *friendInfo = friends[indexPath.row];
    cell.textLabel.text = [friendInfo objectForKey:@"name"];
//    cell.textLabel.text = friendInfo[@"name"]; equal to above line
    NSURL *avatarURL = [NSURL URLWithString:friendInfo[@"avatar_url"]]; //taking JSON key to grab the value
    NSData *imageData = [NSData dataWithContentsOfURL:avatarURL]; //making call to network - fetching image and storing as an NSObject
    UIImage *image = [UIImage imageWithData:imageData];// returns an actual image
    cell.imageView.image = image; //represents the standard image in a cell
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *aFriend = friends[indexPath.row]; //pulling a friend out of the dictionary
    FriendDetailViewController *friendDetailVC = [[FriendDetailViewController alloc] init]; //creating a new friendDetailVC
    friendDetailVC.friendInfo = aFriend;
    [self.navigationController pushViewController:friendDetailVC animated:YES]; //pushdetail animated
    friendDetailVC.view.backgroundColor = [UIColor darkGrayColor];
}

#pragma mark - Action Handlers

- (void)addFriend //Modal?
{
    NewFriendViewController *newFriendVC = [[NewFriendViewController alloc] init];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:newFriendVC];
    newFriendVC.view.backgroundColor = [UIColor purpleColor];
    newFriendVC.friends = friends; // call by referance - both friends point to the same NSMutableArray
    
    [self presentViewController:navController animated:YES completion:nil];
}



@end
