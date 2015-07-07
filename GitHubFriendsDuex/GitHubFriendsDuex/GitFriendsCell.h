//
//  GitFriendsCollectionViewCell.h
//  GitHubFriendsDuex
//
//  Created by Apple on 4/20/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GitFriendsCell : UICollectionViewCell

@property (nonatomic) IBOutlet UILabel *nameLabel;
@property (nonatomic) IBOutlet UILabel *usernameLabel;
@property (nonatomic) IBOutlet UILabel *stat1Label;
@property (nonatomic) IBOutlet UILabel *stat2Label;
@property (nonatomic) IBOutlet UIImageView *userImage;

@end
