//
//  EditResumeViewController.m
//  Resume
//
//  Created by OkSeJu on 1/21/15.
//  Copyright (c) 2015 com.fsoft.Resume. All rights reserved.
//

#import "EditResumeViewController.h"

@interface EditResumeViewController ()

@end

@implementation EditResumeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _tableItems = [[NSMutableArray alloc] initWithObjects:@"Persional infomation", @"Cover letter", @"Photo", @"Objectives", @"Work experience", @"Education", @"Skills", @"References", nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) prefersStatusBarHidden{
    return YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)resturnClicked:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
    //[self presentViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"ResumePreview"] animated:YES completion:nil];
}

#pragma mark - Table view datasource and delegate methods
    
- (NSInteger)numberOfSectionsInTableView:(UITableView *)aTableView {
        // Number of sections is the number of regions
        return 1;
}
    
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
     return _tableItems.count;
}
    
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
        /*
         To illustrate the effect of highlighting the cell, don't set the selection style to None in the storyboard, instead implement this method to immediately deselect the cell.
         */
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSInteger selectid = indexPath.row;
    ORSViewController *target;
    switch (selectid) {
        case 0:
            [self presentViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"PersionalInfo"] animated:YES completion:nil];
            break;
        case 3:
            target = [self.storyboard instantiateViewControllerWithIdentifier:@"ORSCommon"];
            target.receiveString = @"Objectives";
            [self presentViewController:target animated:YES completion:nil];
            break;
        case 6:
            target = [self.storyboard instantiateViewControllerWithIdentifier:@"ORSCommon"];
            target.receiveString = @"Skills";
            [self presentViewController:target animated:YES completion:nil];
            break;
        case 7:
            target = [self.storyboard instantiateViewControllerWithIdentifier:@"ORSCommon"];
            target.receiveString = @"References";
            [self presentViewController:target animated:YES completion:nil];
            break;
        case 4:
            [self presentViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"WorkExperience"] animated:YES completion:nil];
            break;
        case 5:
            [self presentViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"Education"] animated:YES completion:nil];
        default:
            break;
    }
}
    
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cell ID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if( cell == nil ){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    [cell.textLabel setText:[_tableItems objectAtIndex:indexPath.row]];
    return cell;
}

@end
