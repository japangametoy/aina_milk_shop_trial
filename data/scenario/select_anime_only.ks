[_tb_system_call storage=system/_select_anime_only.ks]

[tb_start_tyrano_code]
[if exp="TYRANO.kag.stat.current_bgm !== 'okiniiri.mp3'"]
[_tb_end_tyrano_code]

[playbgm  volume="10"  time="1000"  loop="true"  storage="okiniiri.mp3"  ]
[tb_start_tyrano_code]
[endif]
[_tb_end_tyrano_code]

[cm  ]
[bg  time="1000"  method="crossfade"  storage="background_select.jpg"  ]
[tb_ptext_show  x="-1"  y="-31"  size="97"  color="0xffffff"  time="1000"  text="MOVIE&nbsp;GALLERY"  face="MochiyPopOne-Regular"  anim="false"  edge="0x000000"  shadow="undefined"  ]
[tb_image_show  time="0"  storage="default/a_pic_s_g.jpg"  width="576"  height="432"  x="480"  y="100"  name="img_6"  _clickable_img=""  ]
[tb_image_show  time="0"  storage="default/b_pic_s_g.jpg"  width="576"  height="432"  x="1180"  y="100"  name="img_7"  _clickable_img=""  ]
[tb_image_show  time="0"  storage="default/c_pic_s_g.jpg"  width="576"  height="432"  x="60"  y="580"  _clickable_img=""  name="img_8"  ]
[tb_image_show  time="0"  storage="default/d_pic_s_g.jpg"  width="576"  height="432"  x="760"  y="580"  _clickable_img=""  name="img_9"  ]
[glink  color="btn_17_black"  storage="select_anime_only.ks"  size="36"  text="シーン選択"  x="1620"  y="880"  width=""  height=""  _clickable_img=""  target="*scene_select"  autopos="false"  ]
[jump  storage="select_anime_only.ks"  target="*A_clear"  cond="sf.anime_B=='true'"  ]
[s  ]
*A_clear

[button  storage="select_anime_only.ks"  target="*anime_A"  graphic="a_pic_s.jpg"  width="576"  height="432"  x="480"  y="100"  _clickable_img=""  name="img_3"  ]
[jump  storage="select_anime_only.ks"  target="*B_clear"  cond="sf.anime_C=='true'"  ]
[s  ]
*B_clear

[button  storage="select.ks"  target="*anime_B"  graphic="b_pic_s.jpg"  width="576"  height="432"  x="1180"  y="100"  _clickable_img=""  ]
[s  ]
[button  storage="select.ks"  target="*anime_C"  graphic="c_pic_s.jpg"  width="576"  height="432"  x="60"  y="580"  _clickable_img=""  name="img_2"  ]
[s  ]
*anime_A

[tb_ptext_hide  time="1000"  ]
[tb_image_hide  time="0"  ]
[cm  ]
[jump  storage="a_anime_only.ks"  target=""  cond=""  ]
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
*scene_select

[tb_ptext_hide  time="0"  ]
[tb_image_hide  time="0"  ]
[cm  ]
[jump  storage="select.ks"  target=""  ]
[s  ]
