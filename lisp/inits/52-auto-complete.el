;; auto-completeの設定
(require 'auto-complete-config)
(ac-config-default)
(bind-keys :map ac-menu-map
	   ("M-n" 'ac-next)
	   ("M-p" 'ac-previous))

