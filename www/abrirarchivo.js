module.exports = {
    abriropcionesarchivo: function (base64, successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "LocalAbrirArchivo", "abriropcionesarchivo", [base64]);
    },
    abrirarchivo: function (base64, successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "LocalAbrirArchivo", "abrirarchivo", [base64]);
    }
};

