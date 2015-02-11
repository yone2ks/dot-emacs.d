;;helmの設定
(require 'cl)
(require 'helm-config)
(require 'helm-migemo)
(require 'helm-files)
(require 'helm-ag)
; agのデフォルトのコマンドオプションを指定
; -nを消すとサブディレクトリも再帰的に検索します
(setq helm-ag-base-command "ag --nocolor --nogroup -n")
;Alt+sでag実行
(bind-key* "M-s" 'helm-ag)
