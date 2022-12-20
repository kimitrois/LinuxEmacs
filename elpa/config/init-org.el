(require 'org-modern)
(require 'init-valign)
(require 'org-html-themify)
(require 'doom-themes)
(require 'init-org-appear)

(setq org-html-themify-themes
      '((dark . doom-tokyo-night)
	(light . doom-tomorrow-day)))

(autoload '+kyd/setup-org-capture "init-org-capture")
(autoload '+kyd/setup-org-agenda "init-org-agenda")

(add-hook 'org-mode-hook
	  (lambda ()
	    (global-org-modern-mode +1)
	    (org-html-themify-mode t)
	    (+kyd/setup-org-capture)))

(+kyd/setup-org-agenda)
(+kyd/setup-org-capture)

(provide 'init-org)
