//
//  RootViewController.m
//  LionsAndTigers
//
//  Created by CHRISTINA GUNARTO on 10/30/14.
//  Copyright (c) 2014 Christina Gunarto. All rights reserved.
//

#import "RootViewController.h"
#import "PhotosViewController.h"
#import "MenuViewController.h"

@interface RootViewController () <TopDelegate, HUDDelegate>
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftPhotosConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightPhotosConstraint;
@property (strong, nonatomic) NSMutableArray *currentTigersArray;
@property (strong, nonatomic) NSMutableArray *currentLionsArray;

@property UINavigationController *navVC;
@property PhotosViewController *photosVC;
@property MenuViewController *menuVC;


@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navVC = self.childViewControllers[1];
    self.photosVC = self.navVC.childViewControllers[0];
    self.photosVC.delegate = self;

    self.menuVC = self.childViewControllers[0];
    self.menuVC.delegate = self;


    self.currentTigersArray = [@[[UIImage imageNamed:@"tiger1"],[UIImage imageNamed:@"tiger2"],[UIImage imageNamed:@"tiger3"]] mutableCopy];

    self.currentLionsArray = [@[[UIImage imageNamed:@"lion1"],[UIImage imageNamed:@"lion2"],[UIImage imageNamed:@"lion3"]] mutableCopy];



}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

}

#pragma mark - delegate method implementation

-(void)topRevealButtonTapped
{
    self.leftPhotosConstraint.constant = 500.0;
    self.rightPhotosConstraint.constant = -500.0;
    [self.view layoutIfNeeded];

//    NSLog(@"Adjusted X %f", self.leftPhotosConstraint.constant);
}

-(void)lionsButtonTapped
{

    self.photosVC.currentPhotosArray = self.currentLionsArray;
    [self.photosVC refreshTheView];
    self.leftPhotosConstraint.constant = -16.0;
    self.rightPhotosConstraint.constant = -16.0;
    [self.view layoutIfNeeded];

}

-(void)tigersButtonTapped
{
    self.photosVC.currentPhotosArray = self.currentTigersArray;
    [self.photosVC refreshTheView];
    self.leftPhotosConstraint.constant = -16.0;
    self.rightPhotosConstraint.constant = -16.0;
    [self.view layoutIfNeeded];

}

//#pragma mark - segue

//-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
//{
//    return NO;
//}


//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    if ([segue.identifier isEqualToString:@"photosSegue"]) {
//        UINavigationController *nav = segue.destinationViewController;
//        PhotosViewController *photoVC = (PhotosViewController *)nav.topViewController;
//        photoVC.currentPhotosArray = self.currentPhotosArray;
//        [photoVC refreshTheView];
//    }
//
//}



@end
