(require 'bongo)
(setq
 bongo-header-line-mode nil
 bongo-mode-line-indicator-mode nil
 bongo-global-lastfm-mode nil
 bongo-mode-line-icon-size 10)

;;;###autoload
(defun bongo-buffer-live-p ()
  "判断是否存在bongo buffer。"
  (if (or (get-buffer "*Bongo Playlist*") (get-buffer "*Bongo Library*"))
      t
    nil))
;;;###autoload
(defun bongo-init-all ()
  "自动初始化bongo音乐列表"
  (interactive)
  (let ((buffer (current-buffer)))
    (when (bongo-buffer-live-p)
      (bongo-stop))
    (bongo)
    (setq bongo-insert-whole-directory-trees "ask")
    (bongo-insert-file "~/Audio")
    (bongo-insert-enqueue-region (point-min)
                                 (point-max))
    (bongo-play-random)
    (switch-to-buffer buffer)))
(one-key-create-menu
 "Bongo"
 '((("i" . "Init bongo music.") . bongo-init-all)
   (("P" . "Pasue bongo") . bongo-pause/resume)
   (("l" . "Forward 10s") . bongo-seek-forward-10)
   (("h" . "Backward 10s") . bongo-seek-backward-10)
   (("n" . "Next song") . bongo-play-next)
   (("p" . "Previous song") . bongo-play-previous)
   (("r" . "Random song") . bongo-play-random)))
(provide 'init-bongo)
