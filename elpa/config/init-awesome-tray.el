(require 'awesome-tray)

(defun meow-module-info()
  (meow-indicator))
(defface meow-module-face ()
  ""
  :group 'awesome-tray)

(add-to-list 'awesome-tray-module-alist
	     '("meow" . (meow-module-info meow-module-face)))

(setq awesome-tray-active-modules '("meow" "location" "buffer-name" "mode-name" "date"))

(set-face-attribute 'awesome-tray-module-location-face nil
		    :foreground "#FF0000"
		    :weight 'normal)

(set-face-attribute 'awesome-tray-module-buffer-name-face nil
		    :foreground "#FF8C00"
		    :weight 'normal)

(set-face-attribute 'awesome-tray-module-mode-name-face nil
		    :foreground "#FFD700"
		    :weight 'normal)

(set-face-attribute 'awesome-tray-module-battery-face nil
		    :foreground "#FFFF00"
		    :weight 'normal)

(set-face-attribute 'awesome-tray-module-date-face nil
		    :foreground "#e80dd8900"
		    :weight 'normal)

;; 为了让awesome-tray内容不要换行
(setq awesome-tray-info-padding-right 5)
(awesome-tray-mode)


(provide 'init-awesome-tray)
