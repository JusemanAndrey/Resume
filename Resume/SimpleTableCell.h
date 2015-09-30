//
//  SimpleTableCell.h
//  SimpleTable
//
//  Created by Simon Ng on 28/4/12.
//  Copyright (c) 2012 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Global.h"

@interface SimpleTableCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *period;
@property (nonatomic, weak) IBOutlet UILabel *title1;
@property (weak, nonatomic) IBOutlet UITextView *content;

@end
