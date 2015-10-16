//
//  ProductRepo.h
//  Hackathon
//
//  Created by Kunal Chelani on 10/17/15.
//  Copyright © 2015 Sanchit Kumar Singh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+NSCoding.h"


@interface ProductRepo : NSObject<NSCoding>


@property (nonatomic,strong) NSMutableArray* prodsArray;

@end
