//
//  FriendDetialViewController.m
//  GitHubFriendsDuex
//
//  Created by Apple on 4/20/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "FriendDetialViewController.h"

@interface FriendDetialViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *userImage;
@property (weak, nonatomic) IBOutlet UILabel *realName;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *location;
@property (weak, nonatomic) IBOutlet UILabel *email;
@property (weak, nonatomic) IBOutlet UILabel *hireable;
@property (weak, nonatomic) IBOutlet UILabel *repos;
@property (weak, nonatomic) IBOutlet UILabel *followers;
@property (weak, nonatomic) IBOutlet UILabel *following;

@end

@implementation FriendDetialViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    NSDictionary *friendInfo = gitFriendsArray[indexPath.row];
    self.realName.text = [self.friends objectForKey:@"name"];
//    NSLog(@"%@",[friendInfo objectForKey:@"name"]);
    self.userName.text = [self.friends objectForKey:@"login"];
    self.location.text = [self.friends objectForKey:@"location"];
    self.email.text = [self.friends objectForKey:@"email"];
//    self.hireable.text = [self.friends objectForKey:@"hireable"];
//    self.repos.text = [self.friends objectForKey:@"public_repos"];
//    self.followers.text = [self.friends objectForKey:@"followers"];
//    self.following.text = [self.friends objectForKey:@"following"];
    NSURL *avatarURL = [NSURL URLWithString:[self.friends objectForKey:@"avatar_url"]];
    NSData *imageData = [NSData dataWithContentsOfURL:avatarURL];
    UIImage *image = [UIImage imageWithData:imageData];
    self.userImage.image = image;
}

- (void)didReceiveMemoryWarning {
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

@end
