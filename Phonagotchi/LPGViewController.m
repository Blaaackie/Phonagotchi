//
//  LPGViewController.m
//  Phonagotchi
//
//  Created by Steven Masuch on 2014-07-26.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "LPGViewController.h"
#import "Pet.h"

@interface LPGViewController ()

@property (nonatomic) UIImageView *petImageView;
@property (nonatomic) UIImageView *bucketImageView;
@property (nonatomic) UIImageView *appleImageView;
@property (nonatomic) UIImageView *appleImageViewCopy;
@property (nonatomic) Pet *pusheen;

@end

@implementation LPGViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.pusheen = [[Pet alloc] init];
	
    self.view.backgroundColor = [UIColor colorWithRed:(252.0/255.0) green:(240.0/255.0) blue:(228.0/255.0) alpha:1.0];

    self.bucketImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.bucketImageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.bucketImageView.image = [UIImage imageNamed:@"bucket"];
    [self.view addSubview:self.bucketImageView];
    
    [[self.bucketImageView.leadingAnchor constraintEqualToAnchor:(self.view.leadingAnchor) constant: 20.0] setActive:YES];
    [[self.bucketImageView.bottomAnchor constraintEqualToAnchor:(self.view.bottomAnchor) constant: -20] setActive:YES];
    [[self.bucketImageView.widthAnchor constraintEqualToConstant:70] setActive:YES];
    [[self.bucketImageView.heightAnchor constraintEqualToConstant:70] setActive:YES];
   
    self.appleImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.appleImageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.appleImageView.image = [UIImage imageNamed:@"apple"];
    [self.bucketImageView addSubview:self.appleImageView];
    
    [[self.appleImageView.leadingAnchor constraintEqualToAnchor:(self.bucketImageView.leadingAnchor) constant: 10.0] setActive:YES];
    [[self.appleImageView.bottomAnchor constraintEqualToAnchor:(self.bucketImageView.bottomAnchor) constant: -20] setActive:YES];
    [[self.appleImageView.widthAnchor constraintEqualToConstant:40] setActive:YES];
    [[self.appleImageView.heightAnchor constraintEqualToConstant:40] setActive:YES];
    
    self.petImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.petImageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.petImageView.image = [UIImage imageNamed:@"default"];
    
    [self.view addSubview:self.petImageView];
    
    [NSLayoutConstraint constraintWithItem:self.petImageView
                                  attribute:NSLayoutAttributeCenterX
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self.view
                                  attribute:NSLayoutAttributeCenterX
                                 multiplier:1.0
                                   constant:0.0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.petImageView
                                  attribute:NSLayoutAttributeCenterY
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self.view
                                  attribute:NSLayoutAttributeCenterY
                                 multiplier:1.0
                                   constant:0.0].active = YES;
    
    UIPanGestureRecognizer *pettingGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pettingHappened:)];
    [self.view addGestureRecognizer:pettingGesture];
    
    UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinchHappened:)];
    [self.view addGestureRecognizer:pinchGesture];
}

- (void)pinchHappened:(UIPinchGestureRecognizer*) sender {
    
    CGPoint location = [sender locationInView:self.view];
    
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
            
            if (CGRectContainsPoint(self.bucketImageView.frame, location)) {
                self.appleImageViewCopy = [[UIImageView alloc] initWithFrame:self.appleImageView.frame];
                self.appleImageViewCopy.image = [UIImage imageNamed:@"apple"];
                [self.view addSubview:self.appleImageViewCopy];
                break;
            
        case UIGestureRecognizerStateChanged:
                
                self.appleImageViewCopy.center = location;
                break;
                
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateFailed:
                
                if (CGRectContainsPoint(self.petImageView.frame, location)) {
                    [UIImageView animateWithDuration:2.0 animations:^{
                        self.appleImageViewCopy.alpha = 0.0;
                    }];
                }
                
                else {
                        [UIImageView animateWithDuration:2.0 animations:^{
                            self.appleImageViewCopy.frame = CGRectMake(self.appleImageViewCopy.frame.origin.x, self.appleImageViewCopy.frame.origin.y + 2000.0, self.appleImageViewCopy.frame.size.width, self.appleImageViewCopy.frame.size.height);
                        }];
                    }
                }
            
        default:
            break;
    }

    
}



- (void)pettingHappened:(UIPanGestureRecognizer*) pettingGesture {
    CGPoint velocity = [pettingGesture velocityInView:pettingGesture.view];
    if ([self.pusheen pettingVelocity:velocity]) {
        self.petImageView.image = [UIImage imageNamed:@"grumpy"];
    }
}
    
    
//- (IBAction) panGestureRecognized:(UIPanGestureRecognizer *)recognizer {
//    
//    UIGestureRecognizerState state = recognizer.state;
//    
//    CGPoint gestureTranslation = [recognizer translationInView:self];
//    CGPoint gestureVelocity = [recognizer velocityInView:self];

@end
