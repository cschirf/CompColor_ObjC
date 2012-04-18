//
//  ColourCalculator.h
//  ComplementaryColourPicker
//
//  Created by Courtney Schirf on 21/02/2012.
//  Copyright Courtney Schirf. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface ColourCalculator : NSObject 
{
	IBOutlet NSColorWell *primary;
	IBOutlet NSImageView *complementary;
	IBOutlet NSTextField *tmpTextField;
	int width;
	int height;
}

- (IBAction)click:(id)sender;
- (int)width;
- (int)height;
- (void)setWidth:(int)w;
- (void)setHeight:(int)h;

@end
