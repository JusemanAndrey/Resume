//
//  ViewController.m
//  Resume
//
//  Created by Juseman on 1/20/15.
//  Copyright (c) 2015 com.fsoft.Resume. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) prefersStatusBarHidden{
    return YES;
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self presentViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"ResumePreview"] animated:YES completion:nil];
}

- (IBAction) unwindToThisViewController: (UIStoryboardSegue *) unwindSegue
{
    
}

@end
