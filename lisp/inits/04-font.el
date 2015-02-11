;; フォントの設定
(cond
 ((string-match "darwin" system-configuration)
  ;; Mac OS X
  (set-face-attribute 'default nil :family "Menlo" :height 140)
  (set-fontset-font (frame-parameter nil 'font)
		    'japanese-jisx0208
		    (font-spec :family "Hiragino Kaku Gothic ProN"))
  (add-to-list 'face-font-rescale-alist
	       '(".*Hiragino Kaku Gothic ProN.*" . 1.2))
  )
 ((string-match "i686-pc-cygwin" system-configuration)
  ;; Cygwin
  (set-face-attribute 'default nil :family "Migu 1M" :height 110)
  (set-face-attribute 'variable-pitch nil :family "Migu 1M" :height 110)
  (set-face-attribute 'fixed-pitch nil :family "Migu 1M" :height 110)
  (set-face-attribute 'tooltip nil :family "Migu 1M" :height 90)
  )
 ((string-match "linux" system-configuration)
  ;; Linux
  (set-face-attribute 'default nil :family "Menlo" :height 140)
  (set-fontset-font (frame-parameter nil 'font)
		    'japanese-jisx0208
		    (font-spec :family "Hiragino Kaku Gothic ProN"))
  (add-to-list 'face-font-rescale-alist
	       '(".*Hiragino Kaku Gothic ProN.*" . 1.2))
  ))

;; キーバインドの設定
(bind-key* "C-<wheel-up>"   '(lambda() (interactive) (text-scale-increase 1)))
(bind-key* "C-="            '(lambda() (interactive) (text-scale-increase 1)))
(bind-key* "C-<wheel-down>" '(lambda() (interactive) (text-scale-decrease 1)))
(bind-key* "C--"            '(lambda() (interactive) (text-scale-decrease 1)))
(bind-key* "M-0" '(lambda() (interactive) (text-scale-set 0)))
