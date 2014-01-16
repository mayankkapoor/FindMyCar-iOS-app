//
//  FirstViewController.m
//  FindMyCar
//
//  Created by Mayank Kapoor on 1/14/14.
//  Copyright (c) 2014 Swati Gupta. All rights reserved.
//

#import "FirstViewController.h"
#import "Auto.h"

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
	
	Auto *newCar;
	
	newCar = [[Auto alloc] init];
	newCar.autoName = @"Nawal's Car";
	newCar.autoType = @"Car";
	CLLocationDegrees lat = 23.2599183;
	CLLocationDegrees lon = 77.412594;
	newCar.lastLocation = CLLocationCoordinate2DMake(lat, lon);
//	NSLog(@"New Car added. Name: %@, lastLocation lat %f, lon %f", newCar.autoName, newCar.lastLocation.latitude, newCar.lastLocation.longitude);
	
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
//	UILabel *title = (UILabel *)[self.tableView viewWithTag:101];
//	UILabel *subTitle = (UILabel *)[self.tableView viewWithTag:102];
	
	if (autos.count == 0) {
		cell.textLabel.text = @"No autos";
		cell.detailTextLabel.text = @"Add some in Settings";
		cell.accessoryType = UITableViewCellAccessoryNone;
	} else {
		Auto *autoItem = [autos objectAtIndex:indexPath.row];
		cell.textLabel.text = autoItem.autoName;
		cell.detailTextLabel.text = autoItem.autoType;
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

@end
