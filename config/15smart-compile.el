;; Load smart compile +
;; See http://www.emacswiki.org/cgi-bin/wiki/smart-compile%2B.el
;; ref. http://homepage.mac.com/zenitani/elisp-j.html#smart-compile
(when (require 'smart-compile+ "smart-compile+" t)
  (global-set-key "\C-c\C-c" 'smart-compile)
  (add-hook 'c-mode-common-hook
            (lambda ()(local-set-key "\C-c\C-c" 'smart-run)))
  (add-hook 'sh-mode-hook
            (lambda ()(local-set-key "\C-c\C-c" 'smart-run)))
  )
