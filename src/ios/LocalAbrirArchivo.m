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
        
        
        @try {
            
            //Para el tipo Pdf
            if ([tipo isEqualToString:@"data:application/pdf;base64"]) {
                //Creando un archivo temporal de tipo Pdf
                //NSString *fileName = [NSString stringWithFormat:@"%@_%@", [[NSProcessInfo processInfo] globallyUniqueString], @"file.pdf"];
                fileName = [NSString stringWithFormat: @"Tmp_pdf.pdf"];
                
            }
            //Para los tipos docx (Word)
            if ([tipo isEqualToString:@"data:application/vnd.openxmlformats-officedocument.wordprocessingml.document;base64"]) {
                //Creando un archivo temporal de tipo docx
                fileName = [NSString stringWithFormat: @"Tmp_word.docx"];
                
            }
            //Para los tipos doc (Word)
            if ([tipo isEqualToString:@"data:application/msword;base64"]) {
                //Creando un archivo temporal de tipo doc
                fileName = [NSString stringWithFormat: @"Tmp_word.doc"];
                
            }
            //Para los tipos xlsx y xls (Excel)
            if ([tipo isEqualToString:@"data:application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;base64"]||[tipo isEqualToString:@"data:application/vnd.ms-excel;base64"]) {
                //Creando un archivo temporal de tipo xlsx
                fileName = [NSString stringWithFormat: @"Tmp_excel.xlsx"];
                
            }
            //Para los tipos xlsm (Excel)
            if ([tipo isEqualToString:@"data:application/vnd.ms-excel.sheet.macroenabled.12;base64"]) {
                //Creando un archivo temporal de tipo xlsm
                fileName = [NSString stringWithFormat: @"Tmp_excel.xlsm"];
                
            }
            //Para los tipos pptx (PowerPoint)
            if ([tipo isEqualToString:@"data:application/vnd.openxmlformats-officedocument.presentationml.presentation;base64"]) {
                //Creando un archivo temporal de tipo pptx
                fileName = [NSString stringWithFormat: @"Tmp_power.pptx"];
                
            }
            //Para los tipos  ppt (PowerPoint)
            if ([tipo isEqualToString:@"data:application/vnd.ms-powerpoint;base64"]) {
                //Creando un archivo temporal de tipo ppt
                fileName = [NSString stringWithFormat: @"Tmp_power.ppt"];
                
            }
            //Para el tipo rar
            if ([tipo isEqualToString:@"data:application/x-rar;base64"]||[tipo isEqualToString:@"data:application/rar;base64"]) {
                //Creando un archivo temporal de tipo rar
                fileName = [NSString stringWithFormat: @"Tmp_rar.rar"];
                
            }
            //Para el tipo zip
            if ([tipo isEqualToString:@"data:application/zip;base64"]) {
                //Creando un archivo temporal de tipo zip
                fileName = [NSString stringWithFormat: @"Tmp_zip.zip"];
                
            }
            //Para el tipo txt
            if ([tipo isEqualToString:@"data:text/plain;base64"]) {
                //Creando un archivo temporal de tipo txt
                fileName = [NSString stringWithFormat: @"Tmp_text.txt"];
                
            }
            //Para el tipo jpg
            if ([tipo isEqualToString:@"data:image/jpeg;base64"]) {
                //Creando un archivo temporal de tipo jpg
                fileName = [NSString stringWithFormat: @"Tmp_jpeg.jpg"];
                
            }
            //Para el tipo gif
            if ([tipo isEqualToString:@"data:image/gif;base64"]) {
                //Creando un archivo temporal de tipo gif
                fileName = [NSString stringWithFormat: @"Tmp_gif.gif"];
                
            }
            //Para el tipo png
            if ([tipo isEqualToString:@"data:image/png;base64"]) {
                //Creando un archivo temporal de tipo png
                fileName = [NSString stringWithFormat: @"Tmp_png.png"];
                
            }
            @try {
                //obteniendo la direccion del archivo temporal
                fileURL = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingPathComponent:fileName]];
                //Se escribe los datos de la informacion del pdf en el archivo temporal
                [data writeToURL:fileURL options:NSDataWritingAtomic error:&error];
                
                NSData *imageData = [[NSData alloc] initWithContentsOfURL:fileURL];
                UIImage *image = [[UIImage alloc] initWithData:imageData];
                
                UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
                
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Mostrar"
                                                                message:@"Tu imagen ha sido guardada en tus imagenes"
                                                               delegate:nil
                                                      cancelButtonTitle:@"OK"
                                                      otherButtonTitles:nil];
                [alert show];
               
                
                //Obteniendo el archivo tmp y mostrando en vista previa y tambien las opciones de otras apps
                controller =[UIDocumentInteractionController interactionControllerWithURL:fileURL];
                controller.delegate = self;
                [controller presentOpenInMenuFromRect:CGRectZero inView:ViewSuperior.view animated:YES];
            }
            @catch (NSException * e) {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ALERTA"
                                                                message:@"No tiene ninguna aplicacion que pueda abrir este archivo"
                                                               delegate:nil
                                                      cancelButtonTitle:@"OK"
                                                      otherButtonTitles:nil];
                [alert show];
                
            }
        }
        @catch (NSException * e) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ERROR!"
                                                            message:@"No es un formato permitido de lectura"
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];

        }
        @finally {
            
        }

        
        
        
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        
    }
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    
    
}

@end
