kbd = Keyboard.new


kbd.split = true
kbd.uart_pin = 1

kbd.set_debounce(:per_key)
kbd.set_debounce_threshold(50)

kbd.init_pins(
  [26, 27, 28, 29],
  [6, 7, 3, 4, 2]
)

kbd.add_layer :default, %i(
  KC_TAB  KC_W    KC_E    KC_R    KC_T      KC_Y      KC_U  KC_I    KC_O    KC_BSPC
  KC_A KC_S    KC_D    KC_F    KC_G      KC_H      KC_J  KC_K    KC_L    KC_P
  SFT_T_Z KC_X    KC_C    SPECIAL_V KC_B      KC_N      KC_M  KC_COMM KC_DOT  ALT_T_Q
  XXXXXXX XXXXXXX KC_LALT LOWER   CTL_T_SPC SFT_T_ENT RAISE FUNCTION XXXXXXX XXXXXXX
)

kbd.add_layer :lower, %i(
  KC_EXLM  KC_AT   KC_HASH KC_DLR  XXXXXXX KC_ASTER KC_AMPR  KC_LPRN KC_RPRN QUESTION
  KC_LCTL KC_ESC  KC_BSPC KC_ENT  KC_DEL  KC_SLSH  KC_MINUS KC_LBRC KC_RBRC XXXXXXX
  C_Z      CAPTURE XXXXXXX XXXXXXX KC_CIRC KC_UNDS  KC_EQL   KC_LCBR KC_RCBR XXXXXXX
  XXXXXXX  XXXXXXX KC_LALT LOWER   KC_SPC  KC_LSFT  ADJUST   FUNCTION  XXXXXXX XXXXXXX
)

kbd.add_layer :raise, %i(
  XXXXXXX KC_4    KC_5    KC_6   XXXXXXX   XXXXXXX   XXXXXXX KC_QUOTE KC_QUOTE KC_DEL
  KC_LSFT KC_1    KC_2    KC_3   KC_COLON  KC_LEFT   KC_DOWN KC_UP    KC_RGHT  XXXXXXX
  KC_LSFT KC_7    KC_8    KC_9   KC_SCOLON KC_HOME   KC_PGDN KC_PGUP  KC_END   XXXXXXX
  XXXXXXX XXXXXXX KC_LALT ADJUST CTL_T_0   SFT_T_ENT RAISE   FUNCTION   XXXXXXX  XXXXXXX
)

kbd.add_layer :adjust, %i(
  XXXXXXX KC_F2   KC_PERC XXXXXXX  XXXXXXX XXXXXXX   KC_F7 KC_DQUO  KC_DQUO KC_F10
  KC_LCTL KC_TILD KC_PIPE KC_BSLS  XXXXXXX C_PGUP    C_DOWN  C_UP     C_PGDN  XXXXXXX
  XXXXXXX C_SPACE XXXXXXX KC_GRAVE XXXXXXX XXXXXXX   KC_PLUS XXXXXXX  XXXXXXX XXXXXXX
  XXXXXXX XXXXXXX KC_LALT ADJUST   KC_SPC  SFT_T_ENT ADJUST  FUNCTION XXXXXXX XXXXXXX
)

kbd.add_layer :function, %i(
  XXXXXXX  KC_F4   KC_F5   KC_F6   XXXXXXX XXXXXXX XXXXXXX XXXXXXX  XXXXXXX XXXXXXX
  KC_LCTRL KC_F1   KC_F2   KC_F3   KC_F11  XXXXXXX XXXXXXX XXXXXXX  XXXXXXX XXXXXXX
  KC_LSFT  KC_F7   KC_F8   KC_F9   KC_F12  XXXXXXX XXXXXXX XXXXXXX  XXXXXXX XXXXXXX
  XXXXXXX  XXXXXXX KC_LALT XXXXXXX XXXXXXX XXXXXXX XXXXXXX FUNCTION XXXXXXX XXXXXXX
)

kbd.add_layer :special, %i(
  XXXXXXX XXXXXXX XXXXXXX XXXXXXX   XXXXXXX XXXXXXX XXXXXXX XXXXXXX  XXXXXXX XXXXXXX
  XXXXXXX XXXXXXX GUI_D XXXXXXX   XXXXXXX XXXXXXX XXXXXXX XXXXXXX  GUI_L XXXXXXX
  XXXXXXX KC_LGUI GUI_V SPECIAL_V XXXXXXX XXXXXXX XXXXXXX XXXXXXX  XXXXXXX XXXXXXX
  XXXXXXX XXXXXXX XXXXXXX XXXXXXX   XXXXXXX XXXXXXX GUI_ENT XXXXXXX XXXXXXX XXXXXXX
)




TAPPING_TERM = 145

kbd.define_mode_key :LOWER,     [ :KC_MHEN, :lower,    TAPPING_TERM - 20, nil ]
kbd.define_mode_key :RAISE,     [ :KC_HENK, :raise,    TAPPING_TERM - 20, nil ]
kbd.define_mode_key :ADJUST,    [ nil,      :adjust,   nil,          nil ]
kbd.define_mode_key :FUNCTION,  [ nil,      :function, TAPPING_TERM, nil ]
kbd.define_mode_key :SPECIAL_V, [ :KC_V,    :special,  TAPPING_TERM + 50, TAPPING_TERM]

# もし、連続して入力したい場合は、 最後の要素にも TAPPING_TERM をつける必要がある
kbd.define_mode_key :CTL_T_A, [ :KC_A, :KC_LCTL, TAPPING_TERM + 50, TAPPING_TERM]
kbd.define_mode_key :CTL_T_SPC, [ :KC_SPC, :KC_LCTL, TAPPING_TERM, TAPPING_TERM]
kbd.define_mode_key :CTL_T_0, [ :KC_0, :KC_LCTL, TAPPING_TERM, TAPPING_TERM]
kbd.define_mode_key :SFT_T_Z, [ :KC_Z, :KC_LSFT, TAPPING_TERM + 20, TAPPING_TERM]
kbd.define_mode_key :SFT_T_ENT, [ :KC_ENT, :KC_LSFT, TAPPING_TERM - 50, TAPPING_TERM]
kbd.define_mode_key :ALT_T_Q, [ :KC_Q, :KC_LALT, TAPPING_TERM, TAPPING_TERM]

kbd.define_composite_key :CAPTURE,  %i(KC_LSFT KC_LGUI KC_S)
kbd.define_composite_key :C_Z,      %i(KC_LCTL KC_Z)
kbd.define_composite_key :QUESTION, %i(KC_LSFT KC_SLSH)
kbd.define_composite_key :C_SPACE,  %i(KC_LCTL KC_SPACE)
kbd.define_composite_key :C_PGUP,   %i(KC_LCTL KC_PGUP)
kbd.define_composite_key :C_PGDN,   %i(KC_LCTL KC_PGDN)
kbd.define_composite_key :C_DOWN,   %i(KC_LCTL KC_DOWN)
kbd.define_composite_key :C_UP,     %i(KC_LCTL KC_UP)

kbd.define_composite_key :GUI_ENT,  %i(KC_LGUI KC_ENT)
kbd.define_composite_key :GUI_D,  %i(KC_LGUI KC_D)
kbd.define_composite_key :GUI_V,  %i(KC_LGUI KC_V)
kbd.define_composite_key :GUI_L,  %i(KC_LGUI KC_L)

# # すべての入力の前に実行される (これは複数回呼び出し可能 (追加されていく))
# kbd.before_report do
#   # X が押されて 500ms 経過していたら、レイヤーをオン
# end

rgb = RGB.new(
  0, # pin number
  1, # size of underglow pixel
  0, # size o  backlight pixel
  false # 32bit data will be sent to a pixel if true while 24bit if false
)
rgb.effect     = :static
rgb.speed      = 31  # 1-31  / default: 22
rgb.hue        = 10  # 0-100 / default: 0
rgb.saturation = 100 # 0-100 / default: 100
rgb.value      = 10  # 1-31  / default: 13

kbd.append rgb # `kbd` is an instance of Keyboard class that should be newed in advance

kbd.start!


