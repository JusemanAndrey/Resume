//
//  BestServiceViewController.h
//  Resume
//
//  Created by OkSeJu on 1/20/15.
//  Copyright (c) 2015 com.fsoft.Resume. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ResumeViewController.h"
#import "PurchaseViewController.h"

@interface BestServiceViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *betterJob;
@property (strong, nonatomic) IBOutlet UIImageView *letsGo;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tap1;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tap2;

- (void) toJob;
- (void) toPurchase;

@end
