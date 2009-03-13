;;; backup.el --- Backup Policy

(setq make-backup-files t)
(setq version-control t)
(setq kept-old-versions 1)
(setq kept-new-versions 2)
(setq delete-old-versions t)
(setq backup-directory-alist '(("" . "~/tmp/emacs")))

;;; backup.el ends here
