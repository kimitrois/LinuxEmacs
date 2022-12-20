(setq no-littering-etc-directory (expand-file-name "etc" user-emacs-directory)
      no-littering-var-directory (expand-file-name "data" user-emacs-directory))

(require 'no-littering)
(setq auto-save-file-name-transforms
      `((".*" ,(no-littering-expand-var-file-name "auto-save/") t)))

(provide 'init-no-littering)
