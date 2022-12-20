(require 'org-capture)

(setq org-todo-keywords
      '((sequence "TODO(t)" "PLANNING(p)" "IN-PROGRESS(i@/!)" "VERIFYING(v!)" "BLOCKED(b@)"  "|" "DONE(d!)" "OBE(o@!)" "WONT-DO(w@/!)" )
        ))
;TODO states ends
;; Capture Template for "General TODO notes"

;; TODO colors
(setq org-todo-keyword-faces
      '(
        ("TODO" . (:foreground "GoldenRod" :weight bold))
        ("PLANNING" . (:foreground "DeepPink" :weight bold))
        ("IN-PROGRESS" . (:foreground "LimeGreen" :weight bold))
        ("VERIFYING" . (:foreground "DarkOrange" :weight bold))
        ("BLOCKED" . (:foreground "Red" :weight bold))
        ("DONE" . (:foreground "Cyan" :weight bold))
        ("OBE" . (:foreground "Cyan" :weight bold))
        ("WONT-DO" . (:foreground "Cyan" :weight bold))
        ))
;; TODO colors ends

(defun +kyd/setup-org-capture ()
  (push '("j" "我的日志" entry (file+headline"~/Documents/JianGuo/org/diary.org" "日志") "* %U - %^{标题}\n  %?") org-capture-templates)
  (push '("i" "我的闪念" entry (file+headline "~/Documents/JianGuo/org/idea.org" "闪念") "* %U - %^{标题} %^g\n  %?\n") org-capture-templates)
  (push '("k" "我的百科" entry (file+headline "~/Documents/JianGuo/org/wiki.org" "WIKI") "* %^{标题} %t %^g\n  %?\n") org-capture-templates)
  (push '("t" "TODO" entry (file+headline "~/Documents/JianGuo/org/todo.org" "TODO") "* %^{标题} %t %^g\n  %?\n") org-capture-templates)
  (push '("g" "General To-Do" entry (file+headline "~/Documents/JianGuo/org/gtodo.org" "General Tasks") "* TODO [#B] %?\n:Created: %T\n " :empty-lines 0) org-capture-templates))

(provide 'init-org-capture)
