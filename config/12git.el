;;; 12git.el --- emacs config for git

;; Copyright (C) 2007  Jianxin Zhong (azuwis)

;; Author: Jianxin Zhong (azuwis) <azuwis@163.org>
;; Keywords: extensions

(setq load-path (cons (expand-file-name "/usr/share/doc/git-core/contrib/emacs") load-path))
(require 'vc-git)
(when (featurep 'vc-git) (add-to-list 'vc-handled-backends 'git))
(require 'git)
(autoload 'git-blame-mode "git-blame"
          "Minor mode for incremental blame for Git." t)