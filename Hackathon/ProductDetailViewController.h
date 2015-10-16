//
//  ProductDetailViewController.h
//  ImagePickerProject
//
//  Created by Kunal Chelani on 10/12/15.
//  Copyright © 2015 til. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"

@interface ProductDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *detailTableView;
@property (weak,nonatomic) Product *product;
@end
