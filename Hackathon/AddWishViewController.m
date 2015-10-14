//
//  AddWishViewController.m
//  ImagePickerProject
//
//  Created by Kunal Chelani on 10/10/15.
//  Copyright © 2015 til. All rights reserved.
//

#import "AddWishViewController.h"
#import "ImagesCollectionViewCell.h"
#define IMAGES_ALLOWED 5

@interface AddWishViewController ()<UITextFieldDelegate,UITextViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate>{
    
    NSMutableArray *imagesArray;
    UserType userType;
}
@end

@implementation AddWishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    imagesArray = [[NSMutableArray alloc] init];
    userType = kBuyer;
    [self setLayout];
    [self configureLabelSlider];
    // Do any additional setup after loading the view from its nib.
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.priceSlider setUpperValue:40000];
    [self.priceSlider setLowerValue:9999];
    [self updateSliderLabels];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITextFieldMethods

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
    
}

#pragma mark UITextViewMethods

- (void)textViewDidBeginEditing:(UITextView *)textView{
    
}
- (void)textViewDidEndEditing:(UITextView *)textView{
    
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
