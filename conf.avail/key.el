;; join line
(global-set-key (kbd "C-S-i") 'join-line)
;; jump to other window
(global-set-key (kbd "C-S-j") 'other-window)
;; delete other window, o means only
(global-set-key (kbd "C-S-o") 'delete-other-windows)
;; previous buffer
(global-set-key (kbd "C-S-h") 'bs-cycle-previous)
;; next buffer
(global-set-key (kbd "C-S-l") 'bs-cycle-next)
;; C-k no confirm
(global-set-key (kbd "C-S-k") 'kill-this-buffer)


;; (defun my-indent-or-complete ()
;;    (interactive)
;;    (if (looking-at "\\>")
;;  	  (hippie-expand nil)
;;  	  (indent-for-tab-command))
;;  )

;; (global-set-key [(control tab)] 'my-indent-or-complete)