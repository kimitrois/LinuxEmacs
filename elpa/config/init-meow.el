(require 'meow)
(meow-global-mode nil)
(setq meow-use-clipbaord  t)
(setq meow-keypad-ctrl-meta-prefix nil)
(setq meow-keypad-start-keys '(;; (?c . ?c)
			       (?h . ?h) (?x . ?x)))

;; (setq meow-local-leader-keymap (make-sparse-keymap))

(setq +kyd/meow-motion-mode-alist nil) ; 为motion特殊处理过的mode列表

(defun +kyd/meow-add-motion-mode-alist (mode)
  (unless (-contains-p +kyd/meow-motion-mode-alist mode)
    (push mode +kyd/meow-motion-mode-alist)))


(defun lazy-meow-leader-define-key (&rest keybinds)
  (let* ((meow-leader-keybinds))
    (dolist (ele  keybinds)
      (let ((func (cdar ele))
	    (key (caar ele))
	    (filename (cadr ele)))
	(autoload func filename nil t)
	(meow-define-keys 'leader (cons key func))))))

(defun meow-setup ()
  (setq meow-cheatsheet-layout 'meow-cheatsheet-layout-qwerty)
  (meow-motion-overwrite-define-key
   '("j" . meow-next)
   '("k" . meow-prev)
   '("h" . meow-left)
   '("l" . meow-right)
   '("o" . meow-block)
   '("x" . meow-line)
   '("<escape>" . ignore))
  
  (meow-leader-define-key
   ;; SPC j/k will run the original command in MOTION state.
   '("t" . one-key-menu-toggle)
   '("f" . one-key-menu-file)
   '("s" . one-key-menu-search)
   '("b" . one-key-menu-buffer)
   '("c" . one-key-menu-code)
   '("u" . one-key-menu-useful)
   '("g" . one-key-menu-nagivator)
   '("p" . one-key-menu-project)
   '("v" . one-key-menu-magit)
   '("o" . one-key-menu-org)
   ;; Use SPC (0-9) for digit arguments.
   '("1" . meow-digit-argument)
   '("2" . meow-digit-argument)
   '("3" . meow-digit-argument)
   '("4" . meow-digit-argument)
   '("5" . meow-digit-argument)
   '("6" . meow-digit-argument)
   '("7" . meow-digit-argument)
   '("8" . meow-digit-argument)
   '("9" . meow-digit-argument)
   '("0" . meow-digit-argument)
   '("/" . meow-keypad-describe-key)
   '("?" . meow-cheatsheet)
   '("SPC" . project-find-file)
   '("-" . lsp-bridge-jump-to-next-diagnostic)
   )

  (lazy-meow-leader-define-key
   '(("w" . one-key-menu-window) "init-window")
   '(("p" . one-key-menu-project)  "init-project")
   '(("TAB" . one-key-menu-sort-tab) "init-sort-tab")
   '(("e" . one-key-menu-eaf) "init-eaf")
   '(("n" . one-key-menu-blog) "init-org")
   '(("Z" . one-key-menu-hs) "init-hideshow")
   '(("r" . +kyd/project-recentf) "init-project")
   )
  
  (meow-normal-define-key
   '("C-j" . (lambda ()
	       (interactive)
	       (dotimes (i 2)
		 (call-interactively 'meow-next))))
   '("C-k" . (lambda ()
	       (interactive)
	       (dotimes (i 2)
		 (call-interactively 'meow-prev))))
   '("0" . meow-expand-0)
   '("9" . meow-expand-9)
   '("8" . meow-expand-8)
   '("7" . meow-expand-7)
   '("6" . meow-expand-6)
   '("5" . meow-expand-5)
   '("4" . meow-expand-4)
   '("3" . meow-expand-3)
   '("2" . meow-expand-2)
   '("1" . meow-expand-1)
   '("-" . negative-argument)
   '(";" . meow-reverse)
   '("," . meow-inner-of-thing)
   '("." . meow-bounds-of-thing)
   '("[" . meow-beginning-of-thing)
   '("]" . meow-end-of-thing)
   '("a" . meow-append)
   '("A" . meow-open-below)
   '("b" . meow-back-word)
   '("B" . meow-back-symbol)
   '("c" . meow-change)
   '("d" . meow-delete)
   '("D" . meow-backward-delete)
   '("e" . meow-next-word)
   '("E" . meow-next-symbol)
   '("f" . meow-find)
   '("g" . meow-cancel-selection)
   '("G" . meow-grab)
   '("h" . meow-left)
   '("H" . meow-left-expand)
   '("i" . meow-insert)
   '("I" . meow-open-above)
   '("j" . meow-next)
   '("J" . meow-next-expand)
   '("M-j" . (lambda ()
	       (interactive)
	       (meow-next)
	       (meow-next)
	       (meow-next)
	       (meow-next)
	       (meow-next)
	       ;; (dotimes (_ 5)
	       ;; 	 )
	       ))
   '("k" . meow-prev)
   '("K" . meow-prev-expand)
   '("M-k" . (lambda ()
	       (interactive)
	       (dotimes (_ 5)
		 (meow-prev))))
   '("l" . meow-right)
   '("L" . meow-right-expand)
   '("m" . meow-join)
   '("n" . meow-search)
   '("o" . meow-block)
   '("O" . meow-to-block)
   '("p" . meow-yank)
   '("q" . meow-quit)
   '("Q" . meow-goto-line)
   '("r" . meow-replace)
   '("R" . meow-swap-grab)
   '("s" . meow-kill)
   '("t" . meow-till)
   '("u" . meow-undo)
   '("U" . meow-undo-in-selection)
   '("v" . meow-visit)
   '("w" . meow-mark-word)
   '("W" . meow-mark-symbol)
   '("x" . meow-line)
   '("X" . meow-goto-line)
   '("y" . meow-save)
   '("Y" . meow-sync-grab)
   '("z" . meow-pop-selection)
   '("'" . repeat)
   '("<escape>" . ignore)))


(add-hook 'meow-motion-mode-hook (lambda ()
				   ;; 当当前主模式不在特殊 motion特殊处理过的mode列表中时才重新setup meow的按键
				   (unless (-contains-p +kyd/meow-motion-mode-alist major-mode)
				     (meow-setup))))

(meow-setup)

(provide 'init-meow)
