//
//  See LICENSE file for license information.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController


@property (retain, nonatomic) IBOutlet UIView *primaryView;
@property (retain, nonatomic) IBOutlet UIView *secondaryView;
@property (retain, nonatomic) IBOutlet UIView *primaryShadeView;

- (IBAction)goAction:(id)sender;
- (IBAction)undoAction:(id)sender;

@end
