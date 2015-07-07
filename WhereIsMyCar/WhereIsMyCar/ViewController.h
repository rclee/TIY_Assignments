//
//  ViewController.h
//  WhereIsMyCar
//
//  Created by Apple on 3/25/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapLocationObject.h"

@import MapKit;
@import CoreLocation;

@interface ViewController : UIViewController <MKAnnotation, NSCoding>
{
     CLLocation *currentLocation;
}



@property (nonatomic, weak) IBOutlet MKMapView *mapView;

-(void)saveLocationData;

@end

