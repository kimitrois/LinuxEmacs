;;;###autoload
(defun +kyd/set-cn-fonts ()
  (interactive)
  (dolist (charset '(kana han symbol cjk-misc bopomofo chinese-gbk))
    (set-fontset-font
     "fontset-default"
     charset
     (font-spec :name +kyd/cn-font
                :weight 'bold
                :slant 'normal
                :size +kyd/font-size))))
;;;###autoload
(defun +kyd/set-fonts ()
  (interactive)
  (when (window-system)
    (progn
      ;; 设置Emoji字体
      (let ((fonts '("Noto Color Emoji")))
        (cl-loop with script = (if (>= emacs-major-version 28)
        'emoji 'unicode)
                 for font in fonts
                 when (member font (font-family-list))
                 return (set-fontset-font t script (font-spec
						    :family font) nil 'prepend)))
      ;; 设置default face字体
      (set-face-attribute
       'default nil
       :font (font-spec :family +kyd/en-font
                        :weight 'normal
                        :slant 'normal
                        :size +kyd/font-size))
      ;; 设置fixed-pitch-serif face字体
      (set-face-attribute
       'fixed-pitch-serif nil
       :font (font-spec :family +kyd/en-font
                        :weight 'normal
                        :slant 'italic
                        :size +kyd/font-size))
      (+kyd/set-cn-fonts))))

(setq +kyd/en-font "RobotoMono Nerd Font"
      +kyd/cn-font "LXGW wenkai"
      +kyd/font-size 13.5)

;; (set-default-coding-systems 'utf-8) 
;; (setq default-buffer-file-coding-system 'utf-8) 
;; (set-terminal-coding-system 'utf-8) 
;; (set-keyboard-coding-system 'utf-8) 
;; (set-language-environment "Chinese-GB")
;; ;(set-locale-environment "UTF-8")
;; (prefer-coding-system 'utf-8) 
;; (prefer-coding-system 'gb18030)


(set-language-environment               "UTF-8")     ;; System default coding
(prefer-coding-system                   'utf-8)      ;; prefer
(set-buffer-file-coding-system          'utf-8-unix) ;;
(set-charset-priority                   'unicode)    ;;
(set-clipboard-coding-system            'utf-8-unix) ;; clipboard
(set-default-coding-systems             'utf-8)      ;; buffer/file: 打开文件时的默认编码
(set-file-name-coding-system            'utf-8-unix) ;; unix/linux/macos
(set-keyboard-coding-system             'utf-8-unix) ;; keyboard
(set-next-selection-coding-system       'utf-8-unix) ;; selection
(set-selection-coding-system            'utf-8)      ;; selection
(set-terminal-coding-system             'utf-8-unix) ;; terminal
(setq coding-system-for-read            'utf-8)      ;;
(setq default-buffer-file-coding-system 'utf-8)      ;;
(setq locale-coding-system              'utf-8)      ;; local

(provide 'init-font)
