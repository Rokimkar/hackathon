//
//  AddWishViewController.h
//  ImagePickerProject
//
//  Created by Kunal Chelani on 10/10/15.
//  Copyright © 2015 til. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NMRangeSlider.h"
#import "Product.h"
typedef enum {
    kSeller,
    kBuyer
}UserType;

@interface AddWishViewController : UIViewController

-(instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andDataArray:(Product*)queryProduct;


@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *decTextView;
@property (weak, nonatomic) IBOutlet UITextField *qtyTextField;
@property (weak, nonatomic) IBOutlet NMRangeSlider *priceSlider;
@property (weak, nonatomic) IBOutlet UICollectionView *imagesCollView;
@property (weak, nonatomic) IBOutlet UIButton *postLabel;
@property (weak, nonatomic) IBOutlet UILabel *lowerRange;
@property (weak, nonatomic) IBOutlet UILabel *higherRange;
@property (weak, nonatomic) IBOutlet UIButton *categoryBtn;
@property (weak, nonatomic) IBOutlet UILabel *priceDummyLabel;
@property (weak, nonatomic) IBOutlet UITextField *priceTextField;

@property (strong,nonatomic) Product *product;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *changingConstraint;

@end
