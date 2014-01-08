//
//  ViewController.m
//  ScrollViewEx01
//
//  Created by yg on 14. 1. 9..
//  Copyright (c) 2014년 yg. All rights reserved.
//

#import "ViewController.h"
#define TAG_CONTENT 99

@interface ViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"rt" ofType:@"jpg"];
    UIImage *image = [UIImage imageWithContentsOfFile:filePath];
    UIImageView *iv = [[UIImageView alloc] initWithImage:image];
    iv.tag = TAG_CONTENT;
    
    [self.scrollView addSubview:iv];
    self.scrollView.delegate = self;
    self.scrollView.contentSize = iv.frame.size;
    self.scrollView.minimumZoomScale = self.scrollView.frame.size.width / iv.frame.size.width;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)fitToWidth:(id)sender {
    UIView *contentView = [self.view viewWithTag:TAG_CONTENT];
    float scale = self.scrollView.frame.size.width / contentView.frame.size.width;
    NSLog(@"scale : %f", scale);
    [self.scrollView setZoomScale:scale animated:YES];
}
- (IBAction)fitToHeight:(id)sender {
    UIView *contentView = [self.view viewWithTag:TAG_CONTENT];
    float scale = self.scrollView.frame.size.height / contentView.frame.size.height;
    NSLog(@"scale : %f", scale);
    [self.scrollView setZoomScale:scale animated:YES];
}

- (IBAction)scaleDouble:(id)sender {
    float x = self.scrollView.contentOffset.x;
    float y = self.scrollView.contentOffset.y;
    float w = self.scrollView.frame.size.width / 2;
    float h = self.scrollView.frame.size.height / 2;
    
    CGRect doubleRect = CGRectMake(x, y, w, h);
    
    [self.scrollView zoomToRect:doubleRect animated:YES];
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return [self.view viewWithTag:TAG_CONTENT];
}

@end























