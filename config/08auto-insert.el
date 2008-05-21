;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; auto insert template
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(setq auto-insert t)
(setq auto-insert-query nil)
(add-hook 'find-file-hooks 'auto-insert)
(load-library "autoinsert")
(setq auto-insert-directory "~/git/emacs/auto-insert/")
(setq auto-insert-alist
      (append '(
		("PKGBUILD" .  "PKGBUILD")
;;		("\\.c$" . my-c-mode-hook)
		) auto-insert-alist))