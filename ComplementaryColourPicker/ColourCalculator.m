//
//  ColourCalculator.m
//  ComplementaryColourPicker
//
//  Created by Courtney Schirf on 21/02/2012.
//  Copyright Courtney Schirf. All rights reserved.
//

#import "ColourCalculator.h"


@implementation ColourCalculator

- (id) init
{
	NSLog(@"In the init method!");
	
	//Set the height and width of the colour well
	self.width = 44;
	self.height = 23;
	
	NSLog(@"Width: %i", self.width);
	NSLog(@"Height: %i", self.height);
	
	
	//Set the primary colour well
	[primary deactivate];
	BOOL isPrimActive = [primary isActive];
	NSLog(isPrimActive ? @"primary is active" : @"complementary is inactive");
	
	
	//Set up the complementary image well
	[complementary setEditable:NO];
	
	//Set the image to a default color
	NSImage *image = [[NSImage alloc] initWithSize:NSMakeSize(25, 25)];
	[image lockFocus];
	[[NSColor redColor] setFill];
	[NSBezierPath fillRect:NSMakeRect(0, 0, 25, 25)];
	[image setBackgroundColor:[NSColor redColor]];
	[image unlockFocus]; 
	[complementary setImage: image];
	
	//syntax cheatsheet:
	// [obj method1: input1 method2: input2]
	
	return self;
}

- (int) width
{
	return 44;
}

- (int) height
{
	return 23;
}

- (void) setWidth:(int)w
{
	width = w;
}

- (void) setHeight:(int)h
{
	height = h;
}

- (IBAction)click:(id)sender;
{	
	NSLog(@"In the click method.");
	
	NSString *tmp = [tmpTextField stringValue];
	NSLog(@"Tmp has: %@", tmp);
	
	NSLog(@"Grabbing color from 'primary'");
	
	NSColor *primaryColor = [primary color];
	
	//Get the Hue, Saturation, Brightness/Luminosity
	float pH = [primaryColor hueComponent];
	float pS = [primaryColor saturationComponent];
	float pB = [primaryColor brightnessComponent];
	
	NSLog(@"Primary colour's 'H' value: %.2f",pH);
	NSLog(@"Primary colour's 'S' value: %.2f",pS);
	NSLog(@"Primary colour's 'B' value: %.2f",pB);
	
	// Calculate the opposite hue (180 degrees opposite)
	float cH = (pH + 0.5);

	if (cH > 1)
		cH -= 1;
	
	// Create the complementary colour
	NSLog(@"Complementary colour's 'H' value: %.2f", cH);
	NSColor *complementaryColour = [NSColor colorWithDeviceHue:cH saturation:pS brightness:pB alpha:1];
	
	//Debug messages
	NSLog(@"Width: %i", self.width);
	NSLog(@"Height: %i", self.height);
	
	
	// Create the image on which the colour will be placed.
	//	This one is a small square (25x25 px)
	NSImage *image = [[NSImage alloc] initWithSize:NSMakeSize(25, 25)];
	
	// to make the colour transition smoother, we'll freeze what we have currently, 
	//	and will only unfreeze it when the colour has been loaded onto the image
	[image lockFocus];
	
	// Any object made after this point will be painted in the complementary colour
	[complementaryColour setFill];
	
	// Make a square on the image that starts in the top corner of the 
	//	image (0,0) and fills in the size of the image (which is 25x25)
	// TODO: make the length of the side of the square a variable
	[NSBezierPath fillRect:NSMakeRect(0, 0, 25, 25)];
	
	// Now that the colour has been loaded, we can unfreeze the image
	[image unlockFocus];
	
	// Set the image on the GUI (`complementary') to the temp image (`image')
	[complementary setImage:image];
}

@end
