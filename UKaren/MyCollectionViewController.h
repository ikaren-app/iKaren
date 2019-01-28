//
//  MyCollectionViewController.h
//  UKaren
//
//  Created by Ehlu Moo on 11/01/16.
//  Copyright © 2016 Ehkalu Moo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCollectionViewController : UICollectionViewController
@property (strong, nonatomic) IBOutlet UIBarButtonItem *shareButton;
- (IBAction)shareButtonTouched:(id)sender;



@end
