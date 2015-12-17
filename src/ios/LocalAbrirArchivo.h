//
//  ViewController.h
//  DecodificarBase64
//
//  Created by Nelson on 7/12/15.
//  Copyright (c) 2015 Nelson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Cordova/CDV.h>

@interface LocalAbrirArchivo : CDVPlugin<UIDocumentInteractionControllerDelegate>{
  
   UIDocumentInteractionController *controller;
}
- (void)abriropcionesarchivo:(CDVInvokedUrlCommand*)command;

@end

