//
//  TodoDetailTableViewController.m
//  True Todo
//
//  Created by Apple on 3/27/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "TodoDetailTableViewController.h"
#import "TodoListMainTableViewController.h"
#import "POIResultsTableViewController.h"

#import "TodoObject.h"

@import MapKit;

@interface TodoDetailTableViewController ()<UITextFieldDelegate,CLLocationManagerDelegate>



//@property (nonatomic, weak) IBOutlet UIButton *deleteToDoButton;
//@property (nonatomic, weak) IBOutlet UIButton *checkmarkTappedFromMainVCButton;
@property (nonatomic, weak) IBOutlet UILabel *dueDateLabel;
@property (nonatomic, weak) IBOutlet UITextView *notesTextView;
@property (nonatomic, weak) IBOutlet UITextField *todoGoesHereFromMainVCTextField;
@property (nonatomic, weak) IBOutlet UITextField *enterLocationTextField;

- (IBAction)checkmarkTappedFromMainVCButton:(UIBarButtonItem *)sender;



@end

@implementation TodoDetailTableViewController
{
    NSDateFormatter *dateFormatter;
    CLLocationManager *locationManager;
    MKLocalSearch *localSearch;
    CLGeocoder *geocoder;
    MKCoordinateRegion userLocation;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.todoGoesHereFromMainVCTextField.text = self.aTask.todoObjectString;
    self.checkmarkTappedFromMainVCButton.selected = self.aTask.done;
//    [self configureLocationManager];
    dateFormatter =[[NSDateFormatter alloc] init];
    
    NSString *dateFormat = [NSDateFormatter dateFormatFromTemplate:@"MMddyyyy" options:0 locale:[NSLocale currentLocale]];
    
    [dateFormatter setDateFormat: dateFormat];
    
//    self.checkmarkTappedFromMainVCButton
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dueDateWasChosen:(NSDate *)dueDate
{
    
    //    self.dueDateLabel.text = [dateFormatter stringFromDate:dueDate];
    //    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//
//    // Return the number of rows in the section.
//    return 0;
//}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//  
//    
//}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField == self.enterLocationTextField)
    {
        
    }
    
    
    
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    BOOL rc = NO;
    
    if (![textField.text isEqualToString:@""] || [textField.text isEqualToString:@""])
    {
        
        
        if (textField == self.enterLocationTextField && ![textField.text isEqualToString:@""])
        {
            [self configureLocationManager];
        }
        [textField resignFirstResponder];
        rc = YES;
    }
    return rc;
}


- (void)configureLocationManager
{
    if ([CLLocationManager authorizationStatus] != kCLAuthorizationStatusDenied && [CLLocationManager authorizationStatus] != kCLAuthorizationStatusRestricted)
    {
        if (!locationManager)
        {
            locationManager = [[CLLocationManager alloc] init];
            locationManager.delegate = self;
            locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
            
            if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined)
            {
                [locationManager requestWhenInUseAuthorization];
            }
            else
            {
                [self enableLocationManager:YES];
            }
        }
        
    }
    else
    {
        
    }
}

-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    if (status != kCLAuthorizationStatusAuthorizedWhenInUse)
    {
        
    }
    else
    {
        [self enableLocationManager:YES];
    }
}

- (void)enableLocationManager:(BOOL)enable
{
    if (locationManager)
    {
        if (enable) {
            [locationManager stopUpdatingLocation];
            [locationManager startUpdatingLocation];
        }
        else
        {
            [locationManager stopUpdatingLocation];
        }
    }
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    if (error != kCLErrorLocationUnknown)
    {
        [self enableLocationManager:NO];
    }
}


- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    [self enableLocationManager:NO];
    
    CLLocation *location = [locations lastObject];
    
    userLocation = MKCoordinateRegionMakeWithDistance(location.coordinate, 1500.00, 1500.00);
    
    [self performSearch:userLocation];
}



-(void)performSearch:(MKCoordinateRegion)aRegion
{
    
    
    MKLocalSearchRequest *request = [[MKLocalSearchRequest alloc] init];
    request.naturalLanguageQuery = self.enterLocationTextField.text;
    request.region = aRegion;
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    localSearch = [[MKLocalSearch alloc] initWithRequest:request];
    
    [localSearch startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error){
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
        if (error != nil) {
            [[[UIAlertView alloc] initWithTitle:@"Map Error"
                                        message:[error localizedDescription]
                                       delegate:nil
                              cancelButtonTitle:@"OK"otherButtonTitles:nil] show];
            return;
        }
        
        if ([response.mapItems count] == 0) {
            [[[UIAlertView alloc] initWithTitle:@"No Results"
                                        message:nil
                                       delegate:nil
              
                              cancelButtonTitle:@"OK"otherButtonTitles:nil] show];
            return;
        }
        
        
        
        
        self.results = response;
        
    }];
    
    
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [self performSearch:userLocation];
    self.POIVC = [segue destinationViewController];
    self.POIVC.locationsArray = self.results.mapItems;
    self.POIVC.aTask = self.aTask;
    NSLog(@"%@ mapItems", self.POIVC.locationsArray);
}




- (IBAction)checkmarkTappedFromMainVCButton:(UIBarButtonItem *)sender;
{

}

@end
