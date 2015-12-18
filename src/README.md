# plugin iOS, Andriod
# plugin para la decodificacion de un base64 a su archivo corespondiente,
# para luego mostrar las aplicaciones contenidas en el dispositivo que pueden
# hacer lectura del archivo.

# Los formatos soportados son:

# Documentos (.pdf;.doc;.docx;.xls;.xlsx;.ppt;.pptx)
# Comprimidos (.rar;.zip)
# Documentos de texto (.txt)
# Imagenes (.jpg;.gif;.png)
Utilizacion de la funcion:
abrirarchivo.abriropcionesarchivo("base64 a mandar a la funcion nativa",
                                    funcion successCallback,
                                    funcion errorCallback);

# Android: Adicionar permisos de lectura y escritura al AndroidManifest.xml
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
<uses-permission android:name="android.permission.STORAGE" />
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
