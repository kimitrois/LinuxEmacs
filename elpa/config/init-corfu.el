(setq corfu-cycle t
      corfu-auto t
      corfu-quit-at-boundary t
      corfu-quit-no-match t
      corfu-preview-current nil
      corfu-auto-prefix 1
      corfu-auto-delay 0)

(require 'corfu)

(unless (display-graphic-p)
  (require 'popon)
  (require 'corfu-terminal)
  (corfu-terminal-mode +1))

(require 'corfu-info)
(require 'corfu-history)
(corfu-mode t)
(corfu-history-mode t)
(require 'cape)
(add-to-list 'completion-at-point-functions #'cape-file)
(add-to-list 'completion-at-point-functions #'cape-keyword)
(add-to-list 'completion-at-point-functions #'cape-symbol)

(require 'corfu-doc)
(lazy-load-set-keys '(("C-d" . corfu-doc-toggle)
		      ("C-S-n" . corfu-doc-scroll-down)
		      ("C-S-p" . corfu-doc-scroll-up)
		      ("ESC" . corfu-quit)
		      ("C-n" . corfu-next)
		      ("C-p" . corfu-previous))
		    corfu-map)

(require 'kind-icon)
(setq kind-icon-default-face 'corfu-default)
(setq kind-icon-use-icons nil)



(provide 'init-corfu)
