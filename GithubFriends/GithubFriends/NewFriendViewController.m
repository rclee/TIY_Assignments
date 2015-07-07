//
//  NewFriendViewController.m
//  GithubFriends
//
//  Created by Apple on 3/18/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "NewFriendViewController.h"

@interface NewFriendViewController () <NSURLSessionDataDelegate>
{
    UITextField *usernameTextField;
    NSMutableData *receivedData;
}

@end

@implementation NewFriendViewController

- (void)viewDidLoad
{
    
    
    
    [super viewDidLoad];
    usernameTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, 74, 300, 40)]; //placement and size
    usernameTextField.placeholder = @"Username"; //placeholder text
    [self.view addSubview:usernameTextField]; //adding the textfield to the view
    usernameTextField.textAlignment = NSTextAlignmentCenter;
    usernameTextField.backgroundColor = [UIColor whiteColor];
    
    
    CGFloat saveFriendY = usernameTextField.frame.origin.y + usernameTextField.frame.size.height + 10; // Y is equal to 74 on usernameTextField
    UIButton *saveFriend = [[UIButton alloc] initWithFrame:CGRectMake(10, saveFriendY, 300, 40)];
    [saveFriend setTitle:@"Git User" forState:UIControlStateNormal]; // if set to normal other states inherit the setTitle
    [saveFriend addTarget:self action:@selector(save) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:saveFriend];
    
    CGFloat cancelY = saveFriend.frame.origin.y + saveFriend.frame.size.height + 10;
    UIButton *cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(10, cancelY, 300, 40)];
    [cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cancelButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)save
{
    NSString *username = usernameTextField.text; //pulling the text from username
    NSString *urlString = [NSString stringWithFormat:@"https://api.github.com/users/%@", username];
    NSURL *url = [NSURL URLWithString:urlString]; //proper URL object
    
//    NSURLRequest *request = [NSURLRequest requestWithURL:url]; //fed URL object to requestWithURL
    
//    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil]; //Class method SSR:request - with synchronous you have to wait for a response - an asynchronous request doesnt have to wait for a request preventing lockup
    
//    NSDictionary *userInfo = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:nil]; //converting json to a dictionary or vice versa?
    
//    [self.friends addObject:userInfo]; //adding the dictionary to the Array
    
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration //used more than once keep it around
                                                          delegate:self
                                                     delegateQueue:[NSOperationQueue mainQueue]];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url]; //similar to above URLRequest ^
    
    [dataTask resume]; //starts at a paused state - have to resume it
    
    
    
//    [self cancel]; // calling method to close the view
    
}

-(void)cancel
{
    [self dismissViewControllerAnimated:YES completion:nil]; //dismisses the modal
}

#pragma mark - NSURLsession delegate




- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler
{
    completionHandler(NSURLSessionResponseAllow); //block or a closure - anon function - returns void
    
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data //blob of bytes - download in pieces - recieved data but not all the data - more to come...maybe
{
    if (!receivedData)
    {
        receivedData = [[NSMutableData alloc] initWithData:data];
    }//only create an object if we need one/alloc init - don't load stuff until you need to load it
    else
    {
        [receivedData appendData:data];
    }
    
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error //if it didn't complete this will point to error
{
    if (!error)
    {
        NSLog(@"Download Successful."); //RCL: take out in production
        NSDictionary *userInfo = [NSJSONSerialization JSONObjectWithData:receivedData
                                                                 options:0
                                                                   error:nil]; // grab user info as dictionary
        [self.friends addObject:userInfo];
        [self cancel];
    }
}



















@end
