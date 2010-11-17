//
//  reddit_funny_picsAppDelegate.h
//  reddit_funny_pics
//
//  Created by TIM JULIEN on 11/15/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface reddit_funny_picsAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    UIImageView *imageView;
    UIScrollView *scrollView;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UIImageView *imageView;
@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;

@end

