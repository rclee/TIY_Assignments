//
//  FriendDetailViewController.m
//  GithubFriends
//
//  Created by Apple on 3/18/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "FriendDetailViewController.h"

#import "FriendCell.h"

@interface FriendDetailViewController () <UITableViewDelegate, UITableViewDataSource, NSURLSessionDataDelegate>
{
    NSArray *repos;
    UILabel *locationLabel;
    NSMutableData *receivedData;
    
    UITableView *theTableView;
}

@end

@implementation FriendDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *username = [self.friendInfo objectForKey:@"login"];
    NSString *urlString = [NSString stringWithFormat:@"https://api.github.com/users/%@/repos", username];
    NSURL *url = [NSURL URLWithString:urlString]; //proper URL object
//    NSURLRequest *request = [NSURLRequest requestWithURL:url]; //fed URL object to requestWithURL
//    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil]; 
//    repos = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:nil]; //converting json to a dictionary or vice versa?
//    
//    NSLog(@"%@ here be repos", repos);
    
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration
                                                          delegate:self
                                                     delegateQueue:[NSOperationQueue mainQueue]];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url];
    
    [dataTask resume];
   
    

    
    
    locationLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 74, 200, 40)]; //placement and size
    [self.view addSubview:locationLabel]; //adding the textfield to the view
    locationLabel.textAlignment = NSTextAlignmentCenter;
    locationLabel.backgroundColor = [UIColor whiteColor];
    locationLabel.text = [NSString stringWithFormat:@"%@",[self.friendInfo objectForKey:@"location"]];
    
    
    CGFloat locationLabelY = locationLabel.frame.origin.y + locationLabel.frame.size.height + 10; // Y is equal to 74 on usernameTextField
    UILabel *emailLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, locationLabelY, 200, 40)];
    emailLabel.textAlignment = NSTextAlignmentCenter;
    emailLabel.backgroundColor = [UIColor whiteColor];
    emailLabel.text = [NSString stringWithFormat:@"%@",[self.friendInfo objectForKey:@"email"]];
    [self.view addSubview:emailLabel];

    CGFloat tableY = emailLabel.frame.origin.y + emailLabel.frame.size.height + 10;
    theTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, tableY, 320, 395)];

    [self.view addSubview:theTableView];
    
    theTableView.delegate = self;
    theTableView.dataSource = self;
    
    [theTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    

    
//    NSDictionary *friendInfo = friends[indexPath.row];
//    cell.textLabel.text = [friendInfo objectForKey:@"name"];
//    //    cell.textLabel.text = friendInfo[@"name"]; equal to above line
//    NSURL *avatarURL = [NSURL URLWithString:friendInfo[@"avatar_url"]]; //taking JSON key to grab the value
//    NSData *imageData = [NSData dataWithContentsOfURL:avatarURL]; //making call to network - fetching image and storing as an NSObject
//    UIImage *image = [UIImage imageWithData:imageData];// returns an actual image
//    cell.imageView.image = image; //represents the standard image in a cell
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)login
//{
//    NSArray *username = repos; //pulling the text from username
//    NSString *urlString = [NSString stringWithFormat:@"https://api.github.com/users/%@/repos", username];
//    NSURL *url = [NSURL URLWithString:urlString]; //proper URL object
//    
//    NSURLRequest *request = [NSURLRequest requestWithURL:url]; //fed URL object to requestWithURL
//    
//    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil]; //Class method SSR:request - with synchronous you have to wait for a response - an asynchronous request doesnt have to wait for a request preventing lockup
//    
//    NSDictionary *userInfo = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:nil]; //converting json to a dictionary or vice versa?
//    
//    [self.friends addObject:userInfo]; //adding the dictionary to the Array
//    
//    [self cancel]; // calling method to close the view
//    
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [repos count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    NSDictionary *repo = repos[indexPath.row];
    
    cell.textLabel.text = repo[@"name"];
    
    if (repos[indexPath.row][@"description"] != [NSNull null])
    {
        cell.detailTextLabel.text = repos[indexPath.row][@"description"];
    }
    return cell;
}
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellTable" forIndexPath:indexPath];
//    
//    cell.textLabel.text = repos[indexPath.row][@"name"];
////    self.friendInfo = repos[indexPath.row];
////    cell.textLabel.text = [self.friendInfo objectForKey:@"name"];
//    //    cell.textLabel.text = friendInfo[@"name"]; equal to above line
////    NSURL *avatarURL = [NSURL URLWithString:friendInfo[@"avatar_url"]]; //taking JSON key to grab the value
////    NSData *imageData = [NSData dataWithContentsOfURL:avatarURL]; //making call to network - fetching image and storing as an NSObject
////    UIImage *image = [UIImage imageWithData:imageData];// returns an actual image
////    cell.imageView.image = image; //represents the standard image in a cell
//    NSLog(@"%@ testing", repos);
//    
//    return cell;
//}


#pragma mark - NSURLSessionData Delegate


- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler
{
    completionHandler(NSURLSessionResponseAllow);
}

-(void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data
{
    if (!receivedData)
    {
        receivedData = [[NSMutableData alloc] initWithData:data];
    }
    else
    {
        [receivedData appendData:data];
    }
}

-(void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
{
    if(!error)
    {
        NSLog(@"Download finished...");
        repos = [NSJSONSerialization JSONObjectWithData:receivedData
                                                options:0
                                                  error:nil];
        [theTableView reloadData];
        
        
    }
}







@end
