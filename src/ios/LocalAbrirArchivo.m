//
//  ViewController.m
//  DecodificarBase64
//
//  Created by Nelson on 7/12/15.
//  Copyright (c) 2015 Nelson. All rights reserved.
//

#import "LocalAbrirArchivo.h"
#import <Cordova/CDV.h>

@implementation LocalAbrirArchivo

- (void)abriropcionesarchivo:(CDVInvokedUrlCommand *)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* echo = [command.arguments objectAtIndex:0];
    
    if (echo != nil && [echo length] > 0) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:echo];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    }
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];


}

@end
