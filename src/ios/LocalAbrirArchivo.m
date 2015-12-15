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
    //Reciviendo la cadena en Base64
    NSString* StringBase64 = [command.arguments objectAtIndex:0];
    //Creando el view donde se mostrara las opciones de las apps
    CDVViewController* ViewSuperior = (CDVViewController*)[ super viewController ];
    
    //Verificando que la cadena base64 no este Vacia
    if (StringBase64 != nil && [StringBase64 length] > 0) {
        
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:StringBase64];
        //Variable array donde se guardara el tipo de achivo y su Base64
        NSArray *substrings = [StringBase64 componentsSeparatedByString:@","];
        //Variable que contendra el tipo
        NSString *tipo = substrings[0];
        //Variable que contendra la Base64
        NSString *base64 = substrings[1];

        //Decodificando el pdf a un variable de tipo Data
        NSData *data = [[NSData alloc]initWithBase64EncodedString:base64 options:NSDataBase64DecodingIgnoreUnknownCharacters];
        //Declaracion de una variable tipo error para que capture algun error existente
        NSError *error = nil;
        //Variable donde se pondra el nombre del archivo temporal
        NSString *fileName;
        //variable que contendra  la ruta del archivo tmp
        NSURL *fileURL;
        
        //Para el tipo Pdf
        if ([tipo isEqualToString:@"data:application/pdf;base64"]) {
            //Creando un archivo temporal de tipo Pdf
            //NSString *fileName = [NSString stringWithFormat:@"%@_%@", [[NSProcessInfo processInfo] globallyUniqueString], @"file.pdf"];
            fileName = [NSString stringWithFormat: @"Tmp_pdf.pdf"];
            //obteniendo la direccion del archivo temporal
            fileURL = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent:fileName]];
            //Se escribe los datos de la informacion del pdf en el archivo temporal
            [data writeToURL:fileURL options:NSDataWritingAtomic error:&error];
        }
        //Para los tipos docx (Word)
        if ([tipo isEqualToString:@"data:application/vnd.openxmlformats-officedocument.wordprocessingml.document;base64"]) {
            //Creando un archivo temporal de tipo Pdf
            //NSString *fileName = [NSString stringWithFormat:@"%@_%@", [[NSProcessInfo processInfo] globallyUniqueString], @"file.pdf"];
            fileName = [NSString stringWithFormat: @"Tmp_word.docx"];
            //obteniendo la direccion del archivo temporal
            fileURL = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent:fileName]];
            //Se escribe los datos de la informacion del pdf en el archivo temporal
            [data writeToURL:fileURL options:NSDataWritingAtomic error:&error];
        }
        //Para los tipos doc (Word)
        if ([tipo isEqualToString:@"data:application/msword;base64"]) {
            //Creando un archivo temporal de tipo Pdf
            //NSString *fileName = [NSString stringWithFormat:@"%@_%@", [[NSProcessInfo processInfo] globallyUniqueString], @"file.pdf"];
            fileName = [NSString stringWithFormat: @"Tmp_word.doc"];
            //obteniendo la direccion del archivo temporal
            fileURL = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent:fileName]];
            //Se escribe los datos de la informacion del pdf en el archivo temporal
            [data writeToURL:fileURL options:NSDataWritingAtomic error:&error];
        }
        //Para los tipos xlsx y xls (Excel)
        if ([tipo isEqualToString:@"data:application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;base64"]||[tipo isEqualToString:@"data:application/vnd.ms-excel;base64"]) {
            //Creando un archivo temporal de tipo Pdf
            //NSString *fileName = [NSString stringWithFormat:@"%@_%@", [[NSProcessInfo processInfo] globallyUniqueString], @"file.pdf"];
            fileName = [NSString stringWithFormat: @"Tmp_excel.xlsx"];
            //obteniendo la direccion del archivo temporal
            fileURL = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent:fileName]];
            //Se escribe los datos de la informacion del pdf en el archivo temporal
            [data writeToURL:fileURL options:NSDataWritingAtomic error:&error];
        }
        //Para los tipos pptx y ppt (PowerPoint)
        if ([tipo isEqualToString:@"data:application/vnd.openxmlformats-officedocument.presentationml.presentation;base64"]||[tipo isEqualToString:@"data:application/vnd.ms-powerpoint;base64"]) {
            //Creando un archivo temporal de tipo Pdf
            //NSString *fileName = [NSString stringWithFormat:@"%@_%@", [[NSProcessInfo processInfo] globallyUniqueString], @"file.pdf"];
            fileName = [NSString stringWithFormat: @"Tmp_power.ppt"];
            //obteniendo la direccion del archivo temporal
            fileURL = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent:fileName]];
            //Se escribe los datos de la informacion del pdf en el archivo temporal
            [data writeToURL:fileURL options:NSDataWritingAtomic error:&error];
        }
        //Para el tipo rar
        if ([tipo isEqualToString:@"data:application/x-rar;base64"]) {
            //Creando un archivo temporal de tipo Pdf
            //NSString *fileName = [NSString stringWithFormat:@"%@_%@", [[NSProcessInfo processInfo] globallyUniqueString], @"file.pdf"];
            fileName = [NSString stringWithFormat: @"Tmp_rar.rar"];
            //obteniendo la direccion del archivo temporal
            fileURL = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent:fileName]];
            //Se escribe los datos de la informacion del pdf en el archivo temporal
            [data writeToURL:fileURL options:NSDataWritingAtomic error:&error];
        }
        //Para el tipo zip
        if ([tipo isEqualToString:@"data:application/zip;base64"]) {
            //Creando un archivo temporal de tipo Pdf
            //NSString *fileName = [NSString stringWithFormat:@"%@_%@", [[NSProcessInfo processInfo] globallyUniqueString], @"file.pdf"];
            fileName = [NSString stringWithFormat: @"Tmp_zip.zip"];
            //obteniendo la direccion del archivo temporal
            fileURL = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent:fileName]];
            //Se escribe los datos de la informacion del pdf en el archivo temporal
            [data writeToURL:fileURL options:NSDataWritingAtomic error:&error];
        }
        //Para el tipo txt
        if ([tipo isEqualToString:@"data:text/plain;base64"]) {
            //Creando un archivo temporal de tipo Pdf
            //NSString *fileName = [NSString stringWithFormat:@"%@_%@", [[NSProcessInfo processInfo] globallyUniqueString], @"file.pdf"];
            fileName = [NSString stringWithFormat: @"Tmp_text.txt"];
            //obteniendo la direccion del archivo temporal
            fileURL = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent:fileName]];
            //Se escribe los datos de la informacion del pdf en el archivo temporal
            [data writeToURL:fileURL options:NSDataWritingAtomic error:&error];
        }
        //Para el tipo jpg
        if ([tipo isEqualToString:@"data:image/jpeg;base64"]) {
            //Creando un archivo temporal de tipo Pdf
            //NSString *fileName = [NSString stringWithFormat:@"%@_%@", [[NSProcessInfo processInfo] globallyUniqueString], @"file.pdf"];
            fileName = [NSString stringWithFormat: @"Tmp_jpeg.jpg"];
            //obteniendo la direccion del archivo temporal
            fileURL = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent:fileName]];
            //Se escribe los datos de la informacion del pdf en el archivo temporal
            [data writeToURL:fileURL options:NSDataWritingAtomic error:&error];
        }
        //Para el tipo gif
        if ([tipo isEqualToString:@"data:image/gif;base64"]) {
            //Creando un archivo temporal de tipo Pdf
            //NSString *fileName = [NSString stringWithFormat:@"%@_%@", [[NSProcessInfo processInfo] globallyUniqueString], @"file.pdf"];
            fileName = [NSString stringWithFormat: @"Tmp_gif.gif"];
            //obteniendo la direccion del archivo temporal
            fileURL = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent:fileName]];
            //Se escribe los datos de la informacion del pdf en el archivo temporal
            [data writeToURL:fileURL options:NSDataWritingAtomic error:&error];
        }
        //Para el tipo png
        if ([tipo isEqualToString:@"data:image/png;base64"]) {
            //Creando un archivo temporal de tipo Pdf
            //NSString *fileName = [NSString stringWithFormat:@"%@_%@", [[NSProcessInfo processInfo] globallyUniqueString], @"file.pdf"];
            fileName = [NSString stringWithFormat: @"Tmp_png.png"];
            //obteniendo la direccion del archivo temporal
            fileURL = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent:fileName]];
            //Se escribe los datos de la informacion del pdf en el archivo temporal
            [data writeToURL:fileURL options:NSDataWritingAtomic error:&error];
        }
        
        //Obteniendo el archivo tmp y mistrando en vista previa y tambien las opciones de otras apps
        controller =[UIDocumentInteractionController interactionControllerWithURL:fileURL];
        controller.delegate = self;
        //[controller presentPreviewAnimated:YES];
        //[[NSFileManager defaultManager] removeItemAtURL:fileURL error:&error];
        //UIButton *button = (UIButton *)sender;
        [controller presentOpenInMenuFromRect:CGRectZero inView:ViewSuperior.view animated:YES];
        
        
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        
    }
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    
    
}

@end
