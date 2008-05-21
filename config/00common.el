;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; common settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; add site-lisp/common load-path
(add-to-list 'load-path "~/git/emacs/site-lisp/common/")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; misc settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; disable message
;(setq message-log-max nil)
;; set default browser
;(setq browse-url-default-browser "firefox")
;; no cursor blinking
;(if (fboundp 'blink-cursor-mode) (blink-cursor-mode 0))
(blink-cursor-mode 0)
;;windmove
(windmove-default-keybindings)
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

(if window-system
    (progn
     ;; start here ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

     ;; background
     ;(set-face-background 'default "#334455")
     ;(set-face-foreground 'default "wheat")

     ;; 不在鼠标点击的那个地方插入剪贴板内容
     (setq mouse-yank-at-point t)
     
     ;; 关闭出错时的提示声
     (setq visible-bell t)

     ;;disable toolbar
     (tool-bar-mode -1)

     ;;right scroolbar
     (set-scroll-bar-mode 'right)

     ;; end here ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ))

