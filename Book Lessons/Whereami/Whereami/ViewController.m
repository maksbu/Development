//
//  ViewController.m
//  Whereami
//
//  Created by maksbu on 05.01.15.
//  Copyright (c) 2015 MAKSBU. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        // Создание объекта диспетчера локации
        locationManager = [[CLLocationManager alloc] init];
        // Эта строка кода может привести к предупреждению; игнорируйте его
        [locationManager setDelegate:self];
        
        [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
        // Сообщить диспетчеру о немедленном начале поиска локации
        [locationManager startUpdatingLocation];
    }
    return self;
}

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation {
    
    NSLog(@"%@", newLocation);
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error {

    NSLog(@"Could not find location: %@", error);
}

- (void)dealloc {
    
    // Диспетчеру локаций дается указание прекратить отсылать нам сообщения
    [locationManager setDelegate:nil];
}

@end
