//
//  ViewController.m
//  WhereIsMyCar
//
//  Created by Apple on 3/25/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "ViewController.h"
#import "MapLocationObject.h"

@import CoreLocation;
@import MapKit;
@import AddressBook;

#define MAP_DISPLAY_SCALE 0.5 * 1609.344

@interface ViewController () <CLLocationManagerDelegate, UITextFieldDelegate>
{
//    NSMutableArray *locationArray;
    CLLocationManager *locationManager;
//    CLGeocoder *geoCoder;
    NSString *latitude;
    NSString *longitude;

}

#define kPinKey @"pin"


@property (strong, nonatomic) MapLocationObject *object;

@property (nonatomic) CLLocationCoordinate2D coordinate;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *currentLocationButton;
@property (weak, nonatomic) IBOutlet UITextField *commentTextField;

- (IBAction)dropPinButton:(UIBarButtonItem *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadLocationData];

    self.navigationItem.prompt = @"Enter a description and drop a pin at your car";
    if (!self.object)
    {
        [self configureLocationManager];
    }
    else
    {
        [self configureMapView];
        [self addAnnotation];
    }
    

}

-(void)loadLocationData
{
    NSData *pinData = [[NSUserDefaults standardUserDefaults] objectForKey:kPinKey];
    if (pinData)
    {
        self.object = [NSKeyedUnarchiver unarchiveObjectWithData:pinData];
    }
    else
    {
        self.object = nil;
    }
}

-(void)saveLocationData
{
    NSData *locationData = [NSKeyedArchiver archivedDataWithRootObject:self.object];
    [[NSUserDefaults standardUserDefaults] setObject:locationData forKey:kPinKey];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (void)configureMapView
{
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance([self.object coordinate], MAP_DISPLAY_SCALE, MAP_DISPLAY_SCALE);
    [self.mapView setRegion:viewRegion];
    
}

-(void)addAnnotation
{
    [self.mapView addAnnotation:self.object];

}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MapLocationObject class]])
    {
        static NSString * const identifier = @"CityAnnotation";
        MKAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        
        if (annotationView)
        {
            annotationView.annotation = annotation;
        }
        else
        {
            annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        }
        
        annotationView.canShowCallout = YES;
        return annotationView; //return is the last thing you do in a method
    }
    return nil;
}


- (void)configureLocationManager
{
    if ([CLLocationManager authorizationStatus] != kCLAuthorizationStatusDenied && [CLLocationManager authorizationStatus] != kCLAuthorizationStatusRestricted)
    {
        if (!locationManager)
        {
            locationManager =[[CLLocationManager alloc] init];
            locationManager.delegate = self;
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;

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
        [self.currentLocationButton setEnabled:NO];
    }
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    if (status != kCLAuthorizationStatusAuthorizedWhenInUse)
    {
        [self.currentLocationButton setEnabled:NO];
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
        if (enable)
        {
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
        [self.currentLocationButton setEnabled:NO];
    }
}



- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    [self enableLocationManager:NO];
//    currentLocation = [locations objectAtIndex:0];
    CLLocation *location = [locations objectAtIndex:0];
   
    NSLog(@"my latitude :%f",location.coordinate.latitude);
    
    NSLog(@"my longitude :%f",location.coordinate.longitude);
    
    [self.currentLocationButton setEnabled:YES];
   

    self.object = [[MapLocationObject alloc] initWithCoordinate:location.coordinate andComment:self.commentTextField.text];
    
    [self configureMapView];
    
}

- (IBAction)dropPinButton:(UIBarButtonItem *)sender
{
    [self addAnnotation];
    self.object.comment = self.commentTextField.text;
    [self.commentTextField resignFirstResponder];
}




@end
