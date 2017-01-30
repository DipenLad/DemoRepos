//
//  ViewController.m
//  DEMObarcodeScanner
//
//  Created by Dipen Lad on 12/2/16.
//  Copyright © 2016 cstechsolutions. All rights reserved.
//

#import "ViewController.h"
#import "MTBBarcodeScanner.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MTBBarcodeScanner *scanner = [[MTBBarcodeScanner alloc] initWithPreviewView:self.viewScanner];
    
    [MTBBarcodeScanner requestCameraPermissionWithSuccess:^(BOOL success) {
        if (success) {
            
            NSError *error = nil;
            [scanner startScanningWithResultBlock:^(NSArray *codes) {
                AVMetadataMachineReadableCodeObject *code = [codes firstObject];
                NSLog(@"Found code: %@", code.stringValue);
                
                [scanner stopScanning];
            } error:&error];
            
        } else {
            // The user denied access to the camera
        }
    }];
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
