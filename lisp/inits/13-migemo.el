;; setting for migemo
(require 'migemo)

(cond
 ((string-match "darwin" system-configuration)
  ;; Mac OS X
  (setq migemo-command "/usr/local/bin/cmigemo")
  (setq migemo-options '("-q" "--emacs"))
  (setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")
  (defvar migemo-user-dictionary nil)
  (defvar migemo-regex-dictionary nil)
  (setq migemo-coding-system 'utf-8-unix)
  )
 ((string-match "i686-pc-cygwin" system-configuration)
  ;; Cygwin
  (setq migemo-command "cmigemo")
  (setq migemo-options '("-q" "--emacs"))
  (setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")
  (defvar migemo-user-dictionary nil)
  (defvar migemo-regex-dictionary nil)
  (setq migemo-coding-system 'utf-8-unix)
  )
 ((string-match "linux" system-configuration)
  ;; Linux
  (setq migemo-command "cmigemo")
  (setq migemo-options '("-q" "--emacs"))
  (setq migemo-dictionary "/usr/share/cmigemo/utf-8/migemo-dict")
  (setq migemo-user-dictionary nil)
  (setq migemo-regex-dictionary nil)
  (setq migemo-coding-system 'utf-8)
  ))

(load-library "migemo")
(migemo-init)
;;SKK使用時、インクリメンタルサーチする時はSKKをlatinモードにする
(setq skk-isearch-start-mode 'latin)
(setq migemo-use-pattern-alist t)	;検索結果をキャッシュするようになってる
;; 終了時に勝手にkill
(set-process-query-on-exit-flag migemo-process nil)
