//
//  GitFriendsCollectionViewController.m
//  GitHubFriendsDuex
//
//  Created by Apple on 4/20/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "GitFriendsCollectionViewController.h"
#import "SearchGitFriendsViewController.h"
#import "FriendDetialViewController.h"

#import "GitFriendsCell.h"


@interface GitFriendsCollectionViewController ()
{
    NSMutableArray *gitFriendsArray;
}

@end

@implementation GitFriendsCollectionViewController

static NSString * const reuseIdentifier = @"FriendCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    gitFriendsArray = [[NSMutableArray alloc] init];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.collectionView reloadData];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"SearchPushSegue"])
    {
        SearchGitFriendsViewController *searchVC = [segue destinationViewController];
        searchVC.friends = gitFriendsArray;
    }
    else if ([segue.identifier isEqualToString:@"DetailSegue"])
    {
        FriendDetialViewController *detailVC = [segue destinationViewController];
        GitFriendsCell *senderCell = (GitFriendsCell *)sender;
        NSIndexPath *indexPath = [self.collectionView indexPathForCell:senderCell];
        NSDictionary *aFriend = gitFriendsArray[indexPath.row];
        detailVC.friends = aFriend;
        
    }
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return [gitFriendsArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    GitFriendsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    NSDictionary *friendInfo = gitFriendsArray[indexPath.row];
    cell.nameLabel.text = [friendInfo objectForKey:@"name"];
//    NSLog(@"%@",[friendInfo objectForKey:@"name"]);
    cell.usernameLabel.text = [friendInfo objectForKey:@"login"];
    cell.stat1Label.text = [friendInfo objectForKey:@"location"];
    cell.stat2Label.text = [friendInfo objectForKey:@"email"];
    NSURL *avatarURL = [NSURL URLWithString:[friendInfo objectForKey:@"avatar_url"]];
    NSData *imageData = [NSData dataWithContentsOfURL:avatarURL];
    UIImage *image = [UIImage imageWithData:imageData];
    cell.userImage.image = image;
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/


// Uncomment this method to specify if the specified item should be selected
//- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    NSDictionary *aFriend = gitFriendsArray[indexPath.row]; 
//    FriendDetialViewController *friendDetailVC = [[FriendDetialViewController alloc] init];
//    friendDetailVC.friends = aFriend;
//    [self.navigationController pushViewController:friendDetailVC animated:YES];
////    friendDetailVC.view.backgroundColor = [UIColor darkGrayColor];
//    return YES;
//}


/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
