//
//  BestServiceViewController.m
//  Resume
//
//  Created by OkSeJu on 1/20/15.
//  Copyright (c) 2015 com.fsoft.Resume. All rights reserved.
//

#import "BestServiceViewController.h"

@interface BestServiceViewController ()

@end

@implementation BestServiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
 // _resumeController = [[ResumeViewController alloc] init];
//    _purchaseController = [[PurchaseViewController alloc] init];
    self.tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toJob)];
    [self.betterJob setUserInteractionEnabled:YES];
    [self.betterJob addGestureRecognizer:self.tap1];
    
    self.tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toPurchase)];
    [self.letsGo setUserInteractionEnabled:YES];
    [self.letsGo addGestureRecognizer:self.tap2];
}

- (BOOL) prefersStatusBarHidden{
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) toJob{
//    [self.navigationController pushViewController:_resumeController animated:YES];
    [self presentViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"ResumePreview"] animated:YES completion:nil];
}

- (void) toPurchase{
//    [self.navigationController pushViewController:_purchaseController animated:YES];
    [self presentViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"Purchase"] animated:YES completion:nil];
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
