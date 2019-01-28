//
//  DetailViewController.m
//  UKaren
//
//  Created by Ehkalu Moo on 11/26/14.
//  Copyright (c) 2014 Ehkalu Moo. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize nameLabel;
@synthesize detailsLabel;
@synthesize Detail;
@synthesize karen;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



-(void)viewWillAppear:(BOOL)animated
{
    nameLabel.text = karen.name;
    detailsLabel.text = karen.description;
    Detail.text = karen.detail;
    
    
    
}



- (BOOL)prefersStatusBarHidden
{
    return YES;
}
 
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
