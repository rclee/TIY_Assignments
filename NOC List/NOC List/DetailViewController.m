//
//  DetailViewController.m
//  NOC List
//
//  Created by Ben Gohlke on 1/28/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

//
// 17. By the empty circle to the left of this IBOutlet, it looks like this property is not connected to its storyboard
//     object. How do we do that?
//
@property (weak, nonatomic) IBOutlet UILabel *coverNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *agentNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *levelLabel;
//
// 18. We need properties for the other two labels here so we can reference them in code.
//

// Why is this here?
- (void)configureView;

@end

@implementation DetailViewController

#pragma mark - Managing the detail view

- (void)setAgent:(Agent *)newAgent
{
    if (_agent != newAgent)
    {
        _agent = newAgent;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView //Calling below v
{
    // What is being checked here?
    if (self.agent)
    {
        //
        // 19. We need to set the title of this view to "Agent #", where # is the agent's last name (use the cover name). But
        //     the Agent object only has a name property with the first and last name in a single string. How do we get just
        //     the last name?
        //
        //     (hint: We did something similar to this in HW 1)
        //
        
        NSArray *nameParts = [self.agent.coverName componentsSeparatedByString:@" "]; //made an array and seperated...
        NSString *agentName = nameParts[1];
        NSString *message = [NSString stringWithFormat:@"Agent %@", agentName];
        self.title = message;
        
        //
        // 20. Once we have the last name of the agent from the code above, how do we set the view's title to the right
        //     string?
        //
        
        
        
        //
        // 21. We need to set the three labels in our view to the agent's cover name, real name, and access label.
        //
        //     The level label will be a little trickier, because the level property is an NSInteger. We also want that label
        //     to read "Level #". How do we do that?
        //

        self.coverNameLabel.text = self.agent.coverName;
        self.agentNameLabel.text = self.agent.realName;
        self.levelLabel.text = [NSString stringWithFormat:@"Level # %ld", (long)self.agent.accessLevel];
        NSLog(@"%ld", (long)self.agent.accessLevel);
        
      
            
        
    }
}

- (void)viewDidLoad
{
    // What does this do?
    [super viewDidLoad]; // super = call your parent class
    
    //
    // 22. We need to make sure to call the configureView method so the detail view will be populated with the agent's data.
    //     How do we do that?
    //
    [self configureView]; //calling #1^
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end