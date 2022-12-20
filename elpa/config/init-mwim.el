(require 'mwim)
(lazy-load-unset-keys '("C-a" "C-e"))
(lazy-load-global-keys
 '(("C-a" . mwim-beginning-of-code-or-line))
 "mwim-beginning-of-code-or-line")
(lazy-load-global-keys
 '(("C-e" . mwim-end-of-code-or-line))
 "mwim-end-of-code-or-line")

(lazy-load-global-keys
 '(("C-w" . kill-ring-save))
 "kill-ring-save")

(lazy-load-global-keys
 '(("M-w" . kill-region))
 "kill-region")


(provide 'init-mwim)
