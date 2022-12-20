(require 'auto-save)

(auto-save-enable)
(setq auto-save-silent t)
(setq auto-save-disable-predicates
      '((lambda ()
	  (eq major-mode 'ron-mode))))


(provide 'init-auto-save)
