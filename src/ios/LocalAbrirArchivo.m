    //
//  ViewController.m
//  DecodificarBase64
//
//  Created by Nelson on 7/12/15.
//  Copyright (c) 2015 Nelson. All rights reserved.
//

#import "LocalAbrirArchivo.h"
#import <Cordova/CDV.h>

@interface LocalAbrirArchivo ()

@end
@implementation LocalAbrirArchivo

- (void)abriropcionesarchivo:(CDVInvokedUrlCommand *)command
{
    CDVPluginResult* pluginResult = nil;
    NSString* StringBase64 = [command.arguments objectAtIndex:0];
//    UIAlertView *alert = [[UIAlertView alloc]
//                          initWithTitle:echo
//                          message:nil
//                          delegate:self
//                          cancelButtonTitle:@"Cancel"
//                          otherButtonTitles:@"OK", nil];
//    [alert show];

    if (StringBase64 != nil && [StringBase64 length] > 0) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:StringBase64];
        
        //Decodificando el pdf a un variable de tipo Data
        NSData *data = [[NSData alloc]initWithBase64EncodedString:StringBase64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        //Declaracion de una variable tipo error para que capture algun error existente
        NSError *error = nil;
        //Creando un archivo temporal de tipo Pdf
        //NSString *fileName = [NSString stringWithFormat:@"%@_%@", [[NSProcessInfo processInfo] globallyUniqueString], @"file.pdf"];
        NSString *fileName = [NSString stringWithFormat: @"Tmp_pdf.pdf"];
        //obteniendo la direccion del archivo temporal
        NSURL *fileURL = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent:fileName]];
        //Se escribe los datos de la informacion del pdf en el archivo temporal
        [data writeToURL:fileURL options:NSDataWritingAtomic error:&error];
        //Obteniendo el archivo tmp y mistrando en vista previa y tambien las opciones de otras apps
        controller =[UIDocumentInteractionController interactionControllerWithURL:fileURL];
        controller.delegate = self;
        //[controller presentPreviewAnimated:YES];
        //[[NSFileManager defaultManager] removeItemAtURL:fileURL error:&error];
        //UIButton *button = (UIButton *)sender;
        [controller presentOpenInMenuFromRect:CGRectZero inView:self.view animated:YES];

        
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        
    }
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];


}

@end
