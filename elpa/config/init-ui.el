(require 'init-hide-mode-line)
(require 'init-awesome-tray)

(require 'solaire-mode)
(solaire-global-mode +1)

;; 高亮当前行
;; (global-hl-line-mode nil)

(defun +kyd/toggle-big-font ()
  "切换大字体模式"
  (interactive)
  (if (> +kyd/font-size 17.5)
      (setq +kyd/font-size (- +kyd/font-size 5))
    (setq +kyd/font-size (+ +kyd/font-size 5)))
  (+kyd/set-fonts)
  (+kyd/set-cn-fonts))

(require 'page-break-lines)
(global-page-break-lines-mode t)


(setq window-divider-default-bottom-width 1)
(setq window-divider-default-right-width 1)


(require 'ligature)
(ligature-set-ligatures 'prog-mode '("|||>" "<|||" "<==>" "<!--" "####" "~~>" "***" "||=" "||>"
                                       ":::" "::=" "=:=" "===" "==>" "=!=" "=>>" "=<<" "=/=" "!=="
                                       "!!." ">=>" ">>=" ">>>" ">>-" ">->" "->>" "-->" "---" "-<<"
                                       "<~~" "<~>" "<*>" "<||" "<|>" "<$>" "<==" "<=>" "<=<" "<->"
                                       "<--" "<-<" "<<=" "<<-" "<<<" "<+>" "</>" "###" "#_(" "..<"
                                       "..." "+++" "/==" "///" "_|_" "www" "&&" "^=" "~~" "~@" "~="
                                       "~>" "~-" "**" "*>" "*/" "||" "|}" "|]" "|=" "|>" "|-" "{|"
                                       "[|" "]#" "::" ":=" ":>" ":<" "$>" "==" "=>" "!=" "!!" ">:"
                                       ">=" ">>" ">-" "-~" "-|" "->" "--" "-<" "<~" "<*" "<|" "<:"
                                       "<$" "<=" "<>" "<-" "<<" "<+" "</" "#{" "#[" "#:" "#=" "#!"
                                       "##" "#(" "#?" "#_" "%%" ".=" ".-" ".." ".?" "+>" "++" "?:"
                                       "?=" "?." "??" ";;" "/*" "/=" "/>" "//" "__" "~~" "(*" "*)"
                                       "\\\\" "://"))
(global-ligature-mode t)



(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)


(unless (display-graphic-p)
  (set-face-attribute 'cursor nil :background "black"))

(provide 'init-ui)
