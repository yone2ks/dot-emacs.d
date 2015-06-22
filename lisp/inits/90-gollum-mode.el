;; gollum-modeの設定
(require 'org)
(require 'gollum-mode)

;; キーバインドの設定
(bind-key* "C-c c" 'gollum--create-wiki-page)
(define-key org-mode-map (kbd "C-c C-s") 'gollum--save-wiki-page)
(define-key org-mode-map (kbd "C-c C-c") 'gollum--save-commit-wiki-page)
(bind-key* "C-c s" 'gollum--search)

