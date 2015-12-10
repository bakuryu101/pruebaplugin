//
//  ViewController.m
//  DecodificarBase64
//
//  Created by Nelson on 7/12/15.
//  Copyright (c) 2015 Nelson. All rights reserved.
//

#import "LocalAbrirArchivo.h"

@implementation LocalAbrirArchivo

- (void)abriropcionesarchivo:(CDVInvokedUrlCommand *)command
{
    // Obtenemos los parámetros:
    NSDictionary *parameters = [command.arguments objectAtIndex:0];
    NSString *message = [parameters objectForKey:@"base64"];
    // Y devolvemos el resultado:
    CDVPluginResult* pluginResult = nil;
    @try {
        if (message != nil && [message length] > 0) {
            // Si el mensaje es válido, devolvemos un resultado positivo:
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_
                            OK messageAsString:message];
            [self.commandDelegate sendPluginResult:pluginResultcallbackId:command.
             callbackId];
        } else {
            // Si no, se devolve un error:
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_
                            ERROR];
            [self.commandDelegate sendPluginResult:pluginResultcallbackId:command.
             callbackId];
        }
    } @catch (NSException* exception) {
        // Contemplamos la posibilidad de recibir datos erróneos desde
        la parte JavaScript:
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_
                        JSON_EXCEPTION messageAsString:[exception reason]];
        [self.commandDelegate sendPluginResult:pluginResultcallbackId:command.
         callbackId];
    }

}

@end
