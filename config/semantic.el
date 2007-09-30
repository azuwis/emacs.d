;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; semantics
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; load file
(setq semantic-load-turn-useful-things-on t)
(setq semantic-idle-scheduler-idle-time 1)
;(setq semantic-load-turn-everything-on t)
(setq semanticdb-default-save-directory (expand-file-name "~/backups/semanticdb"))
(load-file "/usr/share/emacs/site-lisp/cedet/semantic/semantic-load.el")
(global-semantic-highlight-edits-mode)