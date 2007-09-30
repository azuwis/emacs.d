;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; common settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; add site-lisp/comment load-path
;(add-to-list 'load-path "~/emacs/site-lisp/common/")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; misc settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; disable message
;(setq message-log-max nil)
;; set default browser
(setq browse-url-default-browser "firefox")
;; no cursor blinking
;(if (fboundp 'blink-cursor-mode) (blink-cursor-mode 0))
(blink-cursor-mode 0)
;; display time
;(display-time)
;; 关闭起动时的那个“开机画面”
(setq inhibit-startup-message t)
;; 显示列号
(setq column-number-mode t)
;; 用一个很大的 kill ring
(setq kill-ring-max 100)
;; 防止页面滚动时跳动， scroll-margin 3 可以在靠近屏幕边沿3行时 就开始滚动
(setq scroll-step 1
      scroll-margin 3
      scroll-conservatively 10000)
;; 把缺省的 major mode 设置为 text-mode, 而不是几乎什么功能也 没有的 fundamental-mode
(setq default-major-mode 'text-mode)
;; 在标题栏显示buffer的名字，而不是 emacs@wangyin.com 这样没用 的提示
(setq frame-title-format "%b @ %f")
;; 括号匹配时显示另外一边的括号，而不是烦人的跳到另一个括号
(show-paren-mode t)
(setq show-paren-style 'parentheses)
;; 让 dired 可以递归的拷贝和删除目录
(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)
;; use transient mark mode
(setq transient-mark-mode t)
;; generic-x, make more highlight
(require 'generic-x)

;; gud display
;(setq gdb-many-windows t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; backup policies
(setq make-backup-files t)
(setq version-control t)
(setq kept-old-versions 2)
(setq kept-new-versions 3)
(setq delete-old-versions t)
(setq backup-directory-alist '(("" . "~/tmp/emacs")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; setting for window system
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
      (set-fontset-font "fontset-default"
			'gb18030 '("Microsoft YaHei" . "unicode-bmp"))


     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
     ;; background
     ;(set-face-background 'default "#334455")
     ;(set-face-foreground 'default "wheat")

     ;; 不在鼠标点击的那个地方插入剪贴板内容
     (setq mouse-yank-at-point t)
     
     ;; 关闭出错时的提示声
     (setq visible-bell t)

     ;; end here ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ))
