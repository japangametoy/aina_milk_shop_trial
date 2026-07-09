[_tb_system_call storage=system/_title_screen.ks]


;==============================
; タイトル画面
;==============================


[cm  ]
[tb_clear_images]

[hidemenubutton]

[tb_start_tyrano_code]
; PCアプリ版とブラウザ版を判別し、sf.is_exeに結果を保存
[iscript]
if($.isElectron() || $.isNWJS()){
sf.is_exe = true;
} else {
sf.is_exe = false;
}
[endscript]
[_tb_end_tyrano_code]

[tb_keyconfig  flag="1"  ]

;標準のメッセージレイヤを非表示


[tb_hide_message_window  ]

;タイトル表示


[playbgm  volume="10"  time="1000"  loop="true"  storage="odayaka.mp3"  ]
[bg  time="1000"  method="crossfade"  storage="title.jpg"  ]
*title

[glink  color="btn_08_red"  storage="title_screen.ks"  size="40"  x="1611"  y="397"  width="211"  height="106"  text="スタート"  _clickable_img=""  target="*autoload"  ]
[glink  color="btn_16_red"  storage="clear_autosave.ks"  size="30"  text="初期化/wipe&nbsp;data"  x="1580"  y="940"  width=""  height=""  _clickable_img=""  ]
[s  ]
*autoload

[tb_start_tyrano_code]
[if exp="sf.system.autosave == true"]
[_tb_end_tyrano_code]

[tb_autoload  ]
[tb_start_tyrano_code]
[endif]
[_tb_end_tyrano_code]

[jump  storage="intro.ks"  target=""  ]
[s  ]
