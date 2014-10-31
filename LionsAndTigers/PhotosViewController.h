//
//  PhotosViewController.h
//  LionsAndTigers
//
//  Created by CHRISTINA GUNARTO on 10/30/14.
//  Copyright (c) 2014 Christina Gunarto. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TopDelegate <NSObject>


@optional
- (void)topRevealButtonTapped;

@end

@interface PhotosViewController : UIViewController
@property (nonatomic, weak) id <TopDelegate> delegate;

//- (void)topRevealButtonTapped;

@end
