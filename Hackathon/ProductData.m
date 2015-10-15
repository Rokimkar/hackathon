//
//  ProductData.m
//  Hackathon
//
//  Created by Kunal Chelani on 10/15/15.
//  Copyright (c) 2015 Sanchit Kumar Singh. All rights reserved.
//

#import "ProductData.h"
#import "Product.h"
@implementation ProductData

- (void) fetchDataFor:(NSString*)category withSuccess:(void (^) (NSMutableArray *data))success failure:(void (^) (NSError *error)) failure{
    
    NSError *deserializingError;
    NSString *path = [[NSBundle mainBundle] bundlePath];
    NSString *finalPath = [path stringByAppendingPathComponent:@"prods.json"];
    NSURL *localFileURL = [NSURL fileURLWithPath:finalPath];
    NSData *contentOfLocalFile = [NSData dataWithContentsOfURL:localFileURL];
    id object = [NSJSONSerialization JSONObjectWithData:contentOfLocalFile
                                                options:NSJSONReadingMutableContainers
                                                  error:&deserializingError];
    if (deserializingError) {
        failure(deserializingError);
    }
    else
    {
        success([self getDataFrom:[object valueForKey:@"items"] forCategory:category]);
    }
}



-(NSMutableArray*) getDataFrom:(id)dataObject forCategory:(NSString*)category
{
    NSMutableArray *dataArray = [[NSMutableArray alloc] init];
    for (NSMutableDictionary *prodObj in dataObject) {
        if ([[prodObj objectForKey:@"category"] isEqualToString:category]) {
            [dataArray addObject:[self mapWith:prodObj]];
        }
    }
    return dataArray;
}

-(Product*) mapWith:(NSMutableDictionary*)prodObj{
    Product *product = [[Product alloc] init];
    product.title = [prodObj objectForKey:@"title"];
    product.prodDesc = [prodObj objectForKey:@"prodDesc"];
    product.price = [prodObj objectForKey:@"price"];
    product.quantity = [[prodObj objectForKey:@"quantity"] intValue];
    product.prodId = [[prodObj objectForKey:@"prodId"] intValue];
    product.category = [prodObj objectForKey:@"category"];
    product.subcategory = [prodObj objectForKey:@"subcategory"];
    product.img1 = [prodObj objectForKey:@"img1"];
    product.img2 = [prodObj objectForKey:@"img2"];
    product.img3 = [prodObj objectForKey:@"img3"];
    return product;
}

@end
