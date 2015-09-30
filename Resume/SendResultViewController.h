//
//  SendResultViewController.h
//  Resume
//
//  Created by OkSeJu on 1/21/15.
//  Copyright (c) 2015 com.fsoft.Resume. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface SendResultViewController : UIViewController <MFMailComposeViewControllerDelegate>

@property (strong, nonatomic) IBOutlet UIButton *returnButton;
@property (strong, nonatomic) IBOutlet UIButton *sendButton;
@property (strong, nonatomic) NSString *pdfname;
@property (strong, nonatomic) IBOutlet UITextView *dataTextView;
@property (strong, nonatomic) IBOutlet UITextField *emailTField;
@property (nonatomic) UITapGestureRecognizer *tapRecognizer;

@property (strong, nonatomic) MFMailComposeViewController *mailer;

- (IBAction)returnClicked:(id)sender;

- (IBAction)sendResult:(id)sender;

@end
