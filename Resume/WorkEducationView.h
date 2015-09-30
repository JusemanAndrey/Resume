//
//  WorkEducationView.h
//  Resume
//
//  Created by OkSeJu on 1/24/15.
//  Copyright (c) 2015 com.fsoft.Resume. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WorkEducationView : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *period;
@property (strong, nonatomic) IBOutlet UILabel *title1;
@property (strong, nonatomic) IBOutlet UITextView *content;
@property (strong, nonatomic) IBOutlet UISwitch *onoff;

@end
