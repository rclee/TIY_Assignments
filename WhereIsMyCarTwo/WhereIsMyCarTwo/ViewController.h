//
//  ViewController.h
//  WhereIsMyCarTwo
//
//  Created by Apple on 3/26/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>

@import MapKit;
@import CoreLocation;

@interface ViewController : UIViewController<CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
    CLLocation *currentLocation;
}



@property (weak, nonatomic) IBOutlet MKMapView *myMapview;

@end

