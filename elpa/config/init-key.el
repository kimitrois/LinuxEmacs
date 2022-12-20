(lazy-one-key-create-menu "Toggle"
			  (:key "F" :description "Toggle bit font" :command +kyd/toggle-big-font :filename "init-ui")
			  (:key "w" :description "Toggle write room" :command writeroom-mode :filename "init-writeroom")
			  (:key "p" :description "Toggle proxy" :command +kyd/toggle-proxy :filename "init-better-default")
			  (:key "l" :description "Toggle line numbers" :command display-line-numbers-mode :filename "display-line-numbers")
			  (:key "t" :description "Toggle telega" :command +kyd/toggle-telega :filename "init-telega")
			  (:key "c" :description "Toggle crow" :command crow-mode :filename "init-crow")
			  (:key "s" :description "Toggle eshell" :command eshell :filename "eshell")
			  (:key "v" :description "Toggle vterm" :command vterm :filename "init-vterm")
			  (:key "T" :description "Toggle transparent" :command +kyd/toggle-transparent :filename "init-emacs")
			  (:key "f" :description "Toggle dirvish side" :command +kyd/dirvish-side-current-path :filename "init-dirvish"))

(one-key-create-menu
 "Window"
 '((("l" . "Focus right window") . windmove-right)
   (("h" . "Focus left window") . windmove-left)
   (("k" . "Focus up window") . windmove-up)
   (("j" . "Focus down window") . windmove-down)
   (("L" . "Swap right window") . windmove-swap-states-right)
   (("H" . "Swap left window") . windmove-swap-states-left)
   (("K" . "Swap up window") . windmove-swap-states-up)
   (("J" . "Swap down window") . windmove-swap-states-down)
   (("s" . "Split window vertically") . split-window-below)
   (("v" . "Split window horizontally") . split-window-right)
   (("d" . "Delete window") . delete-window)
   (("u" . "Undo window") . winner-undo)
   (("C-h" . "Resize window to smaller") . shrink-window-horizontally)
   (("m" . "Delete other window") . delete-other-windows)
   (("C-k" . "Scroll other window up") . scroll-other-window-down)
   (("C-j" . "Scroll other window down") . scroll-other-window)))

(lazy-one-key-create-menu "File"
			  (:key "s" :description "Save buffer" :command save-buffer :filename "")
			  (:key "d" :description "Dirvish" :command dirvish :filename "init-dirvish")
			  (:key "p" :description "Find emacs config" :command +kyd/find-emacs-config :filename "init-ivy")
			  (:key "r" :description "Find recent file" :command counsel-recentf :filename "init-ivy")
			  (:key "f" :description "Find file" :command find-file :filename "init-ivy")
			  (:key "F" :description "Find file with fuzzy" :command counsel-fzf :filename "init-ivy"))

(lazy-one-key-create-menu "Search"
			  (:key "s" :description "Search in buffer" :command swiper :filename "init-ivy")
			  (:key "S" :description "Search in multi buffer" :command swiper-multi
				:filename "init-ivy")
			  (:key "g" :description "RipGreep here" :command counsel-rg :filename "init-ivy")
			  (:key "f" :description "GitGrep here" :command counsel-git-grep :filename "init-ivy")
			  (:key "d" :description "Snails" :command snails :filename "init-snails")
			  (:key "r" :description "Colorg" :command color-rg-search-input :filename "init-color-rg")
			  (:key "y" :description "Kill ring history" :command counsel-yank-pop :filename "init-ivy")
			  (:key "e" :description "Fanyi" :command fanyi-dwim :filename "init-fanyi")
			  (:key "B" :description "Bookmark" :command counsel-bookmark :filename "init-ivy")
			  (:key "l" :description "Find libray" :command counsel-find-library :filename "init-ivy"))

(lazy-one-key-create-menu "Buffer"
			  (:key "b" :description "Switch buffers" :command counsel-switch-buffer :filename "init-ivy")
			  (:key "k" :description "Kill buffer" :command kill-buffer-and-window :filename "")
			  (:key "T" :description "Switch telega buffers" :command telega-switch-buffer :filename "init-telega")
			  (:key "t" :description "Switch telega chat" :command telega-chat-with :filename "init-telega")
			  (:key "r" :description "Revert buffer" :command revert-buffer :filename ""))

(one-key-create-menu
 "Nagivator"
 '((("d" . "Go to definition") . xref-find-definitions)))

(lazy-one-key-create-menu "Code"
			  (:key "f" :description "Format code" :command apheleia-format-buffer :filename "init-format")
			  (:key "e" :description "Lsp Bridge Diagnostic" :command one-key-menu-diagnostic :filename "init-lsp-bridge")
			  (:key "d" :description "Lsp Bridge jump to def" :command lsp-bridge-jump :filename "init-lsp-bridge")
			  (:key "D" :description "Lsp Bridge jump to def other window" :command lsp-bridge-find-def-other-window :filename "init-lsp-bridge")
			  (:key "b" :description "Lsp Bridge jump back" :command lsp-bridge-jump-back :filename "init-lsp-bridge")
			  (:key "r" :description "Lsp Bridge find reference" :command lsp-bridge-find-references :filename "init-lsp-bridge")
			  (:key "n" :description "Lsp Bridge rename" :command lsp-bridge-rename :filename "init-lsp-bridge")
			  (:key "i" :description "Lsp Bridge find impl" :command lsp-bridge-find-impl :filename "init-lsp-bridge")
			  (:key "s" :description "Lsp Bridge show document" :command lsp-bridge-lookup-documentation :filename "init-lsp-bridge")
			  (:key "s" :description "Lsp Bridge code action" :command lsp-bridge-code-action :filename "init-lsp-bridge")
			  (:key "E" :description "Lsp Bridge toggle diagnostics" :command lsp-bridge-toggle-diagnostics :filename "init-lsp-bridge")
			  (:key "`" :description "Add Fold code" :command vimish-fold :filename "init-vimish-fold")
			  (:key "~" :description "Delete Fold code" :command vimish-fold-delete :filename "init-vimish-fold"))

(lazy-one-key-create-menu "EAF"
			  (:key "o" :description "EAF Open anything" :command eaf-open  :filename "init-eaf")
			  (:key "b" :description "EAF Open browser" :command eaf-open-browser  :filename "init-eaf")
			  (:key "h" :description "EAF Open browser with history" :command eaf-open-browser-with-history  :filename "init-eaf")
			  (:key "s" :description "EAF Search" :command eaf-search-it  :filename "init-eaf")
			  )

(lazy-one-key-create-menu "Magit"
			  (:key "v" :description "Open Magit" :command magit :filename "init-magit")
			  (:key "l" :description "Yank git link with current line." :command git-link :filename "git-link")
			  )

(lazy-one-key-create-menu "Useful"
			  (:key "u" :description "Translate region" :command gts-do-translate :filename "init-go-translate")
			  (:key "c" :description "Crow mode" :command one-key-menu-crow :filename "init-crow")
			  (:key "m" :description "Bongo" :command one-key-menu-bongo :filename "init-bongo")
			  (:key "e" :description "English helper" :command lsp-bridge-toggle-english-helper :filename "init-lsp-bridge")
			  (:key "p" :description "Yank buffer filename" :command +kyd/yank-buffer-file-name :filename "")
			  (:key "S" :description "Sudo edit" :command sudo-edit :filename "init-sudo-edit")
			  (:key "i" :description "Counsel tips" :command one-key-menu-counsel :filename "init-ivy")
			  (:key "r" :description "Elfeed" :command elfeed :filename "init-elfeed")
			  (:key "1" :description "Profiler start" :command profiler-start :filename "init-elfeed"))

(lazy-one-key-create-menu "Org"
			  (:key "c" :description "Org capture" :command org-capture :filename "init-org")
			  (:key "a" :description "Org agenda" :command org-agenda :filename "init-org"))

(lazy-one-key-create-menu "Blog"
			  (:key "c" :description "Create article" :command +kyd/blog-create-article :filename "init-blog")
			  (:key "f" :description "Find article" :command +kyd/blog-find-blog-files :filename "init-blog")
			  (:key "p" :description "Preview buffer" :command +kyd/blog-preview-current-buffer-in-browser :filename "init-blog")
			  (:key "P" :description "Publish website" :command +kyd/blog-save-and-publish-website :filename "init-blog")
			  (:key "d" :description "Delete org and html" :command +kyd/blog-delete-org-and-html :filename "init-blog"))

(lazy-load-local-keys '(("C-x u" . vundo))
		      global-map "init-vundo")

(lazy-load-global-keys '(("M-x" . counsel-M-x))
		       "init-ivy")
(lazy-load-global-keys '(("C-c a" . org-agenda))
		       "init-org")
(lazy-load-global-keys '(("C-c c" . org-capture))
		       "init-org")
(lazy-load-global-keys '(("C-c d" . external-dict-dwim))
		       "external-dict")


(one-key-create-menu
 "Index"
 '((("t" . "Toggles") . one-key-menu-toggle)
   (("f" . "Files") . one-key-menu-file)
   (("u" . "Useful") . one-key-menu-useful)
   (("b" . "Buffer") . one-key-menu-buffer)
   (("s" . "Search") . one-key-menu-search)
   (("r" . "Roam") . one-key-menu-roam)))

(lazy-one-key-create-menu "Roam"
			  (:key "f" :description "find node" :command org-roam-node-find :filename "init-org-roam")
			  (:key "c" :description "create id node" :command org-id-get-create :filename "init-org-roam")
			  (:key "i" :description "insert node" :command org-roam-node-insert :filename "init-org-roam"))

(lazy-load-global-keys '(("s-SPC" . one-key-menu-index))
		       "init-ivy")
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C-+") 'text-scale-decrease)

(provide 'init-key) 
