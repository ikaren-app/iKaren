//
//  TableViewController.h
//  UKaren
//
//  Created by Ehkalu Moo on 11/26/14.
//  Copyright (c) 2014 Ehkalu Moo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController <UISearchBarDelegate, UISearchDisplayDelegate >


@property (strong, nonatomic) NSMutableArray* allTableData;
@property (strong, nonatomic) NSMutableArray* filteredTableData;

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (nonatomic, assign) bool isFiltered;
@end
