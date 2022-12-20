(require 'grammatical-edit)

;; (grammatical-edit-mode 1)
(lazy-load-set-keys '(("\"" . grammatical-edit-double-quote)
		      ("(" . grammatical-edit-open-round)
		      ("[" . grammatical-edit-open-bracket)
		      ("{" . grammatical-edit-open-curly)
		      (")" . grammatical-edit-close-round)
		      ("]" . grammatical-edit-close-bracket)
		      ("}" . grammatical-edit-close-curly))
		    grammatical-edit-mode-map)

(provide 'init-grammatical-edit)
