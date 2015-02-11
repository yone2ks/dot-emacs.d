;; CEDETの設定
(global-ede-mode 1)                      ; Enable the Project management system
;;(semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion 
;;(global-srecode-minor-mode 1)            ; Enable template insertion menu

;; Semantic
;; (global-semantic-idle-completions-mode t)
;; (global-semantic-decoration-mode t)
;; (global-semantic-highlight-func-mode t)
;; (global-semantic-show-unmatched-syntax-mode t)

;; ;; CC-mode
;; (add-hook 'c-mode-hook '(lambda ()
;; 			  (setq ac-sources (append '(ac-source-semantic) ac-sources))
;; 			  (semantic-mode t)))

;; ;; Autocomplete
;; (add-to-list 'ac-dictionary-directories (expand-file-name
;;              "~/.emacs.d/elpa/auto-complete-1.4.20110207/dict"))
;; (setq ac-comphist-file (expand-file-name
;;              "~/.emacs.d/ac-comphist.dat"))
;; (ac-config-default)
