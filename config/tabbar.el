;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; tabbar
(require 'tabbar)
(tabbar-mode)
;; 热键设置
;; 用WIN键和j,k,n,p,鼠标来转换tab
;; WIN+j或WIN+鼠标左键: 左tab
;; WIN+k或WIN+鼠标右键: 右tab
;; WIN+p或WIN+鼠标滚轮上滚: 上一个组
;; WIN+n或WIN+鼠标滚轮下滚: 下一个组
;; move to previous group
(global-set-key (kbd "s-p") 'tabbar-backward-group)
(global-set-key [s-mouse-4] 'tabbar-backward-group)
;; move to next group
(global-set-key (kbd "s-n") 'tabbar-forward-group)
(global-set-key [s-mouse-5] 'tabbar-forward-group)
;; move to the left tab
(global-set-key (kbd "s-j") 'tabbar-backward)
(global-set-key [s-mouse-1] 'tabbar-backward)
;; move to the right tab
(global-set-key (kbd "s-k") 'tabbar-forward)
(global-set-key [s-mouse-3] 'tabbar-forward)
;; 组内循环滚动tab
(setq tabbar-cycling-scope (quote tabs))
;; 外观设置
;; tab内凹表明选定
(custom-set-faces
 '(tabbar-default-face
   ((t (:inherit variable-pitch
		 :background "#EFEBE7"
		 :foreground "gray60"
		 :height 0.8))))
 '(tabbar-selected-face
   ((t (:inherit tabbar-default-face
		 :foreground "darkred"
		 :box (:line-width 2 :color "white" :style pressed-button)))))
 '(tabbar-unselected-face
   ((t (:inherit tabbar-default-face
		 :foreground "black")))))
;;        :box (:line-width 2 :color "white" :style released-button))))))


;; 把每个 buffer 同时加入它所在的 major mode 的组和 一个叫做 "default" 的组
(setq tabbar-buffer-groups-function 'tabbar-buffer-ignore-groups)

(defun tabbar-buffer-ignore-groups (buffer)
  "Return the list of group names BUFFER belongs to.
Return only one group for each buffer."
  (with-current-buffer (get-buffer buffer)
    (cond
     ((or (get-buffer-process (current-buffer))
          (memq major-mode
                '(comint-mode compilation-mode)))
      '("Process")
      )
     ((member (buffer-name)
              '("*scratch*" "*Messages*"))
      '("Common")
      )
     ((eq major-mode 'dired-mode)
      '("Dired")
      )
     ((memq major-mode
            '(help-mode apropos-mode Info-mode Man-mode))
      '("Help")
      )
     ((memq major-mode
            '(rmail-mode
              rmail-edit-mode vm-summary-mode vm-mode mail-mode
              mh-letter-mode mh-show-mode mh-folder-mode
              gnus-summary-mode message-mode gnus-group-mode
              gnus-article-mode score-mode gnus-browse-killed-mode))
      '("Mail")
      )
     (t
      (list 
       "default" ;; no-grouping
       (if (and (stringp mode-name) (string-match "[^ ]" mode-name))
           mode-name
         (symbol-name major-mode)))
      )
     
     )))

