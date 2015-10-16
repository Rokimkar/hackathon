//
//  AddWishViewController.m
//  ImagePickerProject
//
//  Created by Kunal Chelani on 10/10/15.
//  Copyright © 2015 til. All rights reserved.
//

#import "AddWishViewController.h"
#import "ImagesCollectionViewCell.h"
#import "WYPopoverController.h"
#import "LeftDeckViewController.h"
#import "CategoryTableViewController.h"
#import "Prefix.pch"
#import "HackathonAppManager.h"
#define IMAGES_ALLOWED 3

@interface AddWishViewController ()<UITextFieldDelegate,UITextViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate,CategoryViewControllerDelegate,WYPopoverControllerDelegate>{
    
    NSMutableArray *imagesArray;
    UserType userType;
    WYPopoverController *settingsPopoverController;
    NSString *queryTitle;
    
}
@end

@implementation AddWishViewController


-(instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andDataArray:(Product*)queryProduct{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        queryTitle = queryProduct.title;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.product=[[Product alloc] init];
    imagesArray = [[NSMutableArray alloc] init];
    userType = kBuyer;
    [self setLayout];
    [self configureLabelSlider];
    
    [self.titleTextField.layer setBorderColor:RGBA(217, 218, 216, 1.0).CGColor];
    [self.titleTextField.layer setBorderWidth:1.0];
    [self.titleTextField.layer setCornerRadius:5.0];
    [self.decTextView.layer setBorderColor:RGBA(217, 218, 216, 1.0).CGColor];
    [self.decTextView.layer setBorderWidth:1.0];
    [self.decTextView.layer setCornerRadius:5.0];

    [self.qtyTextField.layer setBorderColor:RGBA(217, 218, 216, 1.0).CGColor];
    [self.qtyTextField.layer setBorderWidth:1.0];
    [self.qtyTextField.layer setCornerRadius:5.0];

    [self.categoryBtn.layer setBorderColor:RGBA(217, 218, 216, 1.0).CGColor];
    [self.categoryBtn.layer setBorderWidth:1.0];
    [self.categoryBtn.layer setCornerRadius:5.0];

    [self.postLabel.layer setBorderColor:[UIColor blueColor].CGColor];
    [self.postLabel.layer setBorderWidth:1.0];
    [self.postLabel.layer setCornerRadius:5.0];

    [self.imagesCollView.layer setBorderColor:RGBA(217, 218, 216, 1.0).CGColor];
    [self.imagesCollView.layer setBorderWidth:1.0];
    [self.imagesCollView.layer setCornerRadius:5.0];
    
    if (queryTitle && ![queryTitle isEqualToString:@""]) {
        self.titleTextField.text=queryTitle;
        self.product.title=queryTitle;
    }
    // Do any additional setup after loading the view from its nib.
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.priceSlider setUpperValue:40000];
    [self.priceSlider setLowerValue:9999];
    [self updateSliderLabels];
    
    if ([HackathonAppManager sharedInstance].appUserType==kSeller) {
        self.priceDummyLabel.text=@"Price:";
        [self.postLabel setTitle:@"Respond" forState:UIControlStateNormal];
        [self.postLabel setTitle:@"Respond" forState:UIControlStateHighlighted];
    }
    else{
        self.priceDummyLabel.text=@"Price Range:";
        [self.postLabel setTitle:@"Add Wish" forState:UIControlStateNormal];
        [self.postLabel setTitle:@"Add Wish" forState:UIControlStateHighlighted];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITextFieldMethods

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
    if (textField.tag==101) {
        self.product.title=textField.text;
    }
    else if (textField.tag==201){
        self.product.quantity=[textField.text intValue];
    }
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    if (textField.tag==101) {
        self.product.title=textField.text;
    }
    else if (textField.tag==201){
        self.product.quantity=[textField.text intValue];
    }

    return YES;
    
}
#pragma mark UITextViewMethods

- (void)textViewDidBeginEditing:(UITextView *)textView{
    
}
- (void)textViewDidEndEditing:(UITextView *)textView{
    self.product.prodDesc=textView.text;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
    }
    return YES;
}

#pragma mark Slider methods
- (void) configureLabelSlider
{
    self.priceSlider.minimumValue = 100;
    self.priceSlider.maximumValue = 99999;
}
- (IBAction)labelSliderChanged:(id)sender {
    [self updateSliderLabels];
}
- (void) updateSliderLabels
{
    self.lowerRange.text = [NSString stringWithFormat:@"₹ %d", (int)self.priceSlider.lowerValue];
    self.higherRange.text = [NSString stringWithFormat:@"₹ %d", (int)self.priceSlider.upperValue];
}

#pragma mark UICollectionViewMethods

-(void) setLayout{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(90, 90);
    [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    layout.minimumLineSpacing = 5;
    layout.minimumInteritemSpacing = 5;
    self.imagesCollView.collectionViewLayout=layout;
    [self.imagesCollView registerNib:[UINib nibWithNibName:@"ImagesCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"ImagesCollectionViewCell"];
    [self.imagesCollView setBackgroundColor:[UIColor clearColor]];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (imagesArray.count<IMAGES_ALLOWED) {
        return imagesArray.count+1;
    }
    else{
        return imagesArray.count;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ImagesCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ImagesCollectionViewCell" forIndexPath:indexPath];
    if (indexPath.row<imagesArray.count) {
        cell.imgView.image = [imagesArray objectAtIndex:indexPath.row];
    }
    [cell.layer setBorderColor:RGBA(217, 218, 216, 1.0).CGColor];
    [cell.layer setBorderWidth:1.0];
    [cell.layer setCornerRadius:5.0];

    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSInteger rows = [collectionView numberOfItemsInSection:indexPath.section];
    if (indexPath.row == rows-1 && imagesArray.count<IMAGES_ALLOWED) {
        [self startImagePicking];
    }
    
}

#pragma mark ImagePicker methods

-(void) startImagePicking{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Select Image" delegate:self cancelButtonTitle:@"From Photo Library" otherButtonTitles:@"From Camera", nil];
    alert.tag=101;
    [alert show];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{

    if (alertView.tag==101) {
        if (buttonIndex==0) {
            UIImagePickerController *picker = [[UIImagePickerController alloc] init];
            picker.delegate = self;
            picker.allowsEditing = YES;
            //        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            [self presentViewController:picker animated:YES completion:^{
                
            }];
        }
        else{
            if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                
                UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                      message:@"Device has no camera"
                                                                     delegate:nil
                                                            cancelButtonTitle:@"OK"
                                                            otherButtonTitles: nil];
                
                [myAlertView show];
                
            }
            else{
            UIImagePickerController *picker = [[UIImagePickerController alloc] init];
            picker.delegate = self;
            picker.allowsEditing = YES;
            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            [self presentViewController:picker animated:YES completion:^{
                
            }];
            }
        }
    }
    else if (alertView.tag==303){
        if (buttonIndex==0) {
            self.product.type=@"Exactly Same";
        }
        else{
            self.product.type=@"Similar";
        }
        [self moveToPost];
    }
    else if (alertView.tag==404){
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    [imagesArray addObject:chosenImage];
    [picker dismissViewControllerAnimated:YES completion:NULL];
    [self.imagesCollView reloadData];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}
- (IBAction)catBtnPressed:(id)sender {
    
    
    if (settingsPopoverController.isPopoverVisible) {
        return;
    }
    
    if (settingsPopoverController == nil)
    {
        UIView *btn = (UIView *)sender;
        
        UIStoryboard *storyBoard  = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        CategoryTableViewController *leftDeck = [storyBoard instantiateViewControllerWithIdentifier:@"CategoryTableViewController"];
        leftDeck.delegate = self;
        leftDeck.preferredContentSize = CGSizeMake(110, 135);
        
        leftDeck.modalInPopover = NO;
        
        UINavigationController *contentViewController = [[UINavigationController alloc] initWithRootViewController:leftDeck];
        contentViewController.navigationBarHidden = YES;
        settingsPopoverController = [[WYPopoverController alloc] initWithContentViewController:contentViewController];
        settingsPopoverController.delegate = self;
        settingsPopoverController.passthroughViews = @[btn];
        settingsPopoverController.popoverLayoutMargins = UIEdgeInsetsMake(10, 10, 10, 10);
        settingsPopoverController.wantsDefaultContentAppearance = NO;
        settingsPopoverController.theme.arrowBase = 16;
        settingsPopoverController.theme.arrowHeight = 8;
        [settingsPopoverController presentPopoverFromRect:btn.bounds
                                                   inView:btn
                                 permittedArrowDirections:WYPopoverArrowDirectionAny
                                                 animated:YES
                                                  options:WYPopoverAnimationOptionFadeWithScale];
    }
    else{
        [settingsPopoverController dismissPopoverAnimated:YES completion:^{
            [self popoverControllerDidDismissPopover:settingsPopoverController];
        }];
        
    }
    
}


#pragma mark - WYPopoverControllerDelegate

- (void)popoverControllerDidPresentPopover:(WYPopoverController *)controller{
    //NSLog(@"popoverControllerDidPresentPopover");
    
}

- (BOOL)popoverControllerShouldDismissPopover:(WYPopoverController *)controller{
    return YES;
}

- (void)popoverControllerDidDismissPopover:(WYPopoverController *)controller
{
    
    if (controller == settingsPopoverController)
    {
        settingsPopoverController.delegate = nil;
        settingsPopoverController = nil;
    }
    //NSLog(@"%@",[self inPagePlayerView].settingsButton.titleLabel.text);
    //NSLog(@"%@",[[SettingsManager sharedInstance] getStreamingQualityString]);

}

- (BOOL)popoverControllerShouldIgnoreKeyboardBounds:(WYPopoverController *)popoverController
{
    return YES;
}

- (void)popoverController:(WYPopoverController *)popoverController willTranslatePopoverWithYOffset:(float *)value
{
    // keyboard is shown and the popover will be moved up by 163 pixels for example ( *value = 163 )
    *value = 0; // set value to 0 if you want to avoid the popover to be moved
}

-(void)dismissAfterSelectionWithSelectedString:(NSString*)category{
    [self.categoryBtn setTitle:category forState:UIControlStateNormal];
    [self.categoryBtn setTitle:category forState:UIControlStateHighlighted];
    self.product.category=category;
    if (settingsPopoverController) {
        [settingsPopoverController dismissPopoverAnimated:YES completion:^{
            [self popoverControllerDidDismissPopover:settingsPopoverController];
        }];
    }

}

- (IBAction)postBtnPressed:(id)sender {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Is the product exactly same or smilar to the one queried?" delegate:self cancelButtonTitle:@"Exactly Same" otherButtonTitles:@"Similar", nil];
    alert.tag=303;
    [alert show];
}


-(void) moveToPost{
    self.product.price = [NSString stringWithFormat:@"%@ to %@",self.lowerRange.text,self.higherRange.text ];
    UIAlertView *alertView;
    if ([HackathonAppManager sharedInstance].appUserType==kSeller) {
        alertView = [[UIAlertView alloc] initWithTitle:@"" message:@"Your response has been posted." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    }
    else{
        alertView = [[UIAlertView alloc] initWithTitle:@"" message:@"Your wish has been posted." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    }
    
    alertView.tag=404;
    [alertView show];
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
