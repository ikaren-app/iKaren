//
//  DetailViewController.h
//  UKaren
//
//  Created by Ehkalu Moo on 11/26/14.
//  Copyright (c) 2014 Ehkalu Moo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Karen.h"


@interface DetailViewController : UIViewController
{
IBOutlet UIScrollView *scroll;
}
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *detailsLabel;

@property (weak, nonatomic) IBOutlet UILabel *Detail;

@property (strong, nonatomic) Karen* karen;

@end
