//
//  ProductDescriptionTableViewCell.m
//  gotg
//
//  Created by Kunal Chelani on 6/24/15.
//  Copyright (c) 2015 til. All rights reserved.
//

#import "ProductDescriptionTableViewCell.h"
@implementation ProductDescriptionTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void) bindDataFor :(Product*) product{
    [self justifyTextWith:product.prodDesc];
}

-(void) justifyTextWith:(NSString*) myText
{
    self.descLabel.numberOfLines = 0;
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = NSTextAlignmentJustified;
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:17.f],
                                 NSBaselineOffsetAttributeName: @0,
                                 NSParagraphStyleAttributeName: paragraphStyle};
    NSAttributedString *attributedText = [[NSAttributedString alloc] initWithString:myText
                                                                         attributes:attributes];
    self.descLabel.attributedText = attributedText;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
