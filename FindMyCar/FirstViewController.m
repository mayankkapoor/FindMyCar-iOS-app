//
//  FirstViewController.m
//  FindMyCar
//
//  Created by Mayank Kapoor on 1/14/14.
//  Copyright (c) 2014 Swati Gupta. All rights reserved.
//

#import "FirstViewController.h"
#import "AutoItem.h"

@interface FirstViewController ()

@end

@implementation FirstViewController {
	NSMutableArray *autos;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	autos = [[NSMutableArray alloc] initWithCapacity:10];
	
	AutoItem *newCar;
	CLLocationDegrees lat;
	CLLocationDegrees lon;
	
	newCar = [[AutoItem alloc] init];
	newCar.title = @"Nawal's Car";
	newCar.subtitle = @"Car";
	lat = 23.2599183;
	lon = 77.412594;
	newCar.coordinate = CLLocationCoordinate2DMake(lat, lon);
	NSLog(@"New Car added. Name: %@, lastLocation lat %f, lon %f", newCar.title, newCar.coordinate.latitude, newCar.coordinate.longitude);
	[autos addObject:newCar];
	
	[self.tableView reloadData];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark TableViewDataSource methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	if (autos.count == 0) {
		return 1;
	} else {
		return autos.count;
	}
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AutoTableViewItem"];
	
	if (autos.count == 0) {
		cell.textLabel.text = @"No autos";
		cell.detailTextLabel.text = @"Add some in Settings";
		cell.accessoryType = UITableViewCellAccessoryNone;
	} else {
		AutoItem *autoItem = [autos objectAtIndex:indexPath.row];
		cell.textLabel.text = autoItem.title;
		cell.detailTextLabel.text = autoItem.subtitle;
	}
	return cell;
}

#pragma mark TableViewDelegate methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	if (autos.count == 0) {
		return nil;
	} else {
		return indexPath;
	}
}

#pragma mark MKMapViewDelegate Methods
- (void)viewWillAppear:(BOOL)animated {
	CLLocationCoordinate2D zoomLocation;
	AutoItem *autoItem;
	autoItem = [autos objectAtIndex:0];
	zoomLocation.latitude = autoItem.coordinate.latitude;
	zoomLocation.longitude = autoItem.coordinate.longitude;
	
	MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 10000, 10000);
	[_mapView setRegion:viewRegion animated:YES];
	
	for (AutoItem *car in autos) {
		[_mapView addAnnotation:car];
	}
}

@end
