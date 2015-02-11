;; フレームを最大化
(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

;; フレームタイトルをバッファ名に
(setq frame-title-format "%b")

;; 同一バッファ名にディレクトリ付与
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-ignore-buffers-re "*[^*]+*")

;; バッファ中の行番号表示
(global-linum-mode t)

;; 行番号のフォーマット
(set-face-attribute 'linum nil :height 0.8)
(setq linum-format "%4d")

;; 行番号の表示
(line-number-mode t)

;; 列番号の表示
(column-number-mode t)

;; 時刻の表示
(require 'time)
(setq display-time-24hr-format t)
(setq display-time-string-forms
      '((format "%s/%s/%s(%s) %s:%s"
		year month day
		dayname
		24-hours minutes)))
(display-time-mode t)

;; メニューバーとツールバーを表示しない
(menu-bar-mode -1)
(tool-bar-mode -1)
