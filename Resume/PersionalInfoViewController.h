//
//  PersionalInfoViewController.h
//  Resume
//
//  Created by OkSeJu on 1/21/15.
//  Copyright (c) 2015 com.fsoft.Resume. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FileHandle.h"

@interface PersionalInfoViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *returnButton;
@property (strong, nonatomic) IBOutlet UITextField *nameText;
@property (strong, nonatomic) IBOutlet UITextField *emailText;
@property (strong, nonatomic) IBOutlet UITextField *phoneNumber;
@property (strong, nonatomic) IBOutlet UITextView *addressText;

@property (strong, nonatomic) FileHandle *file_handle;
@property (nonatomic) UITapGestureRecognizer *tapRecognizer;

- (IBAction)returnClicked:(id)sender;

@end
