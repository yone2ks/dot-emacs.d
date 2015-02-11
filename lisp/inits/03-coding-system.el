;; 文字コード関連の設定
(set-language-environment 'Japanese)
;; 改行コードの表記追加
(setq eol-mnemonic-dos       ":Dos ")
(setq eol-mnemonic-mac       ":Mac ")
(setq eol-mnemonic-unix      ":Unx ")
(setq eol-mnemonic-undecided ":??? ")
;; 文字コードの設定
(cond
 ((string-match "darwin" system-configuration)
  ;; Mac OS X
  (prefer-coding-system 'utf-8-unix)
  (set-default-coding-systems 'utf-8-unix)
  (set-keyboard-coding-system 'utf-8-unix)
  (setq file-name-coding-system 'utf-8-unix) 
  )
 ((string-match "i686-pc-cygwin" system-configuration)
  ;; Cygwin
  (prefer-coding-system 'utf-8-dos)
  (set-default-coding-systems 'utf-8-dos)
  (set-terminal-coding-system 'utf-8-dos)
  (set-keyboard-coding-system 'utf-8-dos)
  (set-buffer-file-coding-system 'utf-8-dos)
  (setq default-buffer-file-coding-system 'utf-8-dos)
  (setq file-name-coding-system 'utf-8-dos) ;; windowsのファイル名
  (set-clipboard-coding-system 'japanese-cp932) ;; 機種依存文字
  (setq default-process-coding-system '(undecided-dos . utf-8-dos))
  )
 ((string-match "linux" system-configuration)
  ;; Linux
  (prefer-coding-system 'utf-8-unix)
  (set-default-coding-systems 'utf-8-unix)
  (set-keyboard-coding-system 'utf-8-unix)
  (setq file-name-coding-system 'utf-8-unix) 
  ))
