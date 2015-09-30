//
//  ResumeViewController.m
//  Resume
//
//  Created by OkSeJu on 1/21/15.
//  Copyright (c) 2015 com.fsoft.Resume. All rights reserved.
//

#import <stdlib.h>
#import "Global.h"
#import "ResumeViewController.h"
#import "SimpleTableCell.h"

@interface ResumeViewController ()

@property (strong, nonatomic) NSMutableArray *workStrings;//strings
@property (strong, nonatomic) NSMutableArray *educStrings;//strings

@end

@implementation ResumeViewController

NSInteger objectivesCount;
NSInteger skillsCount;
NSInteger referencesCount;
NSInteger addingsCount;
NSInteger workViewCount;
NSInteger educViewCount;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.file_handle = [[FileHandle alloc] init];
/*
    if( IS_IPHONE6 ){ //set every content height
        [self prepareFiles:0];
    }
    else if(IS_IPHONE6){
        [self prepareFiles:1];
    }
    else{
        [self prepareFiles:2];
    }

    [self addScrollView];
 */
}

- (BOOL) prefersStatusBarHidden{
    return YES;
}

-(void) viewDidAppear:(BOOL)animated{
    _workStrings = [[NSMutableArray alloc] init];
    _educStrings = [[NSMutableArray alloc] init];
    [self prepareFiles:2];
}

- (void) insertString:(NSArray *)str_array intoTextView:(UITextView *)textView{
    textView.text = @"";
    for( NSString * each in str_array){
        if( ![each isEqualToString:@""] ){
            textView.text = [textView.text stringByAppendingString:each];
            textView.text = [textView.text stringByAppendingString:@"\n"];
        }
    }
}

-(void) setLabelText:(UILabel*)target withText:(NSString *)text{
    target.text = text;
}

-(NSString *)getLabelText:(UILabel*)target{
    return [target text];
}

-(void) setContentText:(UITextView*)target withText:(NSString *)textarray{
    [target setText:@""];
    [target setText:textarray];
}

-(NSArray *)getContentText:(UITextView*)target{
    NSString *total = [target text];
    NSArray *lines = [total componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"\n"]];
    return lines;
}

- (void) prepareFiles:(int)index{ // get every row count in file 0 - 5, 1 - 6, 2 - 6+
    NSArray *persionalinfo = [[self file_handle] getContents:@"persionalinfo.txt"];    
    self.name.text = [persionalinfo objectAtIndex:0];
    self.email.text = [[NSString stringWithFormat:@"e: "] stringByAppendingString:[persionalinfo objectAtIndex:1]];
    self.phonenumber.text = [[NSString stringWithFormat:@"p: "] stringByAppendingString:[persionalinfo objectAtIndex:2]];
    self.address.text = [[NSString stringWithFormat:@"a: "] stringByAppendingString:[persionalinfo objectAtIndex:3]];
    
    NSArray *objectives = [[self file_handle] getContents:@"objectives.txt"];
    objectivesCount = [objectives count];
    [self insertString:objectives intoTextView:self.objectives];
//    itselfContentHeight[0] = objectivesCount*20;
    
    NSArray *skill  = [[self file_handle] getContents:@"skills.txt"];
    skillsCount = [skill count];
    [self insertString:skill intoTextView:self.skills];
//    itselfContentHeight[3] = skillsCount*20;
    
    NSArray *references  = [[self file_handle] getContents:@"references.txt"];
    [self insertString:references intoTextView:self.references];
    referencesCount = [references count];
//    itselfContentHeight[4] = referencesCount*20;
    
    NSArray *workexperience  = [[self file_handle] getContents:@"workexperience.txt"];
    NSString *prefix = @"", *suffix = @"";
    BOOL on = false;
    int cnt = 0;
    int loop = 0;
    
    for( NSString * each in workexperience){
        if([each hasPrefix:@"-"]){
            suffix = [suffix stringByAppendingString:[each substringFromIndex:1]];
            suffix = [suffix stringByAppendingString:@"\n"];
            cnt++;
            on = true;
        }
        else{
            if( on ){
                prefix = [prefix substringFromIndex:3];
                prefix = [prefix stringByAppendingString:suffix];
                [_workStrings addObject:prefix];
                prefix = @"";
                suffix = @"";
                cnt = 0;
                on = false;
                loop++;
            }
            if(![each isEqualToString:@""]) {
                prefix = [prefix stringByAppendingString:each];
                prefix = [prefix stringByAppendingString:@"\n"];
            }
        }
    }
    
    NSString *all = @"";
    workViewCount = loop;
    int number = 1;
    for( NSString *each in _workStrings){// add one by one.
        NSArray *atotal = [each componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"\n"]];
        int  rep = 0;
        NSString * temp1 = @"", * temp2 = @"";
        for( NSString *every in atotal){
            if (![every isEqualToString:@""]) {
                if(rep == 0){
                    temp1 = [temp1 stringByAppendingString:[@(number) stringValue]];
                    temp1 = [temp1 stringByAppendingString:@". "];
                    temp1 = [temp1 stringByAppendingString:every];
                    temp1 = [temp1 stringByAppendingString:@"  "];
                }
                else if (rep == 1){
                    temp1 = [temp1 stringByAppendingString:every];
                    temp1 = [temp1 stringByAppendingString:@"\n"];
                }
                else{
                    if( rep > 1){
                        temp2 = [temp2 stringByAppendingString:@"          "];
                        temp2 = [temp2 stringByAppendingString:every];
                        temp2 = [temp2 stringByAppendingString:@"\n"];
                    }
                }
            }
            rep++;
        }
        temp1 = [temp1 stringByAppendingString:temp2];
        all = [all stringByAppendingString:temp1];
        number++;
    }
    [self setContentText:_workContents withText:all];
    
    NSArray *education  = [[self file_handle] getContents:@"education.txt"];
    prefix = @"", suffix = @"";
    on = false;
    cnt = 0;
    loop = 0;
    
    for( NSString * each in education){
        if([each hasPrefix:@"-"]){
            suffix = [suffix stringByAppendingString:[each substringFromIndex:1]];
            suffix = [suffix stringByAppendingString:@"\n"];
            cnt++;
            on = true;
        }
        else{
            if( on ){
                prefix = [prefix substringFromIndex:3];
                prefix = [prefix stringByAppendingString:suffix];
                [_educStrings addObject:prefix];
                prefix = @"";
                suffix = @"";
                cnt = 0;
                on = false;
                loop++;
            }
            if(![each isEqualToString:@""]) {
                prefix = [prefix stringByAppendingString:each];
                prefix = [prefix stringByAppendingString:@"\n"];
            }
        }
    }
    
    all = @"";
    educViewCount = loop;
    number = 1;
    for( NSString *each in _educStrings){// add one by one.
        NSArray *atotal = [each componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"\n"]];
        int  rep = 0;
        NSString * temp1 = @"", * temp2 = @"";
        for( NSString *every in atotal){
            if (![every isEqualToString:@""]) {
                if(rep == 0){
                    temp1 = [temp1 stringByAppendingString:[@(number) stringValue]];
                    temp1 = [temp1 stringByAppendingString:@". "];
                    temp1 = [temp1 stringByAppendingString:every];
                    temp1 = [temp1 stringByAppendingString:@"  "];
                }
                else if (rep == 1){
                    temp1 = [temp1 stringByAppendingString:every];
                    temp1 = [temp1 stringByAppendingString:@"\n"];
                }
                else{
                    if( rep > 1){
                        temp2 = [temp2 stringByAppendingString:@"          "];
                        temp2 = [temp2 stringByAppendingString:every];
                        temp2 = [temp2 stringByAppendingString:@"\n"];
                    }
                }
            }
            rep++;
        }
        temp1 = [temp1 stringByAppendingString:temp2];
        all = [all stringByAppendingString:temp1];
        number++;
    }
    [self setContentText:_educationContents withText:all];
    
    float wScale, hScale;
    int w1, w2;
    switch( index ){
        case 0://6
            wScale = 375.0f/320.0f;
            hScale = 667.0f/568.0f;
            w1 = 375/3 -5, w2 = 375/3*2 - 10;
            break;
        case 1://6+
            wScale = 414.0f/375.0f;
            hScale = 736.0f/667.0f;
            w1 = 414/3 -5, w2 = 414/3*2 - 10;
            break;
        default://5
            w1 = 320/3 -5, w2 = 320/3*2 - 10;
            break;
    }
/*    next = 5;
    [self.name setFrame:CGRectMake(5,next, w1, 56)];
    next += 56 + 2;
    [self.nameImage setFrame:CGRectMake(5,next, w2, 3)];
    next += 3 + 2;
    [self.email setFrame:CGRectMake(w1 + 5, 5, w2, 20)];
    [self.phonenumber setFrame:CGRectMake(w1 + 5, 25, w2, 20)];
    [self.address setFrame:CGRectMake(w1 + 5, 45, w2, 20)];
    
    [self.objectivesTitle setFrame:CGRectMake(5, next, w1, 20)];
    next += 20 + 2;
    [self.objectiveImage setFrame:CGRectMake(5, next, 375-10, 3)];
    next += 3 + 2;
    [self.objectives setFrame:CGRectMake(w1 + 5, next, w2, itselfContentHeight[0])];
    
    next += itselfContentHeight[0]*20 + 2;
    [self.workTitle setFrame:CGRectMake(5, next, w1, 20)];
    next += 20 + 2;
    [self.workImage setFrame:CGRectMake(5, next, 375 - 10, 3)];
    next += 3 + 2;
    [self.workParentView setFrame:CGRectMake(5, next, w2, itselfContentHeight[1])];
    int sum = 0;
    for( int i = 0; i < workViewCount; i++){
        [_workParentView addSubview:[_worksViews objectAtIndex:i]];
        [[[_worksViews objectAtIndex:i] period] setFrame:CGRectMake(0, sum, w1, 20)];
        [[[_worksViews objectAtIndex:i] title1] setFrame:CGRectMake(w1 + 5, sum, w2, 20)];
        [[[_worksViews objectAtIndex:i] content] setFrame:CGRectMake(w1 + 5, sum + 20, w2, workHeightArray[i]*20)];
        sum += 20 + workHeightArray[i]*20 + 2;
    }
    sum = 0;
    next += itselfContentHeight[1] + 2;
    [self.educTitle setFrame:CGRectMake(5, next, w1, 20)];
    next += 20 + 2;
    [self.educImage setFrame:CGRectMake(5,next, 375 - 10, 3)];
    next += 3 +2;
    [self.educParentView setFrame:CGRectMake(5, next, w2, itselfContentHeight[2])];
    for( int i = 0; i < educViewCount; i++){
        [_educParentView addSubview:[_educsViews objectAtIndex:i]];
        [[[_educsViews objectAtIndex:i] period] setFrame:CGRectMake(0, sum, w1, 20)];
        [[[_educsViews objectAtIndex:i] title1] setFrame:CGRectMake(w1 + 5, sum, w2, 20)];
        [[[_educsViews objectAtIndex:i] content] setFrame:CGRectMake(w1 + 5, sum + 20, w2,educHeightArray[i]*20)];
        sum += 20 + educHeightArray[i]*20 + 2;
    }
    next += itselfContentHeight[2] + 2;
    [self.skillTitle setFrame:CGRectMake(5, next, w1, 20)];
    next += 20 +2;
    [self.skillImage setFrame:CGRectMake(5,next, 375 - 10, 3)];
    next += 3 + 2;
    [self.skills setFrame:CGRectMake(w1+5, next, w2, itselfContentHeight[3])];
    
    next += itselfContentHeight[3]*20 + 2;
    [self.referenceTitle setFrame:CGRectMake(5, next, w1, 20)];
    next += 20 + 2;
    [self.referenceImage setFrame:CGRectMake(5, next, 375 - 10, 3)];
    next += 3 +2;
    [self.references setFrame:CGRectMake(w1 + 5, next, w2, itselfContentHeight[4])];
    _BackScrollView.minimumZoomScale = 0.5;
    _BackScrollView.maximumZoomScale = 3;
    _BackScrollView.delegate = self;
    [_BackScrollView addSubview:_workParentView];
    [_BackScrollView addSubview:_educParentView];
    [self.view addSubview:_BackScrollView];
 */
}

-(NSMutableData *)createPDFDatafromUIView
{
    // Creates a mutable data object for updating with binary data, like a byte array
    NSMutableData *pdfData = [NSMutableData data];
    // Points the pdf converter to the mutable data object and to the UIView to be converted
    UIGraphicsBeginPDFContextToData(pdfData, [self BackScrollView].bounds, nil);
    UIGraphicsBeginPDFPage();
    CGContextRef pdfContext = UIGraphicsGetCurrentContext();
    
    // draws rect to the view and thus this is captured by UIGraphicsBeginPDFContextToData
    
    [[self BackScrollView].layer renderInContext:pdfContext];
    
    // remove PDF rendering context
    UIGraphicsEndPDFContext();
    
    return pdfData;
}


-(NSString*)createPDF:(NSString*)pdffile
{
    // Creates a mutable data object for updating with binary data, like a byte array
    NSMutableData *pdfData = [self createPDFDatafromUIView];
    
    // Retrieves the document directories from the iOS device
    NSArray* documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES);
    
    NSString* documentDirectory = [documentDirectories objectAtIndex:0];
    NSString* documentDirectoryFilename = [documentDirectory stringByAppendingPathComponent:pdffile];
    
    // instructs the mutable data object to write its context to a file on disk
    [pdfData writeToFile:documentDirectoryFilename atomically:YES];
    NSLog(@"documentDirectoryFileName: %@",documentDirectoryFilename);
    return documentDirectoryFilename;
}

- (IBAction)editButtonClicked:(id)sender{
    [self presentViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"EditResume"] animated:YES completion:nil];
}

- (IBAction)doneButtonClicked:(id)sender{
    SendResultViewController *target= [self.storyboard instantiateViewControllerWithIdentifier:@"SendResult"];
    target.pdfname = [self createPDF:@"send.pdf"];
    [self presentViewController:target animated:YES completion:nil];
//    [self presentViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"SendResult"] animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
