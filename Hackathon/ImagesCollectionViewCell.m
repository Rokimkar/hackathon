//
//  ImagesCollectionViewCell.m
//  ImagePickerProject
//
//  Created by Kunal Chelani on 10/10/15.
//  Copyright © 2015 til. All rights reserved.
//

#import "ImagesCollectionViewCell.h"

@implementation ImagesCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
    
    [self.imgView setImage:[self resizeImage:[UIImage imageNamed:@"addIcon.png"] toSize:CGSizeMake(40, 40)]];
    [self.imgView setContentMode:UIViewContentModeCenter];
    
}


-(UIImage *) resizeImage : (UIImage *)image toSize :(CGSize)rect {
    UIGraphicsBeginImageContextWithOptions(rect, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, rect.width, rect.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}


@end
