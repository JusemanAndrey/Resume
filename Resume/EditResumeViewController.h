//
//  EditResumeViewController.h
//  Resume
//
//  Created by OkSeJu on 1/21/15.
//  Copyright (c) 2015 com.fsoft.Resume. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FileHandle.h"
#import "ORSViewController.h"

@interface EditResumeViewController : UIViewController
<UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UIButton *returnButton;
@property (strong, nonatomic) IBOutlet UITableView *editTableView;
@property (strong, nonatomic) NSMutableArray *tableItems;

- (IBAction)resturnClicked:(id)sender;

@end
