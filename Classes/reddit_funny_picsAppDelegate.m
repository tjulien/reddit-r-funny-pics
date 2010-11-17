//
//  reddit_funny_picsAppDelegate.m
//  reddit_funny_pics
//
//  Created by TIM JULIEN on 11/15/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "reddit_funny_picsAppDelegate.h"
//#import "NSXMLDocument.h"
#import <Foundation/Foundation.h>
#import "TFHpple.h"


@implementation reddit_funny_picsAppDelegate

@synthesize window;
@synthesize imageView;
//@synthesize scrollView;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.
    srand(time(NULL));
    NSURL *redditFunny = [NSURL URLWithString:@"http://www.reddit.com/r/funny"];
    NSData *data = [[NSData alloc] initWithContentsOfURL:redditFunny];
    TFHpple *xpathParser = [[TFHpple alloc] initWithHTMLData:data];
    NSArray *elements  = [xpathParser search:@"//a[@class='title ' and (contains(@href, 'jpg') or contains(@href, 'gif') or contains(@href, 'png'))]"];
    TFHppleElement *element = [elements objectAtIndex:arc4random() % [elements count]];
    NSString *imageURLString = [[element attributes] valueForKey:@"href"];  
    
    [xpathParser release];
    [data release];
    
    
    NSURL * imageURL = [NSURL URLWithString:imageURLString];
    NSData * imageData = [NSData dataWithContentsOfURL:imageURL];
    UIImage * image = [UIImage imageWithData:imageData];
    if(image.size.width > image.size.height) {
        image = [UIImage imageWithCGImage:image.CGImage scale:1.0f orientation:UIImageOrientationRight];
    }
    printf("%d %d", (int)image.size.height, (int)image.size.width);
    imageView.image = image;
    //[scrollView setContentSize:image.size];
    
    [window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
