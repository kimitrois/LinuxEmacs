;; 打开emacs后必须立刻使用的
(enable-theme 'ef-dark)
(require 'init-ui)
(require 'init-better-default)
(require 'init-generic)
(require 'init-emacs)
(require 'init-mode)
(require 'lazy-load)

;; 打开窗口后再使用
(add-hook 'window-setup-hook (lambda ()
			       (+kyd/set-fonts)
			       (+kyd/scratch-setup)
			     ;  (require 'lazy-load)
       			       (require 'one-key)
		              ; (require 'meow)
			       (require 'init-one-key)
			      ; (require 'init-meow)
			       (require 'init-key)
			       (require 'init-window)))
			       

;; 延迟启动
(run-with-idle-timer 0.4 nil (lambda ()
			       (require 'init-ivy)
			       (require 'init-auto-save)
         		       ;(require 'init-helpful)
       		               (require 'init-rime)
			       (require 'init-orderless)
       			      ;(require 'init-lsp-bridge)
			       (require 'init-face)
			       (require 'init-avy)
			       (require 'init-mwim)

			       (setq gc-cons-threshold (* 10240 10000))))

			      

(provide 'init-config)

