//
//  MyImageViewController.m
//  UKaren
//
//  Created by Ehlu Moo on 10/15/16.
//  Copyright © 2016 Ehkalu Moo. All rights reserved.
//

#import "MyImageViewController.h"

@interface MyImageViewController()
@end
@implementation MyImageViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.myImageView.image = [UIImage imageNamed:self.myImageName];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)close:(id)sender {
    [self dismissViewControllerAnimated:YES completion:NULL];
}
@end
