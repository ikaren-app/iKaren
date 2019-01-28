//
//  MyImageViewController.h
//  UKaren
//
//  Created by Ehlu Moo on 10/15/16.
//  Copyright © 2016 Ehkalu Moo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>

@interface MyImageViewController : UIViewController
    @property (weak, nonatomic) IBOutlet UIImageView *myImageView;
    @property (weak, nonatomic) NSString *myImageName;
    
    - (IBAction)close:(id)sender;

@end
