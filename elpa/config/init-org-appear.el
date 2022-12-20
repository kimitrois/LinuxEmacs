(require 'org-appear)

(with-eval-after-load 'org
  (setq org-appear-autolinks t)
  (setq org-appear-autoentities t)
  (setq org-appear-autosubmarkers t)
  (setq org-hide-emphasis-markers t))

(provide 'init-org-appear)
