;; diredの設定
(require 'dired)
;; dired時のdired-up-directoryで新規バッファを作成しない
(defvar my-dired-before-buffer nil)
(defadvice dired-up-directory
  (before kill-up-dired-buffer activate)
  (setq my-dired-before-buffer (current-buffer)))
(defadvice dired-up-directory
  (after kill-up-dired-buffer-after activate)
  (if (eq major-mode 'dired-mode)
      (kill-buffer my-dired-before-buffer)))
(add-hook 'dired-mode-hook
 '(lambda ()
    (define-key dired-mode-map "h" 'dired-up-directory)
    (define-key dired-mode-map "j" 'dired-next-line);;dired-next-line-and-advertised-find-file
    (define-key dired-mode-map "k" 'dired-previous-line);;dired-previous-line-and-advertised-find-file
    ;; diredでRETを押したときに新規バッファを開かないで、ディレクトリを移動
    (setq dired-listing-switches "-lhA") ;lsのオプションを指定(lは必須)FlhA
    ))
