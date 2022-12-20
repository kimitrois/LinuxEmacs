(require 'rime)
(setq default-input-method "rime")
(setq rime-librime-root "~/.emacs.ub/librime/dist")
(setq rime-emacs-module-header-root "/opt/homebrew/Cellar/emacs-plus@28/28.2/include")
(setq rime-user-data-dir (expand-file-name "~/Library/Rime" ))
;;(setq rime-share-data-dir (expand-file-name "rime" user-emacs-directory ))
(setq rime-posframe-properties
      (list :background-color "#2E3440"
            :foreground-color "#ECEFF4"
            ;; :font evan/en-font-name
            :internal-border-width 0))
(setq default-input-method "rime"
      rime-show-candidate 'posframe)

(lazy-load-global-keys '(("C-'" . toggle-input-method))
		       "rime")
(lazy-load-global-keys '(("C-`" . rime-send-keybinding))
		       "rime") 
(set-face-attribute 'rime-highlight-candidate-face nil :width 'normal :inherit 'highlight)
(provide 'init-rime)  
