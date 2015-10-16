//
//  Product.h
//  ImagePickerProject
//
//  Created by Kunal Chelani on 10/12/15.
//  Copyright © 2015 til. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject

@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *prodDesc;
@property (nonatomic,strong) NSString *price;
@property (nonatomic,strong) NSString *upperPrice;
@property (nonatomic,assign) int quantity;
@property (nonatomic,assign) int prodId;
@property (nonatomic,strong) NSString *category;
@property (nonatomic,strong) NSString *subcategory;
@property (nonatomic,strong) NSString *img1;
@property (nonatomic,strong) NSString *img2;
@property (nonatomic,strong) NSString *img3;
@property (nonatomic,strong) NSString *seller;
@property (nonatomic,strong) NSString *type;


@end
