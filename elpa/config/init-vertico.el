(require 'init-orderless)
(require 'vertico)
(require 'consult)
(require 'consult-dir)
(require 'marginalia)

(marginalia-mode t)

(setq vertico-resize nil
      vertico-count 20
      vertico-cycle t)

(setq consult-async-input-debounce 0.1
      consult-async-input-throttle 0.1
      consult-async-refresh-delay 0.1)

(vertico-mode t)


(lazy-load-local-keys '(("DEL" . vertico-directory-delete-char)
			("C-;" . embark-act)) vertico-map "vertico-directory")
(lazy-load-set-keys '(("M-A" . marginalia-cycle))
		    minibuffer-local-map)

(provide 'init-vertico)
