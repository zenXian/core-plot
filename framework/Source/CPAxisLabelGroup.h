#import <Foundation/Foundation.h>
#import "CPLayer.h"

@class CPPlotArea;

@interface CPAxisLabelGroup : CPLayer {
@private
	__weak CPPlotArea *plotArea;
}

@property (nonatomic, readwrite, assign) __weak CPPlotArea *plotArea;

@end

