//
//  SendResultViewController.m
//  Resume
//
//  Created by OkSeJu on 1/21/15.
//  Copyright (c) 2015 com.fsoft.Resume. All rights reserved.
//

#import "SendResultViewController.h"


@interface SendResultViewController() 

@end

@implementation SendResultViewController

@synthesize pdfname = _pdfname;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapAnywhere:)];
    _tapRecognizer.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:_tapRecognizer];
}

- (void) didTapAnywhere:(UITapGestureRecognizer*)sender{
    [self.view endEditing:YES];
}

- (BOOL) prefersStatusBarHidden{
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)returnClicked:(id)sender {
    [self presentViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"ResumePreview"] animated:YES completion:nil];
}

- (IBAction)sendResult:(id)sender {
    if ([MFMailComposeViewController canSendMail])
    {
        _mailer = [[MFMailComposeViewController alloc] init];
        _mailer.mailComposeDelegate = self;
        NSString *emailBody = [self dataTextView].text;
        NSData *data=[NSData dataWithContentsOfFile:_pdfname];
        if ( ![self NSStringIsValidEmail:[_emailTField text]]) {
            [self myAlert:@"Correct email spell!"];
            return;
        }
        NSArray *toRecipents = [NSArray arrayWithObject:[_emailTField text]];
        [_mailer setSubject:@"My resume"];
        [_mailer setMessageBody:emailBody isHTML:NO];
        [_mailer addAttachmentData:data mimeType:@"pdf" fileName:@"resume.pdf"];
        [_mailer setToRecipients:[toRecipents objectAtIndex:0]];
        //[mailer setToRecipients:[NSArray arrayWithObject:[_emailTField text]]];
        
        [self presentViewController:_mailer animated:YES completion:nil];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failure"message:@"Your device doesn't support the composer sheet"delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
    
//    [self presentViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"BestService"] animated:YES completion:nil];
}

-(BOOL) NSStringIsValidEmail:(NSString *)checkString
{
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}

- (void) myAlert:(NSString *)errorMessage{
    UIAlertView *myAlert = [[UIAlertView alloc] initWithTitle:errorMessage message:@"Write correct email" delegate:self cancelButtonTitle:nil otherButtonTitles:@"ok", nil];
    myAlert.cancelButtonIndex = -1;
    [myAlert setTag:1000];
    [myAlert show];
}

#pragma mark - mail compose delegate
- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
        {
            NSLog(@"Mail cancelled: you cancelled the operation and no email message was queued.");
            break;
        }
        case MFMailComposeResultSaved:
        {
            NSLog(@"Mail saved: you saved the email message in the drafts folder.");
            break;
        }
        case MFMailComposeResultSent:
        {
            NSLog(@"Mail send: the email message is queued in the outbox. It is ready to send.");
            break;
        }
        case MFMailComposeResultFailed:
        {
            NSLog(@"Mail failed: the email message was not saved or queued, possibly due to an error.");
            break;
        }
        default:
            NSLog(@"Mail not sent.");
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
