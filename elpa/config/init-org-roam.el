(require 'org)
(require 'init-org)
(require 'org-roam)
(global-page-break-lines-mode 0)
(setq org-roam-directory (file-truename "~/Documents/JianGuo/org/roam"))

(setq org-roam-v2-ack t)
(setq org-roam-mode-sections
        (list #'org-roam-backlinks-insert-section
              #'org-roam-reflinks-insert-section
              #'org-roam-unlinked-references-insert-section))

(org-roam-db-autosync-enable)

(setq org-roam-capture-templates
          '(("s" "standard" plain "%?"
     :if-new
     (file+head "standard/%<%Y%m%d%H%M%S>-${slug}.org"
      "#+title: ${title}\n#+filetags: \n\n ")
     :unnarrowed t)
        ("d" "definition" plain
         "%?"
         :if-new
         (file+head "definition/${slug}.org" "#+title: ${title}\n#+filetags: definition \n\n* Definition\n\n\n* Examples\n")
         :unnarrowed t)
        ("a" "Academy" plain "%?"
				      :target (file+head "Academy/${slug}.org"
							 "#+TITLE: ${title}\n#+CREATED: %U\n#+MODIFIED: \n"))
        ("b" "Books" plain "%?"
				      :target (file+head "books/${slug}.org"
							 "#+TITLE: ${title}\n#+CREATED: %U\n#+MODIFIED: \n"))
        ("t" "Teaching")
        ("tn" "NewConcept" plain "%?"
				      :target (file+head "Teaching/NewConcept/${slug}.org"
							 "#+TITLE: ${title}\n#+CREATED: %U\n#+filetags: NewConcept\n#+MODIFIED: \n"))
        ("tf" "ForReal" plain "%?"
				      :target (file+head "Teaching/ForReal/${slug}.org"
							 "#+TITLE: ${title}\n#+CREATED: %U\n#+filetags: ForReal\n#+MODIFIED: \n"))
        ("c" "Computer" plain "%?"
                                      :target (file+head "CS/${slug}.org"
                                                         "#+TITLE: ${title}\n#+CREATED: %U\n#+filetags: CS\n#+MODIFIED: \n"))
        ("r" "ref" plain "%?"
           :if-new (file+head "reference/${title}.org" "#+title: ${slug}: ${title}\n \n#+filetags: reference ${keywords} \n
\n* ${title}\n\n
\n* Summary
\n\n\n* Rough note space\n")
           :unnarrowed t)))




(cl-defmethod org-roam-node-type ((node org-roam-node))
     "Return the TYPE of NODE."
     (condition-case nil
          (file-name-nondirectory
           (directory-file-name
            (file-name-directory
             (file-relative-name (org-roam-node-file node) org-roam-directory))))
        (error "")))
(setq org-roam-node-display-template
      (concat "${type:15} ${title:*} " (propertize "${tags:10}" 'face 'org-tag)))

 (with-eval-after-load 'org-roam
   (cl-defmethod org-roam-node-directories ((node org-roam-node))
     (if-let ((dirs (file-name-directory (file-relative-name (org-roam-node-file node) org-roam-directory))))
          (format "(%s)" (car (split-string dirs "/")))
        "")))

(cl-defmethod org-roam-node-backlinkscount ((node org-roam-node))
	(let* ((count (caar (org-roam-db-query
			     [:select (funcall count source)
				      :from links
				      :where (= dest $s1)
				      :and (= type "id")]
			     (org-roam-node-id node)))))
	  (format "[%d]" count)))

(setq org-emphasis-alist
        '(("*" (bold))
          ("/" italic)
          ("_" underline)
          ("=" red)
          ("~" code)
          ("+" (:strike-through t))))

(add-to-list 'display-buffer-alist
             '("\\*org-roam\\*"
               (display-buffer-in-side-window)
               (side . right)
               (slot . 0)
               (window-width . 0.33)
               (window-parameters . ((no-other-window . t)
                                     (no-delete-other-windows . t)))))

(setq org-roam-mode-sections
      (list #'org-roam-backlinks-section
            #'org-roam-reflinks-section
            ;; #'org-roam-unlinked-references-section
            ))

(setq org-roam-mode-sections
      '((org-roam-backlinks-section :unique t)
        org-roam-reflinks-section))

(provide 'init-org-roam)
