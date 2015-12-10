//
//  ViewController.h
//  DecodificarBase64
//
//  Created by Nelson on 7/12/15.
//  Copyright (c) 2015 Nelson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Cordova/CDVPlugin.h>

@interface LocalAbrirArchivo : CDVPlugin<UIDocumentInteractionControllerDelegate>{
    
    
    
    //variable donde esta la imagen codificada Base64
    NSString *imagenBase64;
    
    //variable donde esta el Pdf codificado Base64
    NSString *pdfBase64;
    
    //variable donde esta el Pdf codificado Base64
    NSString *WordBase64;
    
    //variable donde esta el Pdf codificado Base64
    NSString *ExcelBase64;

   UIDocumentInteractionController *controller;
}


@end

