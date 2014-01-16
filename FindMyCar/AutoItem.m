//
//  Auto.m
//  FindMyCar
//
//  Created by Mayank Kapoor on 1/15/14.
//  Copyright (c) 2014 Swati Gupta. All rights reserved.
//

#import "AutoItem.h"

@implementation AutoItem

@synthesize title;
@synthesize subtitle;
@synthesize coordinate;

- (id)initWithCoordinates:(CLLocationCoordinate2D)location autoName:(NSString *)name autoType:(NSString *)type {
	if (self = [super init]) {
		coordinate = location;
		title = name;
		subtitle = type;
	}
	return self;
}

@end
