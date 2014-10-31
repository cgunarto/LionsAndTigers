//
//  RootViewController.m
//  LionsAndTigers
//
//  Created by CHRISTINA GUNARTO on 10/30/14.
//  Copyright (c) 2014 Christina Gunarto. All rights reserved.
//

#import "RootViewController.h"
#import "PhotosViewController.h"

@interface RootViewController () <TopDelegate>
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftPhotosConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightPhotosConstraint;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"%f", self.leftPhotosConstraint.constant);
}

-(void)topRevealButtonTapped
{
    self.leftPhotosConstraint.constant = 500.0;
    self.rightPhotosConstraint.constant = 500.0;
}



@end
