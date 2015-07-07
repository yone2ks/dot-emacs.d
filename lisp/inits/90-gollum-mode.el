;; gollum-modeの設定
(require 'org)
(require 'gollum-mode)

;; キーバインドの設定
(bind-key* "C-c c" 'gollum--create-wiki-page)
(define-key org-mode-map (kbd "C-c C-s") 'gollum--save-wiki-page)
(define-key org-mode-map (kbd "C-c C-c") 'gollum--save-commit-wiki-page)
(bind-key* "C-c s" 'gollum--search)

;; helm-agのアクションにview-fileを追加
(defun gollum--view (candidate)
  (helm-ag--find-file-action candidate 'view-file (helm-ag--search-this-file-p)))
(add-to-list 'helm-ag--actions
	     ' ("View File" . gollum--view))
(setq helm-ag-source
  (helm-build-in-buffer-source "The Silver Searcher"
    :init 'helm-ag--init
    :real-to-display 'helm-ag--candidate-transformer
    :persistent-action 'helm-ag--persistent-action
    :fuzzy-match helm-ag-fuzzy-match
    :action helm-ag--actions))



