module.exports = {
    abriropcionesarchivo: function (base64, successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "LocalAbrirArchivo", "abriropcionesarchivo", [base64]);
    },
    creararchivotxt: function (base64, successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "LocalAbrirArchivo", "creararchivotxt", [base64]);
    },
    creararchivo: function (base64, successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "LocalAbrirArchivo", "creararchivo", [base64]);
    }
};

