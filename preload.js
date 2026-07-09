const { contextBridge, ipcRenderer, ipcMain } = require("electron");


contextBridge.exposeInMainWorld("studio_api", {


  fs: require('fs-extra'),
  fs_default: require('fs'),
  shell: require("electron").shell,
  path: require('path'),
  asar: require('asar'),

  admzip: require("adm-zip"),

  csv_parse: require("csv-parse"),
  csv_stringify: require('csv-stringify'),

  //packager: require("electron-packager"),
  ipcRenderer: ipcRenderer,

  handleMainEvent: (callback) => ipcRenderer.on('asynchronous-message', callback)

});

