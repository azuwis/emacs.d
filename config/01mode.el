;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; coding style
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; c and c++

;; (setq auto-mode-alist
;;       (append '(("\\.c$" . semantic-mode)
;; 		("\\.h$" . semantic-mode)
;; 		("\\.cpp$" . semantic-mode)
;; 		("\\.hpp$" . semantic-mode)
;; 		("\\.py$" . semantic-mode)
;; 		) auto-mode-alist))

(setq auto-mode-alist
      (append '(("PKGBUILD" . sh-mode)
		) auto-mode-alist))

(add-hook 'c-mode-hook 
	  '(lambda()
	     (c-set-style "k&r")))
	     ;;(c-toggle-auto-hungry-state)))

(add-hook 'c++-mode-hook
	  '(lambda()
	     (c-set-style "stroustrup")))
	     ;;(c-toggle-auto-hungry-state)))

(add-hook 'python-mode-hook 
	  '(lambda()
	     (local-set-key [(control tab)] 'python-complete-symbol)))