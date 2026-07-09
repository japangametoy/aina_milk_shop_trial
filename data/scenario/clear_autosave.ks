[_tb_system_call storage=system/_clear_autosave.ks]

[cm  ]
[bg  time="1000"  method="crossfade"  storage="bg_base.png"  ]
[tb_ptext_show  x="250"  y="290"  size="80"  color="0xf5ed08"  time="1000"  text="本当にゲームを最初からやり直しますか？"  face="MochiyPopOne-Regular"  anim="false"  edge="0xf50808"  shadow="undefined"  ]
[tb_ptext_show  x="80"  y="538"  size="45"  color="0xffff00"  time="1000"  text="Are&nbsp;you&nbsp;really&nbsp;sure&nbsp;you&nbsp;want&nbsp;to&nbsp;restart&nbsp;the&nbsp;game&nbsp;from&nbsp;the&nbsp;beginning?"  face="MochiyPopOne-Regular"  anim="false"  edge="0xff0a0a"  shadow="undefined"  ]
[glink  color="black"  storage="clear_autosave.ks"  size="40"  text="OK"  autopos="false"  x="600"  y="800"  width=""  height=""  _clickable_img="title.jpg"  target="*reset"  ]
[glink  color="black"  storage="clear_autosave.ks"  size="40"  text="Cancel"  autopos="false"  y="798"  x="1100"  width=""  height=""  _clickable_img=""  target="*return"  ]
[s  ]
*reset

[tb_ptext_hide  time="0"  ]
[tb_start_tyrano_code]
; オートセーブのセーブデータを削除するシナリオ

[iscript]
localStorage.clear();
[endscript]

[_tb_end_tyrano_code]

[tb_start_tyrano_code]
// ゲーム内変数を全てクリアする
[clearvar]

// first.ksの開始ラベルにジャンプする
[jump storage="first.ks"]
[_tb_end_tyrano_code]

[s  ]
*return

[tb_ptext_hide  time="0"  ]
[cm  ]
[jump  storage="title_screen.ks"  target=""  ]
[s  ]
