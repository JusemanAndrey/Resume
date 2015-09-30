//
//  ResumeViewController.h
//  Resume
//
//  Created by Juseman on 1/21/15.
//  Copyright (c) 2015 com.fsoft.Resume. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "FileHandle.h"
#import "SimpleTableCell.h"
#import "SendResultViewController.h"

@interface ResumeViewController : UIViewController <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *BackScrollView;
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UIImageView *nameImage;
@property (strong, nonatomic) IBOutlet UILabel *email;
@property (strong, nonatomic) IBOutlet UILabel *phonenumber;
@property (strong, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UILabel *objectivesTitle;
@property (weak, nonatomic) IBOutlet UIImageView *objectiveImage;
@property (strong, nonatomic) IBOutlet UITextView *objectives;
@property (weak, nonatomic) IBOutlet UILabel *workTitle;
@property (weak, nonatomic) IBOutlet UIImageView *workImage;
@property (weak, nonatomic) IBOutlet UITextView *workContents;
@property (weak, nonatomic) IBOutlet UILabel *educTitle;
@property (weak, nonatomic) IBOutlet UIImageView *educImage;
@property (weak, nonatomic) IBOutlet UITextView *educationContents;
@property (weak, nonatomic) IBOutlet UILabel *skillTitle;
@property (weak, nonatomic) IBOutlet UIImageView *skillImage;
@property (strong, nonatomic) IBOutlet UITextView *skills;
@property (weak, nonatomic) IBOutlet UILabel *referenceTitle;
@property (weak, nonatomic) IBOutlet UIImageView *referenceImage;
@property (strong, nonatomic) IBOutlet UITextView *references;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneBtn;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *editBtn;

@property (strong, nonatomic) FileHandle *file_handle;

- (IBAction)editButtonClicked:(id)sender;
- (IBAction)doneButtonClicked:(id)sender;

@end
