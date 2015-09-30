//
//  PurchaseViewController.h
//  Resume
//
//  Created by OkSeJu on 1/21/15.
//  Copyright (c) 2015 com.fsoft.Resume. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PurchaseViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *purchaseReturnButton;
@property (strong, nonatomic) IBOutlet UITableView *productsListTable;
@property (strong, nonatomic) IBOutlet UITableView *infoProductTable;

@property (strong, nonatomic) IBOutlet UITextField *addProduct;
@property (strong, nonatomic) IBOutlet UIButton *addButton;
@property (strong, nonatomic) IBOutlet UIButton *buyButton;

@property (nonatomic) UITapGestureRecognizer *tapRecognizer;

- (IBAction)buttonClick:(id)sender;
- (IBAction)addClick:(id)sender;
- (IBAction)buyClick:(id)sender;

@end
