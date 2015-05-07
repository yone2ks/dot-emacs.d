;; tabbarの設定
(require 'tabbar)
(tabbar-mode)

;; グループ化しない
(setq tabbar-buffer-groups-function nil)
;; scratchバッファ以外で「*」が付いたバッファは表示しない
(setq tabbar-buffer-list-function
      (lambda ()
        (remove-if
         (lambda(buffer)
           (unless (or (string= (buffer-name buffer) "*scratch*") (string= (buffer-name buffer) "*init log*") (string= (buffer-name buffer) "*eshell*"))
             (find (aref (buffer-name buffer) 0) " *"))
           )
         (buffer-list))))

;; キーバインドの設定
(bind-key* "C-," 'tabbar-backward)
(bind-key* "C-." 'tabbar-forward)
