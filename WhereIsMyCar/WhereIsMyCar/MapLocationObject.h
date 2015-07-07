//
//  MapLocationObject.h
//  WhereIsMyCar
//
//  Created by Apple on 3/25/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>

@import MapKit;

@interface MapLocationObject : NSObject <MKAnnotation, NSCoding>

- (CLLocationCoordinate2D)coordinate;

- (instancetype)initWithCoordinate:(CLLocationCoordinate2D)coordinate andComment:(NSString *)comment;

- (NSString *)subtitle;

//initWithlatitude:latitude andlongitude:longitude
@property (nonatomic) double latitude;
@property (nonatomic) double longitude;
@property (nonatomic) NSString *comment;

@end
