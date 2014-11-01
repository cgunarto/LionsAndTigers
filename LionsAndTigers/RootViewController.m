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

#pragma mark - VC containers
@property UINavigationController *navVC;
@property PhotosViewController *photosVC;
@property MenuViewController *menuVC;

#pragma mark - dynamic kit properties
@property (nonatomic, strong) UICollisionBehavior *collisionBehavior;
@property (nonatomic, strong) UIDynamicItemBehavior *dynamicItemBehavior;
@property (nonatomic, strong) UIGravityBehavior *gravityBehavior;
@property (nonatomic, strong) UIDynamicAnimator *dynamicAnimator;
@property (nonatomic, strong) UIPushBehavior *pushBehavior;
@property (weak, nonatomic) IBOutlet UIView *shadeView;



@end

@implementation RootViewController

#pragma mark - view controller lifecycle

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

#pragma mark - delegate methods implementation

-(void)topRevealButtonTapped
{
    [UIView animateWithDuration:0.3 animations:^{
    self.leftPhotosConstraint.constant = 500.0;
    self.rightPhotosConstraint.constant = -500.0;
    [self.view layoutIfNeeded];
         }];

//    NSLog(@"Adjusted X %f", self.leftPhotosConstraint.constant);
}

-(void)lionsButtonTapped
{

    self.photosVC.currentPhotosArray = self.currentLionsArray;
    [self.photosVC refreshTheView];
    [UIView animateWithDuration:0.3 animations:^{
        self.leftPhotosConstraint.constant = -16.0;
        self.rightPhotosConstraint.constant = -16.0;
        [self.view layoutIfNeeded];
    }];


}

-(void)tigersButtonTapped
{
    self.photosVC.currentPhotosArray = self.currentTigersArray;
    [self.photosVC refreshTheView];
    [UIView animateWithDuration:0.3 animations:^{
        self.leftPhotosConstraint.constant = -16.0;
        self.rightPhotosConstraint.constant = -16.0;
        [self.view layoutIfNeeded];
    }];
//    self.leftPhotosConstraint.constant = -16.0;
//    self.rightPhotosConstraint.constant = -16.0;
//    [self.view layoutIfNeeded];

}

#pragma mark - panGuesture implementation

- (IBAction)panHandler:(UIPanGestureRecognizer *)gesture
{

    CGPoint translation = [gesture translationInView:gesture.view];
    self.leftPhotosConstraint.constant = self.leftPhotosConstraint.constant + translation.x;
    self.rightPhotosConstraint.constant = self.rightPhotosConstraint.constant - translation.x;
//        gesture.view.center = CGPointMake(gesture.view.center.x + translation.x, gesture.view.center.y);
        //take where it is currently and add or subtract to it based on translation
        //after we used the translation we want to reswt it
    
        [gesture setTranslation:CGPointMake(0, 0) inView:gesture.view];

        CGFloat yVelocity = [gesture velocityInView:gesture.view].x;  // get the x velocity
        if (gesture.state == UIGestureRecognizerStateEnded)
        {
            [self.dynamicAnimator updateItemUsingCurrentState:self.shadeView];
    
            if (yVelocity < -500.0) {
                [self.gravityBehavior setGravityDirection:CGVectorMake(-1, 0)];
                [self.dynamicItemBehavior setElasticity:0.5];
                [self.pushBehavior setPushDirection:CGVectorMake([gesture velocityInView:gesture.view].x, 0)];
            }
            else if (yVelocity >= -500.0 && yVelocity < 0) {
                [self.gravityBehavior setGravityDirection:CGVectorMake(-1, 0)];
                [self.dynamicItemBehavior setElasticity:0.25];
                [self.pushBehavior setPushDirection:CGVectorMake(-500.0, 0)];
            }
            else if (yVelocity >= 0 && yVelocity < 500.0) {
                [self.gravityBehavior setGravityDirection:CGVectorMake(1, 0)];
                [self.dynamicItemBehavior setElasticity:0.25];
                [self.pushBehavior setPushDirection:CGVectorMake(500.0, 0)];
            } else {
                [self.gravityBehavior setGravityDirection:CGVectorMake(1, 0)];
                [self.dynamicItemBehavior setElasticity:0.5];
                [self.pushBehavior setPushDirection:CGVectorMake([gesture velocityInView:gesture.view].x, 0)];
            }
        }


}


@end
