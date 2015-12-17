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
            //this.mostrar(args.getString(0), callbackContext);
            
            String StringBase64 = args.getString(0);
            
            String[] substring = StringBase64.split(",");
            
            String tipo = substring[0];
            
            String base64 = substring[1];
            
            String[] substringtipo = tipo.split(";");
            
            String substringtipodato = substringtipo[0];
            
            String[] substringext = substringtipodato.split(":");
            
            String extencion = substringext[1];
            Toast.makeText(MainActivity.this,extencion , Toast.LENGTH_SHORT).show();
            
            
            
            
        }else{
            return false;
        }
        return true;
    }
    
    
    
}
