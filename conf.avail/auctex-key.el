;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; auctex keys
(global-set-key [f1]    'help)
(global-set-key [S-f1]  'man)
(global-set-key [f2]    'save-buffer)
(global-set-key [S-f2]    'latex-mode)
(global-set-key [f3]   'ibuffer)
(global-set-key [S-f3]   'query-replace)
(global-set-key [f4]    'kill-buffer)

(fset 'latex-or-view
      [?\C-c ?\C-c])
(global-set-key [(f5)] 'latex-or-view)
(global-set-key [S-f5] 'TeX-command-master) ;

(global-set-key [f6] 'LaTeX-environment)
(global-set-key [S-f6] 'LaTeX-section)
(global-set-key [f7]    'hide-body)
(global-set-key [S-f7]    'show-all)
(global-set-key [f8]    'show-entry)
(global-set-key [S-f8]    'hide-entry)

(global-set-key [f9]  'set-mark-command)
(global-set-key [S-f9]      'LaTeX-fill-environment)
(global-set-key [f10]   'other-window)
(global-set-key [S-f10]   'delete-other-windows)
(global-set-key [f11]  'switch-to-buffer )
(global-set-key [S-f11]  'flyspell-mode )
(global-set-key [f12]  'save-buffers-kill-emacs)

(global-set-key [?\C-z] 'undo)
