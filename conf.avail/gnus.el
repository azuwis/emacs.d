;; gnus config, passwords are stored in ~/.autoinfo.gpg
;; most are from: http://www.newsmth.net/bbscon.php?bid=573&id=23013
;;                http://www.newsmth.net/bbscon.php?bid=573&id=23056
;;                http://www.newsmth.net/bbscon.php?bid=573&id=23073

;;;;;; General setup
(setq gnus-inhibit-startup-message t)
(setq gnus-always-read-dribble-file t)
;; HTML rendering
(setq mm-text-html-renderer 'w3m)
(setq mm-inline-text-html-with-images t)
;; don't use w3m keys in gnus
(setq mm-inline-text-html-with-w3m-keymap nil)
;; function to toggle inline images display, see info emacs-w3m
(defun gnus-summary-w3m-safe-toggle-inline-images (&optional arg)
  "Toggle displaying of all images in the article buffer.
          If the prefix arg is given, force displaying of images."
  (interactive "P")
  (with-current-buffer gnus-article-buffer
    (let ((st (point-min))
	  (nd (point-max))
	  (w3m-async-exec w3m-async-exec))
      (save-restriction
	(widen)
	(if (or (> st (point-min)) (< nd (point-max)))
	    (setq w3m-async-exec nil))
	(article-goto-body)
	(goto-char (or (text-property-not-all (point) (point-max)
					      'w3m-safe-url-regexp nil)
		       (point)))
	(if (interactive-p)
	    (call-interactively 'w3m-toggle-inline-images)
	  (w3m-toggle-inline-images arg))))))

;;;;;; Newsgroup
(setq gnus-select-method '(nntp "news.163.org"))
;; default news groups
(setq gnus-default-subscribed-newsgroups
      '("org.163.sa"
	"org.163.sa.photo"
	"org.163.sa.photo.logcheck"
	"org.163.sa.photo.arpwatch"
	))

;;;;;; Email
(setq gnus-secondary-select-methods
      '(
	;; local maildir
	(nnmaildir ""
		   (directory "~/maildirs/"))
	;; 163.org imap
	(nnimap "imap.163.org"
		(nnimap-address "imap.163.org")
		(nnimap-stream tls))
	))
;; local maildir, use getmail4 to fetch mail, remember to mkdir ~/maildirs/corp/.nnmaildir
(setq mail-sources
      '(
	(maildir :path "~/maildirs/corp/"
                 :subdirs ("cur" "new" "tmp"))
	))

;;;;;; SMTP
;; most are from http://www.emacswiki.org/emacs/MultipleSMTPAccounts
;; passwords are read from ~/.authinfo.gpg

;; different mail address for groups
(setq gnus-posting-styles
      '(("^org." (address "azuwis@163.org"))
	("^nnimap.*" (address "azuwis@163.org"))
	("^nnmaildir.*" (address "jxzhong@corp.netease.com"))
	))

;; available SMTP accounts
(defvar smtp-accounts
  '(
    (ssl "jxzhong@corp.netease.com" "corp.netease.com" 465 nil nil)
    (plain "azuwis@163.org" "smtp.163.org" 25)))

;; default smtpmail.el configurations
(setq message-send-mail-function 'smtpmail-send-it
      mail-from-style nil
      user-full-name "Zhong Jianxin"
      ;; default mail address, override by gnus-posting-styles
      user-mail-address "azuwis@gmail.com"
      ;;message-signature-file "~/emacs/signature"
      smtpmail-debug-info t
      smtpmail-debug-verb t)

(defun set-smtp-plain (server port)
  "Set related SMTP variables for supplied parameters."
  (setq smtpmail-smtp-server server
	smtpmail-smtp-service port
	smtpmail-starttls-credentials nil)
  (message "Setting SMTP server to `%s:%s'."
	   server port address))

(defun set-smtp-ssl (server port key cert)
  "Set related SMTP and SSL variables for supplied parameters."
  (setq starttls-use-gnutls t
	starttls-gnutls-program "mygnutls-cli"
	starttls-extra-arguments nil
	smtpmail-smtp-server server
	smtpmail-smtp-service port
	smtpmail-starttls-credentials (list (list server port key cert)))
  (message
   "Setting SMTP server to `%s:%s'. (SSL enabled.)"
   server port address))

(defun set-smtp-tls (server port key cert)
  "Set related SMTP and TLS variables for supplied parameters."
  (setq starttls-use-gnutls t
        starttls-gnutls-program "gnutls-cli"
        starttls-extra-arguments nil
        smtpmail-smtp-server server
        smtpmail-smtp-service port
        smtpmail-starttls-credentials (list (list server port key cert)))
  (message
   "Setting SMTP server to `%s:%s'. (TLS enabled.)"
   server port address))

(defun change-smtp ()
  "Change the SMTP server according to the current from line."
  (save-excursion
    (loop with from = (save-restriction
			(message-narrow-to-headers)
			(message-fetch-field "from"))
	  for (acc-type address . auth-spec) in smtp-accounts
	  when (string-match address from)
	  do (cond
	      ((eql acc-type 'plain)
	       (return (apply 'set-smtp-plain auth-spec)))
	      ((eql acc-type 'ssl)
	       (return (apply 'set-smtp-ssl auth-spec)))
	      (t (error "Unrecognized SMTP account type: `%s'." acc-type)))
	  finally (error "Cannot interfere SMTP information."))))

(add-hook 'message-send-hook 'change-smtp)

;;;;;; Encoding
(define-coding-system-alias 'x-gbk 'gbk)
(set-language-environment 'Chinese-GB)
(setq gnus-default-charset 'chinese-iso-8bit
      gnus-group-name-charset-group-alist '((".*" . chinese-iso-8bit))
      gnus-summary-show-article-charset-alist
      '((1 . chinese-iso-8bit)
	(2 . gbk)
	(3 . big5)
	(4 . utf-8))
      gnus-newsgroup-ignored-charsets
      '(unknown-8bit x-unknown iso-8859-1))

;;wrap line when write mail
(add-hook 'message-mode-hook
   (lambda ()
     (setq fill-column 72)
     (turn-on-auto-fill)))

;; save sent mail
;;(setq gnus-message-archive-group
;;      '((if (message-news-p)
;;            "nnfolder:mail.sent.news"
;;          "nnfolder:mail.sent.mail")))
