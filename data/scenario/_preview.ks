[_tb_system_call storage=system/_preview.ks ]

[mask time=10]
[mask_off time=10]
[tb_autosave  ]
[tb_start_tyrano_code]
[if exp="TYRANO.kag.stat.current_bgm !== 'okiniiri.mp3'"]
[_tb_end_tyrano_code]

[playbgm  volume="10"  time="1000"  loop="true"  storage="okiniiri.mp3"  ]
[tb_start_tyrano_code]
[endif]
[_tb_end_tyrano_code]

[tb_start_tyrano_code]
[showmenubutton]
[_tb_end_tyrano_code]

[cm  ]
[bg  time="1000"  method="crossfade"  storage="background_select.jpg"  ]
[button  storage="select.ks"  target="*plo"  graphic="milk_bin_color_2.png"  width="375"  height="267"  x="12"  y="80"  _clickable_img=""  name="img_2"  ]
[button  storage="select.ks"  target="*anime_A"  graphic="a_pic_s.jpg"  width="576"  height="432"  x="480"  y="100"  _clickable_img=""  name="img_3"  ]
[tb_image_show  time="0"  storage="default/b_pic_s_g.jpg"  width="576"  height="432"  x="1180"  y="100"  name="img_4"  _clickable_img=""  ]
[tb_image_show  time="0"  storage="default/c_pic_s_g.jpg"  width="576"  height="432"  x="60"  y="580"  _clickable_img=""  name="img_5"  ]
[tb_image_show  time="0"  storage="default/d_pic_s_g.jpg"  width="576"  height="432"  x="760"  y="580"  _clickable_img=""  ]
[font  size="14"  color="0xffffff"  face="MochiyPopOne-Regular"  ]
[glink  color="btn_29_red"  storage="select.ks"  size="36"  text="日本語"  x="30"  y="380"  width=""  height=""  _clickable_img="background.jpg"  target="*ja"  ]
[glink  color="btn_29_blue"  storage="select.ks"  size="36"  text="English"  x="220"  y="380"  width=""  height=""  _clickable_img=""  target="*en"  ]
[glink  color="btn_17_black"  storage="select.ks"  size="36"  text="ムービー"  x="1620"  y="880"  width=""  height=""  _clickable_img=""  target="*movie"  autopos="false"  ]
[resetfont  ]
[s  ]
[jump  storage="select.ks"  target="*A_clear"  cond="sf.anime_B=='true'"  ]
[s  ]
*A_clear

[button  storage="select.ks"  target="*anime_B"  graphic="b_pic_s.jpg"  width="576"  height="432"  x="1180"  y="100"  _clickable_img=""  ]
[jump  storage="select.ks"  target="*B_clear"  cond="sf.anime_C=='true'"  ]
[s  ]
*B_clear

[button  storage="select.ks"  target="*anime_C"  graphic="c_pic_s.jpg"  width="576"  height="432"  x="60"  y="580"  _clickable_img=""  name="img_2"  ]
[s  ]
*plo

[cm  ]
[jump  storage="intro.ks"  target="*intro_s"  ]
[s  ]
*anime_A

[tb_image_hide  time="0"  ]
[cm  ]
[jump  storage="a_anime.ks"  target=""  cond=""  ]
[s  ]
*anime_B

[cm  ]
[jump  storage="b_anime.ks"  target=""  ]
[s  ]
*anime_C

[cm  ]
[jump  storage="c_anime.ks"  target=""  ]
[s  ]
[s  ]
*ja

[cm  ]
[tb_lang_set  name="default"  ]
[tb_eval  exp="sf.lang='ja'"  name="lang"  cmd="="  op="t"  val="ja"  ]
[tb_image_hide  time="0"  ]
[jump  storage="select.ks"  target=""  ]
[s  ]
*en

[cm  ]
[tb_lang_set  name="en"  ]
[tb_eval  exp="sf.lang='en'"  name="lang"  cmd="="  op="t"  val="en"  val_2="undefined"  ]
[tb_image_hide  time="0"  ]
[jump  storage="select.ks"  target=""  ]
[s  ]
*movie

[cm  ]
[tb_image_hide  time="0"  ]
[jump  storage="select_anime_only.ks"  target=""  ]
[s  ]
