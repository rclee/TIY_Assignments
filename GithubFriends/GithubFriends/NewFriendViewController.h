//
//  NewFriendViewController.h
//  GithubFriends
//
//  Created by Apple on 3/18/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewFriendViewController : UIViewController

@property (nonatomic) NSMutableArray *friends; //nonatomic can be updated by multiple people - weak or strong is how strongly is holds onto the pointer. Weak for stroyboard stuff...strong for Arrays ect...with no weak or strong then strong is defaulted



@end
