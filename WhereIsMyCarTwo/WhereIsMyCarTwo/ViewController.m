//
//  ViewController.m
//  WhereIsMyCarTwo
//
//  Created by Apple on 3/26/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    locationManager = [[CLLocationManager alloc]init];
    locationManager.delegate = self;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager startUpdatingLocation];
    
    _myMapview.showsUserLocation = YES;
    
    [self->locationManager startUpdatingLocation];
    
    CLLocation *location = [locationManager location];
    
    CLLocationCoordinate2D coordinate = [location coordinate];
    
    
    NSString *latitude = [NSString stringWithFormat:@"%f", coordinate.latitude];
    NSString *longitude = [NSString stringWithFormat:@"%f", coordinate.longitude];
    
    //NSLog(@”dLatitude : %@”, latitude);
    //NSLog(@”dLongitude : %@”,longitude);
    NSLog(@"MY HOME :%@", latitude);
    NSLog(@"MY HOME: %@ ", longitude);
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    currentLocation = [locations objectAtIndex:0];
    [locationManager stopUpdatingLocation];
    
    [self->locationManager stopUpdatingLocation];
    
    
    
    
    NSLog(@"my latitude :%f",currentLocation.coordinate.latitude);
    
    NSLog(@"my longitude :%f",currentLocation.coordinate.longitude);

    
    
    NSLog(@"Detected Location : %f, %f", currentLocation.coordinate.latitude, currentLocation.coordinate.longitude);
    CLGeocoder *geocoder = [[CLGeocoder alloc] init] ;
    [geocoder reverseGeocodeLocation:currentLocation
                   completionHandler:^(NSArray *placemarks, NSError *error)
     {
         if (error)
         {
             NSLog(@"Geocode failed with error: %@", error);
             return;
         }
         
         NSLog(@"Monday");
         CLPlacemark *placemark = [placemarks objectAtIndex:0];
         NSLog(@"placemark.ISOcountryCode %@",placemark.ISOcountryCode);
         
     }];
}


- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    
}

@end
