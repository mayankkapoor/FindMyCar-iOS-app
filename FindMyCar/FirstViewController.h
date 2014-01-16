//
//  FirstViewController.h
//  FindMyCar
//
//  Created by Mayank Kapoor on 1/14/14.
//  Copyright (c) 2014 Swati Gupta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface FirstViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
