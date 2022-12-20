;; add Melpa&Elpa-sources
(package-initialize)
(eval-when-compile
  (require 'use-package))
(require 'bind-key)                ;; if you use any :bind variant


(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("gnu" . "https://elpa.gnu.org/packages/")
                         ("org" . "http://orgmode.org/elpa/"))) ;; Org-mode's repository
;; add Melpa&Elpa-sources ends here
;(when (eq system-type 'darwin) (customize-set-variable 'native-comp-driver-options '("-Wl,-w")))



(use-package org
  :bind ("C-c c" . org-capture))

(use-package org-preview-html
  :defer t)

(use-package avy
  :bind ("C-c C-SPC" . avy-goto-char-timer))

(use-package benchmark-init
  :ensure t
  :config
  ;; To disable collection of benchmark data after init is done.
  (add-hook 'after-init-hook 'benchmark-init/deactivate))

(use-package emms
  :ensure t)


(use-package counsel
  :ensure t)

(use-package key-chord
  :ensure t)


(use-package all-the-icons
  :ensure t)

(use-package consult
  :ensure t)

;; dashboard 启动页插件
(use-package dashboard
  :ensure t
  :config
  (setq dashboard-banner-logo-title " For it would seem that each of us knows everything that he knows as if in a dream and then again...... ") ;; 个性签名，随读者喜好设置
 ;; (setq dashboard-projects-backend 'projectile) ;; 读者可以暂时注释掉这一行，等安装了 projectile 后再使用
  (setq dashboard-startup-banner 'logo) ;; 也可以自定义图片
  (setq dashboard-center-content t)
  (setq dashboard-set-init-info t)
  (setq dashboard-set-file-icons t)
  ;(setq dashboard-set-footer nil)
  (setq dashboard-modify-heading-icons '((recents . "file-text")
                                        (bookmarks . "book")))
  (setq dashboard-items '((recents  . 10)   ;; 显示多少个最近文件
			  (bookmarks . 5)  ;; 显示多少个最近书签
			 ; (projects . 5)
			  (registers . 7))) ;; 显示多少个最近项目
  (setq dashboard-set-navigator t)
  (setq dashboard-footer-messages '("when he is as it were awake , knows nothing of it all."))
  (setq dashboard-footer-icon (all-the-icons-octicon "dashboard"
                                                   :height 1.1
                                                   :v-adjust -0.05
                                                   :face 'font-lock-keyword-face))
  (dashboard-setup-startup-hook))
;; dashboard 启动页插件 ends here

;; a new shortcut-pre-key
(global-set-key (kbd "C-j") nil)                      ; 清除原来的绑定
(global-set-key (kbd "C-j C-k") 'kill-whole-line)     ; 清除cursor所在行
(global-set-key (kbd "C-M-s-d") 'org-insert-structure-template)                      ; org-mode 快捷插入原< tab功能
(global-set-key (kbd "s-t") 'tab-bar-new-tab)
(global-set-key (kbd "s-w") 'tab-bar-close-tab)


;; hydra 命令组织到一起在minibuffer中可以单键选择
(use-package hydra
  :ensure t)

(use-package use-package-hydra
  :ensure t
  :after hydra)

(use-package use-package
  :ensure t
  :after hydra)

(use-package org-preview-html
  :ensure t
  :after hydra)

;;hydra-ivy
(use-package ivy-hydra
  :ensure t)

;;IVY
(use-package ivy
  :ensure t                          ; 确认安装，如果没有安装过 ivy 就自动安装    
  :init
  (ivy-mode 1)    		     ; 加载后启动 ivy-mode
  (counsel-mode 1)
  :after hydra
  :config                            ; 在加载插件后执行一些命令
  (setq ivy-use-virtual-buffers t)   ; 一些官网提供的固定配置
  (setq ivy-count-format "(%d/%d) ")
  (setq search-default-mode #'char-fold-to-regexp)
  (setq ivy-re-builders-alist '((t . orderless-ivy-re-builder)))
  (add-to-list 'ivy-highlight-functions-alist '(orderless-ivy-re-builder . orderless-ivy-highlight))
  :bind                              ; 以下为绑定快捷键
  (("C-M-s-f" . hydra-ivy-move/body)
  ("C-s" . 'swiper)                  ; 绑定快捷键 C-s 为 swiper-search，替换原本的搜索功能
  ("M-x" . 'counsel-M-x)             ; 使用 counsel 替换命令输入，给予更多提示
  ("C-x C-f" . 'counsel-find-file)   ; 使用 counsel 做文件打开操作，给予更多提示
  ("M-y" . 'counsel-yank-pop)        ; 使用 counsel 做历史剪贴板粘贴，可以展示历史
  ("C-x b" . 'ivy-switch-buffer)     ; 使用 ivy 做 buffer 切换，给予更多提示
  ("C-c v" . 'ivy-push-view)         ; 记录当前 buffer 的信息
  ("C-c s" . 'ivy-switch-view)       ; 切换到记录过的 buffer 位置
  ("C-c V" . 'ivy-pop-view)          ; 移除 buffer 记录
  ("C-x C-SPC" . 'counsel-mark-ring) ; 使用 counsel 记录 mark 的位置
  ("C-j f" . 'avy-goto-word-1)       ; 词首字母移动光标
  ("C-j l" . 'avy-goto-line)         ; 词首字母移动光标
  ("C-j 2" . 'avy-goto-char-2)       ; 输入两个连续字母移动光标
  ("C-j C-w" . 'avy-copy-line)       ; 输入两个连续字母移动光标
  ("C-j C-x" . 'avy-move-line)       ; 输入两个连续字母移动光标  
  ;("C-j p" . 'counsel-describe-function)
  ;("<f1> v" . 'counsel-describe-variable)
  ;("<f1> i" . 'counsel-info-lookup-symbol)
  :map minibuffer-local-map
  ("C-r" . counsel-minibuffer-history))
  :hydra (hydra-ivy-move (:hint nil)
  "
  _c_: copyline _m_: moveline _f_: word1 _l_: go2line _2_: char2 _d_: killine _r_:killregion "
  ("c"   avy-copy-line)
  ("m"   avy-move-line)
  ("f"   avy-goto-word-1 )
  ("l"   avy-goto-line)
  ("2"   avy-goto-char-2)
  ("d"   avy-kill-whole-line)
  ("r"   avy-kill-region)
  ("q"   nil "quit" :color blue)))
;; use IVY ends here


;; amx 这个插件可以记录我们每次调用 M-x 时输入的命令历史，然后每次将最常用的显示在前面
(use-package amx
  :ensure t
  :init (amx-mode))
;; amx ends here

;; mwim 按一次 C-a 时移动到代码文字开头，再按一次则是移动到整行的行首，如此反复,第一次按 C-e 将光标移动到代码尾部、注释之前。再按一次则是移动到整行的行尾
(use-package mwim
  :ensure t
  :bind
  ("C-a" . mwim-beginning-of-code-or-line)
  ("C-e" . mwim-end-of-code-or-line))
;; mwim ends here

;; marginalia 一个为 Emacs minibuffer 中的选项添加注解的插件
(use-package marginalia
  :ensure t
  :init (marginalia-mode)
  :bind (:map minibuffer-local-map
			  ("M-A" . marginalia-cycle)))
;; marginalia ends here
;; rainbow-delimeters 这个插件可以用不同颜色标记多级括号，方便看清代码块
(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))
;; rainbow-delimeters ends here

(setq use-short-answers t) ;yes缩短为y
(setq ring-bell-function 'ignore) ;关闭警告铃声

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;;system coding
(when (fboundp 'set-charset-priority)
  (set-charset-priority 'unicode))

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
;;system coding ends

;;super-save Auto-save buffers, based on your activity.
(use-package super-save
  :ensure t
  :config
  (super-save-mode +1))

(setq super-save-auto-save-when-idle t)
(setq auto-save-default nil)
;;super-save Auto-save buffers, based on your activity.ends

;;key-chord with consult packages
(require 'consult)
(require 'key-chord)
 (key-chord-mode 1)
(add-hook 'on-first-input-hook 'key-chord-mode)
(key-chord-define-global "cy" 'consult-yank-pop)
(key-chord-define-global "rj" 'consult-register)
(key-chord-define-global "bf" 'consult-buffer)
(key-chord-define-global "jk" 'undo)
(key-chord-define-global ",." 'hippie-expand)
(key-chord-define-global "fr" 'consult-recent-file)
;;key-chord ends



;;orderless
(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic)
  (completion-category-overrides '((file (styles basic partial-completion)))))
  :config
  (setq completion-styles '(orderless partial-completion)
      completion-category-defaults nil
      completion-category-overrides '((file (styles . (partial-completion))))))
;;orderless ends

;;; basic configuration
(electric-pair-mode t) ;自动补全括号
(add-hook 'prog-mode-hook #'show-paren-mode) ;编程模式下，光标在括号上时高亮另一个括号
(delete-selection-mode t) ; 选中文本后输入文本会替换文本
(global-display-line-numbers-mode 1) ; 在 Window 显示行号
(global-set-key (kbd "RET") 'newline-and-indent) ; 回车新起一行并做缩进
(global-set-key (kbd "M-w") 'kill-region)              ; 交换 M-w 和 C-w，M-w 为剪切
(global-set-key (kbd "C-w") 'kill-ring-save)           ; 交换 M-w 和 C-w，C-w 为复制
(global-set-key (kbd "C-c '") 'comment-or-uncomment-region) ; 为选中的代码加注释/去注释
;; cursor move 10 lines
(defun next-ten-lines()
  "Move cursor to next 10 lines."
  (interactive)
  (next-line 10))

(defun previous-ten-lines()
  "Move cursor to previous 10 lines."
  (interactive)
  (previous-line 10))

(global-set-key (kbd "M-n") 'next-ten-lines)            ; 光标向下移动 10 行
(global-set-key (kbd "M-p") 'previous-ten-lines)        ; 光标向上移动 10 行
;; cursor move 10 lines ends here


;; Wrap line
(global-visual-line-mode 1)


;; plugin yaml-mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yaml\\'" . yaml-mode))

 (add-hook 'yaml-mode-hook
     #'(lambda ()
         (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

;; use all-the-icon
(when (display-graphic-p)
  (require 'all-the-icons))

;; all-the-icons theme
(setq inhibit-compacting-font-caches t)
(setq neo-theme 'icons)
(put 'upcase-region 'disabled nil)



































(setq eaf-python-command "/usr/bin/python3.10")


;; (add-to-list 'load-path "~/.emacs.d/site-lisp/emacs-application-framework/")
;; (add-to-list 'load-path "/home/dky/.emacs.d/site-lisp/emacs-application-framework/")

;; (require 'eaf)

;; (require 'eaf-browser)
;; (require 'eaf-pdf-viewer)
;; ;(require 'eaf-mindmap)
;; (require 'eaf-music-player)

;; (require 'eaf-file-manager)             
;; (require 'eaf-file-browser)

;; (require 'eaf-org-previewer)
;; (require 'eaf-video-player)
;; (require 'eaf-markdown-previewer)
;; (require 'eaf-image-viewer)
;; (require 'eaf-git)
;; (require 'eaf-airshare)

;; (defun adviser-find-file (orig-fn file &rest args)
;;   (let ((fn (if (commandp 'eaf-open) 'eaf-open orig-fn)))
;;     (pcase (file-name-extension file)
;;       ("pdf"  (apply fn file nil))
;;       ("epub" (apply fn file nil))
;;       (_      (apply orig-fn file args)))))
;; (advice-add #'find-file :around #'adviser-find-file)

;; (setq eaf-browser-continue-where-left-off t)
;; (setq browse-url-browser-function 'eaf-open-browser)
;; (defalias 'browse-web #'eaf-open-browser)
;; (setq eaf-browser-download-path "/home/dky/Downloads/")
;; (setq eaf-browser-enable-adblocker t)
;; (setq eaf-browser-remember-history nil)
;; (setq eaf-browse-blank-page-url "https://duckduckgo.com")
;; ;(setq eaf-browser-enable-plugin nil)
;; ;(setq eaf-browser-enable-javascript nil)


;; (setq eaf-proxy-type "http")
;; (setq eaf-proxy-host "192.168.31.68")
;; (setq eaf-proxy-port "7890")


;; ;;VPN
;; (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3") ; 不加这一句可能有问题，建议读者尝试一下
;; (setq url-proxy-services '(("no_proxy" . "^\\(192\\.168\\..*\\)")
;;                            ("http" . "http://192.168.31.68:7890")
;; 			   ("https" . "http://192.168.31.68:7890")))
;;VPN ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(avy benchmark-init engine-mode yaml-mode use-package-hydra super-save rainbow-delimiters orderless mwim marginalia key-chord ivy-hydra dashboard counsel consult amx all-the-icons))
 '(warning-suppress-types '((comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )










;; (add-to-list 'load-path "~/.emacs.d/site-lisp/emacs-application-framework/")
;; (require 'eaf)

;; (require 'eaf-browser)
;; (require 'eaf-pdf-viewer)
