(require 'dirvish)
(require 'dirvish-side)
(dirvish-override-dired-mode)
(lazy-load-set-keys '(("-" . dired-up-directory)
		      ("l" . dired-find-file))
		    dirvish-mode-map)

(add-hook 'dirvish-mode-hook (lambda ()
			       (+dky/meow-add-motion-mode-alist 'dired-mode)
			       (meow-define-keys
				   'motion
				 '("h" . dired-up-directory)
				 '("l" . dired-find-file)
				 '("x" . dired-do-flagged-delete)
				 )
			       (golden-ratio-mode nil)))

(defun +kyd/dirvish-side-current-path ()
  (interactive)
  (dirvish-side buffer-file-name))

;; FACE
;; (set-face-background 'dirvish-hl-line (face-background 'default))

(provide 'init-dirvish)
