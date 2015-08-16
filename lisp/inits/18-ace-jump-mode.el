(setq ace-jump-mode-move-keys
      (append "asdfghjkl;:]qwertyuiop@zxcvbnm,." nil))
;; ace-jump-word-modeのとき文字を尋ねないようにする
(setq ace-jump-word-mode-use-query-char nil)
(bind-key* "C-/" 'ace-jump-char-mode)
;;(bind-key* "C-;" 'ace-jump-word-mode)
(bind-key* "C-M-;" 'ace-jump-line-mode)
