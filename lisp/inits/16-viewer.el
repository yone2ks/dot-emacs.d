(require 'viewer)
;; 書き込み不能ファイルではview-modeから抜けない
(viewer-stay-in-setup)

;; viewモードの場合, モードラインの色を変える
(setq viewer-modeline-color-unwritable "tomato")
(setq viewer-modeline-color-view "orange")
(viewer-change-modeline-color-setup)

;; キーバインドの設定
(bind-keys :map view-mode-map
	   ("h" . backward-word)
	   ("l" . forward-word)
	   ("j" . next-line)
	   ("k" . previous-line)
	   (";" . gene-word)
	   ("b" . scroll-down)
	   ("<space>" . scroll-down)
	   (" " . scroll-up))
