package com.bancosol.plugin;

import org.apache.cordova.*;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import android.content.Context;
import android.widget.Toast;

import android.content.ActivityNotFoundException;
import android.content.Intent;
import android.net.Uri;
import android.os.Environment;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Base64;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

import java.io.File;
import java.io.FileOutputStream;

public class LocalAbrirArchivo extends CordovaPlugin {
    
    public LocalAbrirArchivo() {
        
    }
    
    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        if ("abriropcionesarchivo".equals(action)) {
            // this.mostrar(args.getString(0), callbackContext);
            
            String StringBase64 = args.getString(0)
            
            String[] substring = StringBase64.split(",");
            
            String tipo = substring[0];
            
            String base64 = substring[1];
            
            String[] substringtipo = tipo.split(";");
            
            String substringtipodato = substringtipo[0];
            
            String[] substringext = substringtipodato.split(":");
            
            String extencion = substringext[1];
            
            
            byte[] decodedBytes = Base64.decode(base64, 0);
            File path = null;
            try {
                if (tipo.equals("data:image/jpeg;base64")) {
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
                if (tipo.equals("data:application/x-rar;base64")) {
                    path = new File(Environment.getExternalStorageDirectory() + "/Temp_rar.rar");
                }
                if (tipo.equals("data:application/zip;base64")) {
                    path = new File(Environment.getExternalStorageDirectory() + "/Temp_zip.zip");
                }
                if (tipo.equals("data:text/plain;base64")) {
                    path = new File(Environment.getExternalStorageDirectory() + "/Temp_txt.txt");
                }
                
                
                FileOutputStream os = new FileOutputStream(path, true);
                os = new FileOutputStream(path, false);
                os.write(decodedBytes);
                os.flush();
                os.close();
                Toast.makeText(MainActivity.this,extencion , Toast.LENGTH_SHORT).show();
                
                if (path.exists()) {
                    Uri path2 = Uri.fromFile(path);
                    Intent intent = new Intent(Intent.ACTION_VIEW);
                    intent.setDataAndType(path2, extencion);
                    intent.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
                    
                    try {
                        startActivity(intent);
                    } catch (ActivityNotFoundException e) {
                        Toast.makeText(MainActivity.this,
                                       "No Application Available to View PDF",
                                       Toast.LENGTH_SHORT).show();
                    }
                }
                
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }


        }else{
            return false;
        }
        return true;
    }
    
    
    
}
