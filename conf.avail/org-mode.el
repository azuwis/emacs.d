;; from http://members.optusnet.com.au/%7Echarles57/GTD/mydotemacs.txt

;; C-c g to open gtd file
(defun gtd ()
  (interactive)
  (find-file "~/git/org/gtd.org")
  )
(global-set-key (kbd "C-c g") 'gtd)

(setq org-log-done t)
(setq org-agenda-files
      (list "~/git/org/gtd.org"))

;; agenda
(define-key global-map "\C-ca" 'org-agenda)
(add-hook 'org-agenda-mode-hook 'hl-line-mode)
(setq org-agenda-custom-commands
      '(
	("P" "Projects"   
	 ((tags "PROJECT")))

	("H" "Office and Home Lists"
	 ((agenda)
          (tags-todo "OFFICE")
          (tags-todo "HOME")
          (tags-todo "COMPUTER")
          (tags-todo "DVD")
          (tags-todo "READING")))

	("D" "Daily Action List"
	 (
          (agenda "" ((org-agenda-ndays 1)
                      (org-agenda-sorting-strategy
                       (quote ((agenda time-up priority-down tag-up) )))
                      (org-deadline-warning-days 0)
                      ))))
	)
      )

;; remember-mode
(setq org-directory "~/git/org/")
(setq remember-annotation-functions '(org-remember-annotation))
(setq remember-handler-functions '(org-remember-handler))
(add-hook 'remember-mode-hook 'org-remember-apply-template)
(define-key global-map "\C-cr" 'org-remember)
(setq org-remember-templates
     '(
      ("Todo" ?t "* TODO %^{Brief Description} %^g\n%?\nAdded: %U" "gtd.org" "Tasks")
      ("Private" ?p "\n* %^{topic} %T \n%i%?\n" "privnotes.org")
      ("WordofDay" ?w "\n* %^{topic} \n%i%?\n" "wotd.org")
      ))
