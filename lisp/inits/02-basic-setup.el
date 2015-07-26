;; 基本的な設定
;; emacsclient
(require 'server)
(when (and (>= emacs-major-version 23)
           (equal window-system 'w32))
  (defun server-ensure-safe-dir (dir) "Noop" t)) ; Suppress error "directory~/.emacs.d/server is unsafe"on windows.
(server-start)

;;オートセーブファイルとバックアップファイルは作らない
(setq make-backup-files nil) 
(setq auto-save-default nil) 

;; バッファ画面外文字の切り詰め表示
(setq truncate-lines t)

;; ウィンドウ縦分割時のバッファ画面外文字の切り詰め表示
(setq truncate-partial-width-windows t)

;; カーソルのブランクを止める
(blink-cursor-mode nil)

;; スクロール時のカーソル位置の維持
(setq scroll-preserve-screen-position t)

;; スクロール行数（一行ごとのスクロール）
(setq vertical-centering-font-regexp ".*")
(setq scroll-conservatively 35)
(setq scroll-margin 0)
(setq scroll-step 1)

;; 画面スクロール時の重複行数
(setq next-screen-context-lines 1)

;; 起動メッセージの非表示
(setq inhibit-startup-message t)

;; スタートアップ時のエコー領域メッセージの非表示
(setq inhibit-startup-echo-area-message -1)

;; 起動時のscratchバッファにメッセージを表示しない
(setq initial-scratch-message "")

;; backward-charでリージョンを消せるように
;; cua(common user access) mode
(cua-selection-mode t)

;; バッファの先頭までスクロールアップ
(defadvice scroll-up (around scroll-up-around)
  (interactive)
  (let* ( (start_num (+ 1 (count-lines (point-min) (point))) ) )
    (goto-char (point-max))
    (let* ( (end_num (+ 1 (count-lines (point-min) (point))) ) )
      (goto-line start_num )
      (let* ( (limit_num (- (- end_num start_num) (window-height)) ))
	(if (< (- (- end_num start_num) (window-height)) 0)
	    (goto-char (point-max))
	  ad-do-it)) )) )
(ad-activate 'scroll-up)

;; バッファの最後までスクロールダウン
(defadvice scroll-down (around scroll-down-around)
  (interactive)
  (let* ( (start_num (+ 1 (count-lines (point-min) (point)))) )
    (if (< start_num (window-height))
	(goto-char (point-min))
      ad-do-it) ))
(ad-activate 'scroll-down)

;;yes,no -> y,n
(fset 'yes-or-no-p 'y-or-n-p)

;; visible-bellをオフに
(setq visible-bell nil)

;; 現在行をハイライトする
(global-hl-line-mode t)

;; 履歴を次回のemacs起動時にも保存する
(savehist-mode t)

;; ファイル内のカーソル位置を記憶する
(setq-default save-place t)
(require 'saveplace)

;; 対応する括弧を光らせる
(show-paren-mode t)

;; 対応する括弧を自動挿入
(require 'skeleton)
(setq skeleton-pair t)
(global-set-key "{" 'skeleton-pair-insert-maybe)
(global-set-key "(" 'skeleton-pair-insert-maybe)
;;(global-set-key "\'" 'insert-single-quotation)
(global-set-key "\"" 'skeleton-pair-insert-maybe)
(global-set-key "[" 'skeleton-pair-insert-maybe)
(add-hook 'c-mode-common-hook
          '(lambda ()
	     (define-key c-mode-map "{" 'skeleton-pair-insert-maybe)
	     (define-key c-mode-map "(" 'skeleton-pair-insert-maybe)
	     (define-key c-mode-map "\"" 'skeleton-pair-insert-maybe)
	     (define-key c-mode-map "[" 'skeleton-pair-insert-maybe)
	     (define-key c++-mode-map "{" 'skeleton-pair-insert-maybe)
	     (define-key c++-mode-map "(" 'skeleton-pair-insert-maybe)
	     (define-key c++-mode-map "\"" 'skeleton-pair-insert-maybe)
	     (define-key c++-mode-map "[" 'skeleton-pair-insert-maybe)
	     ))
(add-hook 'c-mode-common-hook
	  '(lambda ()
	     (define-key c-mode-map "\C-cd" "$")
	     (define-key c-mode-map "\C-cp" "%")))
(add-hook 'tcl-mode-hook
          '(lambda ()
	     (define-key tcl-mode-map "{" 'skeleton-pair-insert-maybe)
	     (define-key tcl-mode-map "(" 'skeleton-pair-insert-maybe)
	     (define-key tcl-mode-map "\"" 'skeleton-pair-insert-maybe)
	     (define-key tcl-mode-map "[" 'skeleton-pair-insert-maybe)
	     ))

;; MacOS Xの場合, Command-KeyとOption-Keyを入れ替える
(if (featurep 'ns)
    (progn 
    (setq ns-command-modifier (quote meta))
    (setq ns-alternate-modifier (quote super))))

