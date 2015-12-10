module.exports = {
    abriropcionesarchivo: function (base64, successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "LocalAbrirArchivo", "abriropcionesarchivo", [base64]);
    }
};

