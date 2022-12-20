(require 'sort-tab)

(sort-tab-mode t)

(one-key-create-menu
 "sort-tab"
 '((("h" . "Switch to previous tab") . sort-tab-select-prev-tab)
   (("l" . "Switch to next tab") . sort-tab-select-next-tab)
   (("L" . "Switch to last tab") . sort-tab-select-last-tab)
   (("H" . "Switch to first tab") . sort-tab-select-first-tab)
   (("d" . "Close current tab") . sort-tab-close-current-tab)))



;; (set-face-attribute 'sort-tab-current-tab-face nil
;; 		    :background (face-background 'highlight)
;; 		    :foreground (face-attribute 'highlight :foreground))

;; (set-face-attribute 'sort-tab-separator-face nil
;; 		    :background nil
;; 		    :foreground (face-attribute 'font-lock-comment-face :foreground))

;; (set-face-attribute 'sort-tab-other-tab-face nil
;; 		    :background (face-background 'default )
;; 		    :foreground (face-foreground 'default))

(provide 'init-sort-tab)
