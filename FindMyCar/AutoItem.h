//
//  Auto.h
//  FindMyCar
//
//  Created by Mayank Kapoor on 1/15/14.
//  Copyright (c) 2014 Swati Gupta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface AutoItem : NSObject

@property (nonatomic, copy) NSString *autoName;
@property (nonatomic, copy) NSString *autoType;
@property (nonatomic, assign) CLLocationCoordinate2D lastLocation;

@end
