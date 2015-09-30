//
//  ORSViewController.m
//  Resume
//
//  Created by OkSeJu on 1/21/15.
//  Copyright (c) 2015 com.fsoft.Resume. All rights reserved.
//

#import "ORSViewController.h"

@interface ORSViewController ()

@end

@implementation ORSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *tmp = [self convertStringToTitle:_receiveString];
    [_returnButton setTitle:tmp forState:UIControlStateNormal];
    self.file_handle = [[FileHandle alloc] init];
    [self displayContents:self.thisFile];
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

- (id)convertStringToTitle:(NSString *)givenText{
    NSString *fname;
    if( [givenText isEqualToString:@"Objectives"]){
        fname = @" <          Objectives";
        self.thisFile = @"objectives.txt";
    }
    else if ([givenText isEqualToString:@"Skills"]){
        fname = @" <            Skills";
        self.thisFile = @"skills.txt";
    }
    else{
        fname = @" <          References";
        self.thisFile = @"references.txt";
    }
    return fname;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)displayContents:(NSString *) filename{
    NSArray *objectives = [self.file_handle getContents:filename];
    _contents.text = @"";
    for( NSString * each in objectives){
        if (![each isEqualToString:@""]) {
            _contents.text = [_contents.text stringByAppendingString:each];
            _contents.text = [_contents.text stringByAppendingString:@"\n"];
        }        
    }
}

- (void)finalWrite:(NSString *)filename{
    NSArray *rows = [_contents.text componentsSeparatedByString:@"\n"];
    if ([rows count] > 0 && ![[rows objectAtIndex:0]  isEqual: @""] ) {
        [self.file_handle setContents:filename strings:rows];
    }
}

- (IBAction)returnClicked:(id)sender {
    [self finalWrite:_thisFile];
    [self dismissViewControllerAnimated:true completion:nil];
    //[self presentViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"EditResume"] animated:YES completion:nil];
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
