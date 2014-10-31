//
//  MenuViewController.m
//  LionsAndTigers
//
//  Created by CHRISTINA GUNARTO on 10/30/14.
//  Copyright (c) 2014 Christina Gunarto. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

//#pragma mark - methods
//
//- (void)tigersButtonTapped
//{
//
//}
//
//- (void)lionsButtonTapped
//{
//   
//}

#pragma mark - buttons

- (IBAction)onLionsButtonPressed:(UIButton *)sender
{
    [self.delegate lionsButtonTapped];
}

- (IBAction)onTigersButtonPresed:(UIButton *)sender
{
    [self.delegate tigersButtonTapped];
}

@end
