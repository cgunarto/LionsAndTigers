//
//  PhotosViewController.m
//  LionsAndTigers
//
//  Created by CHRISTINA GUNARTO on 10/30/14.
//  Copyright (c) 2014 Christina Gunarto. All rights reserved.
//

#import "PhotosViewController.h"

@interface PhotosViewController () <UIGestureRecognizerDelegate>
//@property (weak, nonatomic) IBOutlet UIBarButtonItem *leftBarButton;


//@property (nonatomic, strong) UICollisionBehavior *collisionBehavior;
//@property (nonatomic, strong) UIDynamicItemBehavior *dynamicItemBehavior;
//@property (nonatomic, strong) UIGravityBehavior *gravityBehavior;
//@property (nonatomic, strong) UIDynamicAnimator *dynamicAnimator;
//@property (nonatomic, strong) UIPushBehavior *pushBehavior;
//@property (weak, nonatomic) IBOutlet UIView *shadeView;

@end

@implementation PhotosViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
//    self.leftBarButton.enabled = NO;
//  leftBarButton.customView
}

#pragma mark - button

- (IBAction)onLeftBarButtonPressed:(UIBarButtonItem *)button
{
    [self.delegate topRevealButtonTapped];
}

#pragma mark - method

- (void)topRevealButtonTapped
{

}


//- (IBAction)panHandler:(UIPanGestureRecognizer *)gesture
//{
//
//
//    CGPoint translation = [gesture translationInView:gesture.view];
//    gesture.view.center = CGPointMake(gesture.view.center.x + translation.x, gesture.view.center.y);
//    //take where it is currently and add or subtract to it based on translation
//    //after we used the translation we want to reswt it
//
//    [gesture setTranslation:CGPointMake(0, 0) inView:gesture.view];
//
//    CGFloat yVelocity = [gesture velocityInView:gesture.view].y;  // get the y velocity
//    if (gesture.state == UIGestureRecognizerStateEnded)
//    {
//        [self.dynamicAnimator updateItemUsingCurrentState:self.shadeView];
//
//        if (yVelocity < -500.0) {
//            [self.gravityBehavior setGravityDirection:CGVectorMake(-1, 0)];
//            [self.dynamicItemBehavior setElasticity:0.5];
//            [self.pushBehavior setPushDirection:CGVectorMake([gesture velocityInView:gesture.view].x, 0)];
//        }
//        else if (yVelocity >= -500.0 && yVelocity < 0) {
//            [self.gravityBehavior setGravityDirection:CGVectorMake(-1, 0)];
//            [self.dynamicItemBehavior setElasticity:0.25];
//            [self.pushBehavior setPushDirection:CGVectorMake(-500.0, 0)];
//        }
//        else if (yVelocity >= 0 && yVelocity < 500.0) {
//            [self.gravityBehavior setGravityDirection:CGVectorMake(1, 0)];
//            [self.dynamicItemBehavior setElasticity:0.25];
//            [self.pushBehavior setPushDirection:CGVectorMake(500.0, 0)];
//        } else {
//            [self.gravityBehavior setGravityDirection:CGVectorMake(1, 0)];
//            [self.dynamicItemBehavior setElasticity:0.5];
//            [self.pushBehavior setPushDirection:CGVectorMake([gesture velocityInView:gesture.view].y, 0)];
//        }
//    }
//
//
//}

@end
