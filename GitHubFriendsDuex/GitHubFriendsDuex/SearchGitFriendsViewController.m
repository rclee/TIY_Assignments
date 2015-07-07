//
//  SearchGitFriendsViewController.m
//  GitHubFriendsDuex
//
//  Created by Apple on 4/20/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "SearchGitFriendsViewController.h"

@interface SearchGitFriendsViewController () <UITextFieldDelegate, NSURLSessionDataDelegate>
{
    NSMutableData *receivedData;
}

@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
//@property (weak, nonatomic) IBAction UIButton *cancelButton;

@end

@implementation SearchGitFriendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.usernameTextField becomeFirstResponder];
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
- (IBAction)cancelButton:(UIButton *)sender
{
    [self cancel];
}

- (IBAction)saveFriendButton:(UIButton *)sender
{
    [self save];
}

- (void)save
{
    NSString *username = self.usernameTextField.text;
    NSString *urlString = [NSString stringWithFormat:@"https://api.github.com/users/%@", username];
    NSURL *url = [NSURL URLWithString:urlString];
    
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url];
    
    [dataTask resume];
    
    //    [self cancel];
}

- (void)cancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UITextField Delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    BOOL rc = NO;
    
    if (![textField.text isEqualToString:@""])
    {
        rc = YES;
        [self save];
//        [self cancel];
    }
    
    return rc;
}

#pragma mark - NSURLSession delegate

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler
{
    completionHandler(NSURLSessionResponseAllow);
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data
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

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
{
    if (!error)
    {
        NSLog(@"Download Successful.");
        NSDictionary *userInfo = [NSJSONSerialization JSONObjectWithData:receivedData options:0 error:nil];
        [self.friends addObject:userInfo];
//        NSLog(@"%@ JSON DATA", self.friends);
        [self cancel];
    }
}

@end
