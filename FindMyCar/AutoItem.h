//
//  Auto.h
//  FindMyCar
//
//  Created by Mayank Kapoor on 1/15/14.
//  Copyright (c) 2014 Swati Gupta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface AutoItem : NSObject <MKAnnotation>

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

- (id)initWithCoordinates:(CLLocationCoordinate2D)location autoName:(NSString *)name autoType:(NSString *)type;

@end
