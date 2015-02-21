;; 見た目の設定
(defface org-level-1
  '((((class color) (background light))
    (:foreground "Black" :weight bold :height 1.5 ))
    (((class color) (background dark))
     (:foreground "White" :weight bold :height 1.5)))
  "Face for level-1 headers")

(defface org-level-2
  '((((class color) (background light))
    (:foreground "Black" :weight bold :height 1.3))
    (((class color) (background dark))
     (:foreground "White" :weight bold :height 1.3)))
  "Face for level-2 headers")

(defface org-level-3
  '((((class color) (background light))
    (:foreground "Black" :weight bold :height 1.1))
    (((class color) (background dark))
     (:foreground "White" :weight bold :height 1.1)))
  "Face for level-3 headers")

;; org-mode起動時はskkカナモードで
(add-hook 'org-mode-hook
	  (lambda () (skk-mode t) (skk-latin-mode t)))

