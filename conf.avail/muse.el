;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; muse
(require 'muse-mode)			; load authoring mode
     
(require 'muse-html)			; load publishing styles I use
(require 'muse-latex)
(require 'muse-texinfo)
(require 'muse-docbook)
(require 'muse-wiki)
(require 'muse-journal)

(require 'muse-project)


(unless (assoc "my-html" muse-publishing-styles)
  (muse-derive-style "my-html" "html"
                     :header "~/git/muse/templates/my/header.html"
                     :footer "~/git/muse/templates/my/footer.html"))

(unless (assoc "my-journal-html" muse-publishing-styles)
  (muse-derive-style "my-journal-html" "journal-html"
                     :header "~/git/muse/templates/my/header.html"
                     :footer "~/git/muse/templates/my/footer.html"))

(unless (assoc "mirror-html" muse-publishing-styles)
  (muse-derive-style "mirror-html" "html"
                     :header "~/git/muse/templates/mirror/header.html"
                     :footer "~/git/muse/templates/mirror/footer.html"))
     
(setq muse-project-alist
      '(("Website"
         ("~/git/muse/draft/my"
          :force-publish ("WikiIndex")
          :default "index")
         (:base "my-html" :path "~/public_html")
	 ;;         (:base "pdf" :path "~/muse/publish/default/pdf")
         )

	("Azuwis' Journal"
         ("~/git/muse/draft/journal"
          :default "journal")
         (:base "my-journal-html" :path "~/public_html")
	 (:base "journal-rss" 
	  :base-url "http://azuwis.frihost.net/"
	  :path "~/public_html"))
	
	("Mirror"
         ("~/git/muse/draft/mirror"
          :force-publish ("WikiIndex")
          :default "WelcomePage")
         (:base "mirror-html" :path "/ssh:mirror.6600.org:/home/azuwis/public_html/website"))

        ("WikiPlanner" ;; use value of `planner-project'
         ("~/git/muse/draft/plans" ;; where your Planner pages are located
          :force-publish ("WikiIndex")
          :default "PlanIndex" ;; use value of `planner-default-page'
          :major-mode planner-mode
          :visit-link planner-visit-link)
         (:base "planner-html"
                ;; value of `planner-publishing-directory'
                :path "~/public_html/plans"))
        ))

;(setq muse-html-style-sheet "<link rel=\"stylesheet\"
;type=\"text/css\" charset=\"utf-8\" media=\"all\"
;href=\"style.css\" />
;")

;;(setq muse-html-footer "~/muse/templates/footer.html")
;;(setq muse-html-header "~/muse/templates/header.html")

;; set date format
(setq muse-journal-date-format "%Y年%m月%e, 周%a")

(setq muse-publishing-directives '("titie" "date" "author"))

;;(setq muse-file-extension "muse")

;;(setq muse-html-encoding-default "UTF-8")

;;(setq muse-html-meta-content-encoding 'UTF-8)

(defun my-muse-project-find-file (project)
  (interactive)
  (let ((muse-current-project (muse-project project)))
    (call-interactively 'muse-project-find-file)))

(global-set-key "\C-cpd" #'(lambda () (interactive)
                             (my-muse-project-find-file "Website")))

;;(setq planner-project "WikiPlanner")
