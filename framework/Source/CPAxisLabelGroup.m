#import "CPAxisLabelGroup.h"


/**	@brief A container layer for the axis labels.
 **/
 /* jlz out
@implementation CPAxisLabelGroup

#pragma mark -
#pragma mark Drawing

-(void)renderAsVectorInContext:(CGContextRef)context
{
	// nothing to draw
}


#pragma mark -
#pragma mark Layout

-(void)layoutSublayers
{
	// do nothing--axis is responsible for positioning its labels
}


*/


//jlz beg

#import "CPAxis.h"
#import "CPAxisSet.h"

#import "CPPlotArea.h"

/**	@brief A group of grid line layers.
 *
 *	When using separate axis label layers, this layer serves as the common superlayer for the label layers.
 *	Otherwise, this layer handles the drawing for the labels. It supports mixing the two modes;
 *	some axes can use separate label layers while others are handled by the axis label group.
 **/
@implementation CPAxisLabelGroup

/**	@property plotArea
 *  @brief The plot area that this axis label group belongs to.
 **/
@synthesize plotArea;

#pragma mark -
#pragma mark Init/Dealloc

-(id)initWithFrame:(CGRect)newFrame
{
	if ( self = [super initWithFrame:newFrame] ) {
		plotArea = nil;

		self.needsDisplayOnBoundsChange = YES;
	}
	return self;
}

#pragma mark -
#pragma mark Drawing

-(void)renderAsVectorInContext:(CGContextRef)theContext
{
	[super renderAsVectorInContext:theContext];
    
	for ( CPAxis *axis in self.plotArea.axisSet.axes ) {
		if ( !axis.separateLayerLabels ) {
			[axis drawAxisLabelsInContext:theContext];
		}
	}
}

#pragma mark -
#pragma mark Accessors

-(void)setPlotArea:(CPPlotArea *)newPlotArea
{
	if ( newPlotArea != plotArea ) {
		plotArea = newPlotArea;
		
		if ( plotArea ) {
			[self setNeedsDisplay];
		}
	}
}


#pragma mark -
#pragma mark Layout

-(void)layoutSublayers
{
	// do nothing--axis is responsible for positioning its labels
}



//jlz end


@end

