//
//  ORSViewController.h
//  Resume
//
//  Created by Juseman Andrey on 1/21/15.
//  Copyright (c) 2015 com.fsoft.Resume. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FileHandle.h"

@interface ORSViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *returnButton;
@property (strong, nonatomic) IBOutlet UITextView *contents;
@property (strong, nonatomic) FileHandle *file_handle;
@property (strong, nonatomic) NSString *receiveString;
@property (strong, nonatomic) NSString *thisFile;
@property (nonatomic) UITapGestureRecognizer *tapRecognizer;

- (IBAction)returnClicked:(id)sender;

@end
