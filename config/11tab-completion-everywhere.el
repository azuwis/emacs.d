;;; 11tab-completion-everywhere.el --- Tab Completion Everywhere

;; Copyright (C) 2007  Jianxin Zhong (azuwis)

;; Author: Jianxin Zhong (azuwis) <azuwis@163.org>
;; Keywords: tools
;; From: http://www.emacsblog.org/2007/03/12/tab-completion-everywhere/

(defun indent-or-expand (arg)
  "Either indent according to mode, or expand the word preceding
point."
  (interactive "*P")
  (if (and
       (or (bobp) (= ?w (char-syntax (char-before))))
       (or (eobp) (not (= ?w (char-syntax (char-after))))))
      (dabbrev-expand arg)
    (indent-according-to-mode)))

(defun my-tab-fix ()
  (local-set-key [tab] 'indent-or-expand))
 
(add-hook 'c-mode-hook          'my-tab-fix)
(add-hook 'sh-mode-hook         'my-tab-fix)
(add-hook 'emacs-lisp-mode-hook 'my-tab-fix)
;;(add-hook 'ruby-mode-hook       'my-tab-fix)
;; more mode hooks, yada yada, etc ...
