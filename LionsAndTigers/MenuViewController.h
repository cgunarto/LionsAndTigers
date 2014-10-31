//
//  MenuViewController.h
//  LionsAndTigers
//
//  Created by CHRISTINA GUNARTO on 10/30/14.
//  Copyright (c) 2014 Christina Gunarto. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HUDDelegate <NSObject>


@end

@interface MenuViewController : UIViewController

@property (nonatomic, weak) id <HUDDelegate> delegate;

- (void)tigersButtonTapped;
- (void)linesButtonTapped;

@end
