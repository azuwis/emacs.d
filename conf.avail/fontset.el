;;; fontset.el --- 

(if window-system
    (progn
     ;; start here ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
     ;; fontset
     ;;(create-fontset-from-fontset-spec
     ;;"-xos4-terminus-medium-r-normal--14-*-*-*-*-*-fontset-my")

     ;(set-fontset-font
      ;"fontset-default" nil
      ;"-*-simsun-*-*-*-*-13-*-*-*-*-*-iso10646-1" nil 'prepend)
     ;(set-fontset-font
      ;"fontset-my" 'kana
      ;"-*-simsun-*-*-*-*-13-*-*-*-*-*-iso10646-1" nil 'prepend)
     ;(set-fontset-font
      ;"fontset-my" 'han
      ;"-*-simsun-*-*-*-*-13-*-*-*-*-*-iso10646-1" nil 'prepend)
     ;(set-fontset-font
      ;"fontset-my" 'cjk-misc
      ;"-*-simsun-*-*-*-*-13-*-*-*-*-*-iso10646-1" nil 'prepend)
 
     ;;(set-face-font 'default "fontset-my")
     ;(set-face-font 'tooltip "fontset-my")

      ;; font setting
      (set-default-font "Consolas-12")
      ;;(set-default-font "DejaVu Sans Mono-10")
      ;;(set-default-font "Liberation Mono-10")
      ;;(set-default-font "Monaco-10")
      ;;(set-fontset-font "fontset-default"
	;;	'gb18030 '("Microsoft YaHei" . "unicode-bmp"))

     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
     ;; background
     ;(set-face-background 'default "#334455")
     ;(set-face-foreground 'default "wheat")

     ;; end here ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ))

;;; fontset.el ends here
