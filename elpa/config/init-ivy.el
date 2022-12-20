(require 'swiper)
(require 'ivy)
(require 'ivy-rich)
(require 'counsel)
(require 'amx)
;(require 'init-ivy-pinyin)
(ivy-mode t)
(ivy-rich-mode t)
(ivy-rich-project-root-cache-mode t)
(amx-mode t)

(setq-default ivy-use-virtual-buffers t
	      ivy-height 20)


(add-to-list 'ivy-height-alist (cons 'counsel-switch-buffer 20))

(setq-default counsel-search-engine 'google)

(one-key-create-menu "Counsel"
		     '((("w" . "Switch desktop window.") . counsel-wmctrl)
		       (("s" . "Use search engine.") . counsel-search)))
		      ; (("d" . "Run linux app") . counsel-linux-app)))

(setq ivy-initial-inputs-alist nil)
(provide 'init-ivy)
