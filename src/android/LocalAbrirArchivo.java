package com.bancosol.plugin;

import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.content.DialogInterface;


import org.apache.cordova.*;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import android.widget.Toast;

import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.net.Uri;
import android.os.Environment;
import android.os.Bundle;
import android.util.Base64;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

import java.io.File;
import java.io.FileOutputStream;
import java.util.Date;

public class LocalAbrirArchivo extends CordovaPlugin {
    
    public LocalAbrirArchivo() {
        
    }
    
    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        if ("abriropcionesarchivo".equals(action)) {
            //Cadena donde se recive la cadena con el base64 y el tipo
            String StringBase64 = args.getString(0);
            //Se divide el StringBase64, en el tipo y la base64
            String[] substring = StringBase64.split(",");
            //Se saca el tipo
            String tipo = substring[0];
            //Se saca la base64
            String base64 = substring[1];
            //se divide la primera parte para sacar el tipo de la base64
            String[] substringtipo = tipo.split(";");
            //Se toma la primera parte de la cafena substringtipo
            String substringtipodato = substringtipo[0];
            //Se divide la cadena substringtipodato para sacar el tipo del archivo
            String[] substringext = substringtipodato.split(":");
            //Se saca la segunda parte donde se obtiene la extencion
            String extencion = substringext[1];
            
            // Muestra un alert para verificar si se esta resibiendo los datos
            
            /*new AlertDialog.Builder(cordova.getActivity())
             .setTitle(tipo)
             .setMessage(tipo)
             .setCancelable(false)
             .setNeutralButton(extencion, new AlertDialog.OnClickListener() {
             public void onClick(DialogInterface dialogInterface, int which) {
             dialogInterface.dismiss();
             }
             })
             .create()
             .show();*/
            // Se realiza la decoficacion de la base64 dentri de un array de bits
            byte[] decodedBytes = Base64.decode(base64, 0);
            //Inicializamos un variable de tipo File que sera creada dentro los archivos temporales del dispositivo
            File path = null;
            try {
                if (tipo.equals("data:image/jpeg;base64")||tipo.equals("data:image/jpg;base64")) {
                    path = new File(Environment.getExternalStorageDirectory() + "/Temp_jpg.jpg");
                }
                if (tipo.equals("data:image/gif;base64")) {
                    path = new File(Environment.getExternalStorageDirectory() + "/Temp_gif.gif");
                }
                if (tipo.equals("data:image/png;base64")) {
                    path = new File(Environment.getExternalStorageDirectory() + "/Temp_png.png");
                }
                if (tipo.equals("data:application/pdf;base64")) {
                    path = new File(Environment.getExternalStorageDirectory() + "/Temp_pdf.pdf");
                }
                if (tipo.equals("data:application/vnd.ms-excel;base64")) {
                    path = new File(Environment.getExternalStorageDirectory() + "/Temp_excel.xls");
                }
                if (tipo.equals("data:application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;base64")) {
                    path = new File(Environment.getExternalStorageDirectory() + "/Temp_excel.xlsx");
                }
                if (tipo.equals("data:application/vnd.ms-excel.sheet.macroenabled.12;base64")) {
                    path = new File(Environment.getExternalStorageDirectory() + "/Temp_excel.xlsm");
                }
                if (tipo.equals("data:application/msword;base64")) {
                    path = new File(Environment.getExternalStorageDirectory() + "/Temp_word.doc");
                }
                if (tipo.equals("data:application/vnd.openxmlformats-officedocument.wordprocessingml.document;base64")) {
                    path = new File(Environment.getExternalStorageDirectory() + "/Temp_word.docx");
                }
                if (tipo.equals("data:application/vnd.ms-powerpoint;base64")) {
                    path = new File(Environment.getExternalStorageDirectory() + "/Temp_power.ppt");
                }
                if (tipo.equals("data:application/vnd.openxmlformats-officedocument.presentationml.presentation;base64")) {
                    path = new File(Environment.getExternalStorageDirectory() + "/Temp_power.pptx");
                }
                if (tipo.equals("data:application/x-rar;base64")||tipo.equals("data:application/rar;base64")) {
                    path = new File(Environment.getExternalStorageDirectory() + "/Temp_rar.rar");
                }
                if (tipo.equals("data:application/zip;base64")) {
                    path = new File(Environment.getExternalStorageDirectory() + "/Temp_zip.zip");
                }
                if (tipo.equals("data:text/plain;base64")) {
                    path = new File(Environment.getExternalStorageDirectory() + "/Temp_txt.txt");
                }

                //se crea el atchivo segun la ruta del path tipo File
                FileOutputStream os = new FileOutputStream(path, true);
                os = new FileOutputStream(path, false);
                //Se escribe los datos dentro del file
                os.write(decodedBytes);
                os.flush();
                //Se cierra el file
                os.close();
                
                
                if (path.exists()) {
                    //obtiene la ruta del tmp
                    Uri path2 = Uri.fromFile(path);
                    //Crea la accion nativa para desplegar las opciones de las app
                    Intent intent = new Intent(Intent.ACTION_VIEW);
                    //Obtiene el File y el tipo, para mostrar las app compatibles
                    intent.setDataAndType(path2, extencion);
                    intent.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
                    
                    try {
                        // Si todo es correcto se abre las opciones de las app
                        this.cordova.getActivity().startActivity(intent);
                    } catch (ActivityNotFoundException e) {
                        new AlertDialog.Builder(cordova.getActivity())
                        .setTitle("ALERTA")
                        .setMessage("No tiene ninguna aplicacion que pueda abrir este archivo")
                        .setCancelable(false)
                        .setNeutralButton("OK", new AlertDialog.OnClickListener() {
                            public void onClick(DialogInterface dialogInterface, int which) {
                                dialogInterface.dismiss();
                            }
                        })
                        .create()
                        .show();
                    }
                }
                
            } catch (Exception e) {
                
                    // TODO Auto-generated catch block
                    new AlertDialog.Builder(cordova.getActivity())
                    .setTitle("ERROR!")
                    .setMessage("No es un formato permitido de lectura")
                    .setCancelable(false)
                    .setNeutralButton("OK", new AlertDialog.OnClickListener() {
                        public void onClick(DialogInterface dialogInterface, int which) {
                            dialogInterface.dismiss();
                        }
                    })
                    .create()
                    .show();
                    
                    e.printStackTrace();
                
                
            }
            
            
        }else{
            if ("abrirarchivo".equals(action)) {
                //Cadena donde se recive la cadena y el tipo
                String StringBase = args.getString(0);
                //Se divide el StringBase64, en el tipo y la base64
                String[] substring = StringBase.split("//");
                //Se saca el tipo
                String tipo = substring[0];
                //Se saca la cadena
                String base = substring[1];
                
                File path = null;
                byte[] StringBytes= base.getBytes();
                try {
                    if (tipo.equals("text")) {
                        Date horaActual=new Date();
                        String hora=(horaActual.getYear()+1900)+""+(horaActual.getMonth()+1)+""+horaActual.getDate()+""+horaActual.getHours()+""+horaActual.getMinutes()+""+horaActual.getSeconds();
                        path = new File(Environment.getExternalStorageDirectory() + "/sincro"+hora+".txt");
                    }
                    //se crea el atchivo segun la ruta del path tipo File
                    FileOutputStream os = new FileOutputStream(path, true);
                    os = new FileOutputStream(path, false);
                    //Se escribe los datos dentro del file
                    os.write(StringBytes);
                    os.flush();
                    //Se cierra el file
                    os.close();
                    
                    // TODO Auto-generated catch block
                    /*new AlertDialog.Builder(cordova.getActivity())
                    .setTitle("CORRECTO")
                    .setMessage("Datos guardados en el dispositivo")
                    .setCancelable(false)
                    .setNeutralButton("OK", new AlertDialog.OnClickListener() {
                        public void onClick(DialogInterface dialogInterface, int which) {
                            dialogInterface.dismiss();
                        }
                    })
                    .create()
                    .show();*/
                    
                    
                
                } catch(Exception e) { 
                     e.printStackTrace();
                }

            }else{
                return false;    
            }
            
        }
        return true;
    }
    
    
    
}
