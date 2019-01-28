//
//  MyCollectionViewController.m
//  UKaren
//
//  Created by Ehlu Moo on 11/01/16.
//  Copyright © 2016 Ehkalu Moo. All rights reserved.
//

#import "MyCollectionViewController.h"
#import "MyCollectionViewCell.h"
#import "MyImageViewController.h"
#import <Social/Social.h>

@interface MyCollectionViewController () {
    NSArray *myImages;
    BOOL shareEnabled;
    NSMutableArray *selectedImage;
}

@end

@implementation MyCollectionViewController

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
    
    // Initialize recipe image array
    NSArray *Photo = [NSArray arrayWithObjects:@"qwe0.jpg", @"qwe1.jpg", @"qwe2.jpg", @"qwe3.jpg", @"qwe4.jpg", @"qwe5.jpg",@"qwe6.jpg", @"qwe7.jpg", @"qwe8.jpg", @"qwe9.jpg", @"qwe10.jpg", @"qwe11.jpg", @"qwe12.jpg", @"qwe13.jpg", @"qwe14.jpg", @"qwe15.jpg", @"qwe16.jpg", @"qwe17.jpg",@"qwe18.jpg", @"qwe19.jpg", @"qwe20.jpg", @"qwe21.jpg", @"qwe22.jpg", @"qwe23.jpg",@"qwe24.jpg",@"qwe25.jpg",@"qwe26.jpg", @"qwe27.jpg", @"qwe28.jpg", @"qwe29.jpg",@"qwe30.jpg",@"qwe31.jpg",@"qwe32.jpg", @"qwe33.jpg", @"qwe34.jpg", @"qwe35.jpg",@"qwe36.jpg",@"qwe37.jpg",@"qwe38.jpg",@"qwe39.jpg",@"qwe40.jpg",
                      
                      
                      @"qwe41.jpg", @"qwe42.jpg", @"qwe43.jpg", @"qwe44.jpg", @"qwe45.jpg", @"qwe46.jpg", @"qwe47.jpg",@"qwe48.jpg", @"qwe49.jpg", @"qwe50.jpg", @"qwe51.jpg", @"qwe52.jpg", @"qwe53.jpg",@"qwe54.jpg",@"qwe55.jpg",@"qwe56.jpg", @"qwe57.jpg", @"qwe58.jpg", @"qwe59.jpg",@"qwe60.jpg",@"qwe61.jpg",@"qwe62.jpg", @"qwe63.jpg", @"qwe64.jpg", @"qwe65.jpg",@"qwe66.jpg",@"qwe67.jpg",@"qwe68.jpg",@"qwe69.jpg",@"qwe70.jpg",
                      
                      @"qwe71.jpg", @"qwe72.jpg", @"qwe73.jpg", @"qwe74.jpg", @"qwe75.jpg", @"qwe76.jpg", @"qwe77.jpg",@"qwe78.jpg", @"qwe79.jpg", @"qwe80.jpg", @"qwe81.jpg", @"qwe82.jpg", @"qwe83.jpg",@"qwe84.jpg",@"qwe85.jpg",@"qwe86.jpg", @"qwe87.jpg", @"qwe88.jpg", @"qwe89.jpg",@"qwe90.jpg",@"qwe91.jpg",@"qwe92.jpg", @"qwe93.jpg", @"qwe94.jpg", @"qwe95.jpg",@"qwe96.jpg",@"qwe97.jpg",@"qwe98.jpg",@"qwe99.jpg",@"qwe100.jpg",
                      nil];
    
    
    myImages = [NSArray arrayWithObjects:Photo,  nil];
    
    
    
    selectedImage = [NSMutableArray array];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return [myImages count];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [[myImages objectAtIndex:section] count];
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"Cell";
    
    MyCollectionViewCell *cell = (MyCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    UIImageView *recipeImageView = (UIImageView *)[cell viewWithTag:100];
    recipeImageView.image = [UIImage imageNamed:[myImages[indexPath.section] objectAtIndex:indexPath.row]];
    
    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"FrameSelected.png"]];
    cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"FrameSelected2.png"]];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"sequeImage"]) {
        NSArray *indexPaths = [self.collectionView indexPathsForSelectedItems];
        MyImageViewController *destViewController = segue.destinationViewController;
        NSIndexPath *indexPath = [indexPaths objectAtIndex:0];
        destViewController.myImageName = [myImages[indexPath.section] objectAtIndex:indexPath.row];
        [self.collectionView deselectItemAtIndexPath:indexPath animated:YES];
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (shareEnabled) {
        NSString *selectImage = [myImages[indexPath.section] objectAtIndex:indexPath.row];
        [selectedImage addObject:selectImage];
    }
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (shareEnabled) {
        NSString *deSelectImage = [myImages[indexPath.section] objectAtIndex:indexPath.row];
        [selectedImage removeObject:deSelectImage];
    }
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if (shareEnabled) {
        return NO;
    } else {
        return YES;
    }
}


- (IBAction)shareButtonTouched:(id)sender {
    if (shareEnabled) {
        
        // Post selected photos to Facebook
        if ([selectedImage count] > 0) {
            if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
                SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
                
                [controller setInitialText:@"Check it out!"];
                for (NSString *Photos in selectedImage) {
                    [controller addImage:[UIImage imageNamed:Photos]];
                }
                
                [self presentViewController:controller animated:YES completion:Nil];
            }
        }
        
        // Deselect all selected items
        for(NSIndexPath *indexPath in self.collectionView.indexPathsForSelectedItems) {
            [self.collectionView deselectItemAtIndexPath:indexPath animated:NO];
        }
        
        // Remove all items from selectedRecipes array
        [selectedImage removeAllObjects];
        
        // Change the sharing mode to NO
        shareEnabled = NO;
        self.collectionView.allowsMultipleSelection = NO;
        self.shareButton.title = @"Facebook Share";
        [self.shareButton setStyle:UIBarButtonItemStylePlain];
        
    } else {
        
        // Change shareEnabled to YES and change the button text to DONE
        shareEnabled = YES;
        self.collectionView.allowsMultipleSelection = YES;
        self.shareButton.title = @"Upload";
        [self.shareButton setStyle:UIBarButtonItemStyleDone];
        /*
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:@"Note"
                                      message:@"You need to logged-in in the Settings. If you have done so, tap 'Ok' then select your favorite quote"
                                      preferredStyle:UIAlertControllerStyleAlert];
        
      
               UIAlertAction* Settings = [UIAlertAction actionWithTitle:@"Settings" style:UIAlertActionStyleDefault handler:^(UIAlertAction * Settings)
                             
                            
                             {
                                 


                                 [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
                                 
                                
                             }];
         
        UIAlertAction* ok = [UIAlertAction
                                 actionWithTitle:@"Ok"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action)
                                 {
                                     [alert dismissViewControllerAnimated:YES completion:nil];
                                 }];
        //[alert addAction:Settings];
        [alert addAction:ok];
        

        
        
        [self presentViewController:alert animated:YES completion:nil];
        
         */
       
        
           }
}

- (IBAction)switch:(id)sender {
}

@end
