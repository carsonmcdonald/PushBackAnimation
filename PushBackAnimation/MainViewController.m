//
//  See LICENSE file for license information.
//

#import "MainViewController.h"

#import <QuartzCore/QuartzCore.h>

@interface MainViewController ()

@end

@implementation MainViewController

@synthesize primaryView;
@synthesize secondaryView;
@synthesize primaryShadeView;

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [self setSecondaryView:nil];
    [self setPrimaryView:nil];
    [self setPrimaryShadeView:nil];
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    secondaryView.frame = CGRectMake(0, primaryView.frame.size.height, secondaryView.frame.size.width, secondaryView.frame.size.height);
    secondaryView.hidden = false;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return NO;
}

- (void)dealloc 
{
    [secondaryView release];
    [primaryView release];
    [primaryShadeView release];
    [super dealloc];
}

- (IBAction)goAction:(id)sender 
{
    primaryView.userInteractionEnabled=NO;
    
    [UIView animateWithDuration:0.3 animations:^{
        secondaryView.frame = CGRectMake(0, primaryView.frame.size.height - secondaryView.frame.size.height, secondaryView.frame.size.width, secondaryView.frame.size.height);
        
        CALayer *layer = primaryView.layer;
        layer.zPosition = -4000;
        CATransform3D rotationAndPerspectiveTransform = CATransform3DIdentity;
        rotationAndPerspectiveTransform.m34 = 1.0 / -300;
        layer.shadowOpacity = 0.01;
        layer.transform = CATransform3DRotate(rotationAndPerspectiveTransform, 10.0f * M_PI / 180.0f, 1.0f, 0.0f, 0.0f);
        
        primaryShadeView.alpha = 0.35;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 animations:^{
            primaryView.transform = CGAffineTransformMakeScale(0.9, 0.9);
            
            primaryShadeView.alpha = 0.5;
        }];
    }];
}

- (IBAction)undoAction:(id)sender 
{
    primaryView.userInteractionEnabled=YES;
    
    [UIView animateWithDuration:0.3 animations:^{
        CALayer *layer = primaryView.layer;
        layer.zPosition = -4000;
        CATransform3D rotationAndPerspectiveTransform = CATransform3DIdentity;
        rotationAndPerspectiveTransform.m34 = 1.0 / 300;
        layer.transform = CATransform3DRotate(rotationAndPerspectiveTransform, -10.0f * M_PI / 180.0f, 1.0f, 0.0f, 0.0f);
        
        primaryShadeView.alpha = 0.35;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 animations:^{
            primaryView.transform = CGAffineTransformMakeScale(1.0, 1.0);
            
            primaryShadeView.alpha = 0.0;
            
            secondaryView.frame = CGRectMake(0, primaryView.frame.size.height, secondaryView.frame.size.width, secondaryView.frame.size.height);
        }];
    }];
}

@end
