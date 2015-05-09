;; yasnippetの設定
(require 'yasnippet) 
(require 'helm-c-yasnippet)
(setq helm-c-yas-space-match-any-greedy t) ;[default: nil]
;; そのモードのスニペットをhemlで絞り込む
(bind-key* "C-c y" 'helm-c-yas-complete)
;; (add-to-list 'yas-extra-mode-hooks 'ruby-mode-hook)
;; (add-to-list 'yas-extra-mode-hooks 'cperl-mode-hook)
;; yas-expandで複数候補が存在する場合, helmインターフェースで絞り込む
(defun my-yas/prompt (prompt choices &optional display-fn)
  (let* ((names (loop for choice in choices
                      collect (or (and display-fn (funcall display-fn choice))
                                  coice)))
         (selected (helm-other-buffer
                    `(((name . ,(format "%s" prompt))
                       (candidates . names)
                       (action . (("Insert snippet" . (lambda (arg) arg))))))
                    "*helm yas/prompt*")))
    (if selected
        (let ((n (position selected names :test 'equal)))
          (nth n choices))
      (signal 'quit "user quit!"))))
(custom-set-variables '(yas/prompt-functions '(my-yas/prompt)))
(yas-global-mode 1)
(require 'html5-snippets)
