//
//  AddWishViewController.h
//  ImagePickerProject
//
//  Created by Kunal Chelani on 10/10/15.
//  Copyright © 2015 til. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NMRangeSlider.h"

typedef enum {
    kSeller,
    kBuyer
}UserType;

@interface AddWishViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *decTextView;
@property (weak, nonatomic) IBOutlet UITextField *qtyTextField;
@property (weak, nonatomic) IBOutlet NMRangeSlider *priceSlider;
@property (weak, nonatomic) IBOutlet UICollectionView *imagesCollView;
@property (weak, nonatomic) IBOutlet UIButton *postLabel;
@property (weak, nonatomic) IBOutlet UILabel *lowerRange;
@property (weak, nonatomic) IBOutlet UILabel *higherRange;



@end