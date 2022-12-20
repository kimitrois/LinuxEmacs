;;;###autoload
(defun +kyd/find-emacs-config()
  (interactive)
  (counsel-find-file (expand-file-name "~/.emacs.d/elpa/config")))

;;;###autoload
(defun +kyd/reload-load-path ()
  (interactive)
  (add-subdirs-to-load-path "~/.emacs.d/"))

(defun +kyd/find-emacs-config-2()
  (interactive)
  (read-file-name "init file" (expand-file-name "~/.emacs.d/elpa/config")))

;;;###autoload
(defun +clean-theme()
  (interactive)
  (mapc #'disable-theme custom-enabled-themes))


;;;###autoload
(defun +kyd/toggle-proxy ()
  (interactive)
  (if (null url-proxy-services)
      (progn
        (setq url-proxy-services
              '(("http" . "127.0.0.1:7890")
                ("https" . "127.0.0.1:7890")))
        (message "代理已开启."))
    (setq url-proxy-services nil)
    (message "代理已关闭.")))

(defun +kyd/yank-buffer-file-name ()
  (interactive)
  (push buffer-file-name kill-ring))

;;;###autoload
(defun +kyd/toggle-transparent ()
  (interactive)
  (if (eq (frame-parameter (selected-frame) 'alpha-background) 100)
      (set-frame-parameter (selected-frame) 'alpha-background 50)
    (set-frame-parameter (selected-frame) 'alpha-background 100)))


;; (add-to-list 'default-frame-alist '(alpha-background . 50))

;;;;###autoload
;(defun +kyd/byte-compile-pkg ()
;  ;; TODO 实现将第三方包进行字节编译优化的函数
;  (interactive)
;  (byte-recompile-directory "~/.emacs.d/site-lisp/pkg" 0 nil))

(toggle-frame-fullscreen)
(provide 'init-emacs)
