//
//  ViewController.h
//  Resume
//
//  Created by Juseman on 1/20/15.
//  Copyright (c) 2015 com.fsoft.Resume. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BestServiceViewController.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) BestServiceViewController *bestService;

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;

@end

