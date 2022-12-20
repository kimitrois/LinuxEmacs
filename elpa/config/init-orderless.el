(require 'orderless)

(setq completion-styles  '(orderless basic flex)
      completion-category-defaults nil
      completion-category-overrides '((file (styles . (partial-completion)))))
(provide 'init-orderless)
