//
//  Product.m
//  ImagePickerProject
//
//  Created by Kunal Chelani on 10/12/15.
//  Copyright © 2015 til. All rights reserved.
//

#import "Product.h"

@implementation Product


-(id) init
{
    self=[super init];
    if(self)
    {
        
//        self.title=@"";
//        self.prodDesc=@"";
//        self.price=@"";
//        self.upperPrice=@"";
//        self.quantity=0;
//        self.prodId=0;
//        self.category=@"";
//        self.subcategory=@"";
//        self.img1=@"";
//        self.img2=@"";
//        self.img3=@"";
//        self.seller=@"";
//        self.type=@"";
//        self.imagesArray=[[NSArray alloc] init];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [self autoEncodeWithCoder:coder];
    
     [coder encodeObject:self.title forKey:@"title"];
     [coder encodeObject:self.prodDesc forKey:@"prodDesc"];
         [coder encodeObject:self.price forKey:@"price"];
         [coder encodeObject:self.upperPrice forKey:@"upperPrice"];
         [coder encodeObject:[NSNumber numberWithInt:self.quantity] forKey:@"quantity"];
         [coder encodeObject:[NSNumber numberWithInt:self.prodId] forKey:@"prodId"];
         [coder encodeObject:self.category forKey:@"category"];
         [coder encodeObject:self.subcategory forKey:@"subcategory"];
         [coder encodeObject:self.img1 forKey:@"img1"];
         [coder encodeObject:self.img2 forKey:@"img2"];
             [coder encodeObject:self.img3 forKey:@"img3"];
             [coder encodeObject:self.seller forKey:@"seller"];
             [coder encodeObject:self.type forKey:@"type"];
             [coder encodeObject:self.imagesArray forKey:@"imagesArray"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        [self autoDecode:aDecoder];
        
        
        self.title = [aDecoder decodeObjectForKey:@"title"];
        self.prodDesc = [aDecoder decodeObjectForKey:@"prodDesc"];
        self.price = [aDecoder decodeObjectForKey:@"price"];
        self.upperPrice = [aDecoder decodeObjectForKey:@"upperPrice"];
        if ([[aDecoder decodeObjectForKey:@"quantity"] isKindOfClass:[NSNumber class]]) {
            self.quantity = [[aDecoder decodeObjectForKey:@"quantity"] intValue];
        }
        if ([[aDecoder decodeObjectForKey:@"prodId"] isKindOfClass:[NSNumber class]]) {
            self.prodId = [[aDecoder decodeObjectForKey:@"prodId"] intValue];
        }
        self.category = [aDecoder decodeObjectForKey:@"category"];
        self.subcategory = [aDecoder decodeObjectForKey:@"subcategory"];
        self.img1 = [aDecoder decodeObjectForKey:@"img1"];
        self.img2 = [aDecoder decodeObjectForKey:@"img2"];
        self.img3 = [aDecoder decodeObjectForKey:@"img3"];
        self.seller = [aDecoder decodeObjectForKey:@"seller"];
        self.type = [aDecoder decodeObjectForKey:@"type"];
        self.imagesArray = [aDecoder decodeObjectForKey:@"imagesArray"];
    }
    return self;
}

@end
