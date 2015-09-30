//
//  WorkExperienceViewController.h
//  Resume
//
//  Created by OkSeJu on 1/21/15.
//  Copyright (c) 2015 com.fsoft.Resume. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FileHandle.h"
#import "SimpleTableCell.h"

@interface WorkExperienceViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UIButton *returnButton;
@property (strong, nonatomic) IBOutlet UITableView *dataShowTView;
@property (strong, nonatomic) IBOutlet UIButton *deleteButton;
@property (strong, nonatomic) IBOutlet UIButton *addButton;

@property (strong, nonatomic) FileHandle *file_handle;
@property (nonatomic) UITapGestureRecognizer *tapRecognizer;

- (IBAction)deleteClicked:(id)sender;
- (IBAction)addClicked:(id)sender;
- (IBAction)returnClicked:(id)sender;

@end
