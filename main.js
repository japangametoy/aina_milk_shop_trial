
const electron = require('electron');
const electron_app = electron.app;
const app = electron.app;
const BrowserWindow = electron.BrowserWindow;
const ipcMain = electron.ipcMain;

let mainWindow = null;


class DialogManager {

  constructor() {

    const electron = require('electron');
    const ipcMain = electron.ipcMain;

    this.dialog = require("electron").dialog;
    this.ipcMain = ipcMain;
    this.path = require("path");

    this.electron = electron;

    ipcMain.on('showSelectFileDialog', async (event, arg) => {
      console.log('receive message: showSelectFileDialog');
      let obj = this.showSelectFileDialog(arg);
      event.returnValue = obj;
    });

    ipcMain.on('showSaveDialog', async (event, arg) => {
      let obj = this.showSaveFileDialog(arg);
      event.returnValue = obj;
    });

  }

  test() {
    console.log("test");
  }

  showSelectFileDialog(opt) {

    let title = opt.title || "";
    let extensions = opt.extensions || [];
    let prop = opt.prop || ['openFile'];

    let windows = this.electron.BrowserWindow.getAllWindows();
    const mainWindow = windows.find(window => window.title === 'TyranoStudio');


    let filenames = this.dialog.showOpenDialogSync(
      //require('electron').remote.getCurrentWindow(),
      mainWindow,
      {
        properties: prop,
        title: title,
        filters: [
          { name: '', extensions: extensions }
        ]
      }
    );

    if (typeof filenames == "undefined") {
      return undefined;
    }

    let filepath = filenames[0];

    let fileobj = {
      filepath: filepath,
      filename: this.path.basename(filepath),
      dirname: this.path.dirname(filepath)
    }

    return fileobj;

  }

  showSaveFileDialog(opt) {

    let title = opt.title || "";
    let filename = opt.filename || "";

    let windows = this.electron.BrowserWindow.getAllWindows();
    const mainWindow = windows.find(window => window.title === 'TyranoStudio');

    let file = this.dialog.showSaveDialogSync(
      mainWindow,
      {
        defaultPath: filename,
        title: title
      }
    );

    return file;
  }

}


app.on('ready', () => {

  let fs = require('fs');
  let package_path = __dirname + '/package.json';
  let map_package = JSON.parse(fs.readFileSync(package_path));
  let map_window = map_package["window"];
  console.log(map_package);
  console.log(map_window);

  let dialogManager = new DialogManager();

  let width = parseInt(map_window["width"]);
  let height = parseInt(map_window["height"]);
  let resize = map_window["resize"];

  //windows微調整
  if (process.platform == "win32") {

    if (resize == false) {
      height = height + 20;
    }
  }

  var path = require("path");

  // mainWindowを作成（windowの大きさや、Kioskモードにするかどうかなどもここで定義できる）
  mainWindow = new BrowserWindow({
    "width": width,
    "height": height,
    "resizable": resize,
    "useContentSize": true,
    "show": false,
    webPreferences: {
      nodeIntegration: true,
      contextIsolation: true,
      preload: path.join(__dirname, 'preload.js')
    }
  });

  // 判定用ユーザーエージェント追加
  mainWindow.webContents.setUserAgent(mainWindow.webContents.getUserAgent() + " TyranoErectron");
  // Electronに表示するhtmlを絶対パスで指定（相対パスだと動かない）
  mainWindow.loadURL('file://' + __dirname + '/index.html');

  // ChromiumのDevツールを開く
  //mainWindow.webContents.openDevTools();


  if (map_window["devtools"] == true) {
    mainWindow.webContents.openDevTools();
  }

  mainWindow.on("ready-to-show", () => {

    //メニューの調整
    const Menu = require('electron').Menu;

    if (process.platform == "win32") {

      mainWindow.removeMenu();

      mainWindow.minimize(); // 最小化
      mainWindow.restore(); // 最大化

    } else {

      const templateMenu = [
        {
          label: 'ファイル',
          submenu: [
            {
              label: '終了',
              role: 'close',
            },
          ]
        }
      ];

      let menu = Menu.buildFromTemplate(templateMenu);
      Menu.setApplicationMenu(menu);
    }

    mainWindow.show();

  });

  //  mainWindow.removeMenu();
  //  mainWindow.setMenu(null);

  mainWindow.on('closed', function () {
    mainWindow = null;
  });

});

//
ipcMain.on('getAppPath', async (event, arg) => {
  console.log('receive message: getAppPath')
  event.returnValue = electron_app.getAppPath();
});

ipcMain.on('getProcess', async (event, arg) => {

  event.returnValue = {
    platform: process.platform,
    __dirname: __dirname,
    execPath: process.execPath,
    env: { HOME: process.env.HOME },
  };

});

ipcMain.on("doubleCheck", async (event, arg) => {

  const flag = electron_app.requestSingleInstanceLock();
  event.returnValue = flag;

});

/*
var log = require('electron-log');

process.on('uncaughtException', function(err) {
  log.error('electron:event:uncaughtException');
  log.error(err);
  log.error(err.stack);
  app.quit();
});

*/

