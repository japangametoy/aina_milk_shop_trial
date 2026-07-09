[_tb_system_call storage=system/_title.ks]

[bg  time="1000"  method="crossfade"  storage="title.jpg"  ]
[tb_start_text mode=1 ]
新しいシナリオです[p]
[_tb_end_text]

[glink  color="btn_08_red"  storage="title.ks"  size="20"  x="1611"  y="397"  width=""  height=""  text="スタート"  _clickable_img="title.jpg"  target="*start"  ]
[s  ]
*start

[cm  ]
[jump  storage="title.ks"  target="*intro_ok"  cond="f.intro==1"  ]
[jump  storage="title.ks"  target="*intro_done"  cond="f.intro==1"  ]
[s  ]
*intro_ok

[jump  storage="intro.ks"  target=""  ]
*intro_done

[jump  storage="scene1.ks"  target=""  ]
[s  ]
