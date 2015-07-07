//
//  MapLocationObject.m
//  WhereIsMyCar
//
//  Created by Apple on 3/25/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "MapLocationObject.h"

@import MapKit;

@interface MapLocationObject ()

@property (nonatomic) CLLocationCoordinate2D coordinate;

@property (strong, nonatomic) NSString *name;





@end

@implementation MapLocationObject




- (NSString *)title //built in method being overwritten for MKAnnotation
{
    self.name = @"Car Location";
    return self.name;
}

- (NSString *)subtitle
{
    return self.comment;
}

- (CLLocationCoordinate2D)coordinate
{
    return _coordinate;
}

- (MKMapItem *)mapItem
{
    MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:self.coordinate addressDictionary:nil];
    MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:placemark];
    mapItem.name = self.name;
    
    return mapItem;
}



- (instancetype)initWithCoordinate:(CLLocationCoordinate2D)coordinate andComment:(NSString *)comment
{
    self = [super init];
    if (self)
    {
        //        _latitude = lat;
        //        _longitude = lng;
        _coordinate = coordinate;
        _comment = comment;
//        NSLog(@"%@ lat lng", );
    }
    return self;
}


#define kLatitudeKey @"latitude"
#define kLongitudeKey @"longitude"
#define kCommentKey @"comment"


- (void)encodeWithCoder:(NSCoder *)aCoder //NSCoding protocol RCL: HW
{

    [aCoder encodeDouble:self.coordinate.latitude forKey:kLatitudeKey];
    [aCoder encodeDouble:self.coordinate.longitude forKey:kLongitudeKey];
    [aCoder encodeObject:self.comment forKey:kCommentKey];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    

    double latitude = [aDecoder decodeDoubleForKey:kLatitudeKey];
    double longitude = [aDecoder decodeDoubleForKey:kLongitudeKey];
    NSString *comment = [aDecoder decodeObjectForKey:kCommentKey];
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(latitude, longitude);
    return [self initWithCoordinate:coordinate andComment:comment];
}



@end
