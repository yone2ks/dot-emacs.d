;; for markdown-mode
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; 見た目の設定
(defface markdown-header-delimiter-face-1
  '((((class color) (background light))
     (:foreground "Black" :weight bold :height 1.6))
    (((class color) (background dark))
     (:foreground "White" :weight bold :height 1.6)))
  "Face for level-1 headers delimiter.")

(defface markdown-header-delimiter-face-2
  '((((class color) (background light))
     (:foreground "Black" :weight bold :height 1.3))
    (((class color) (background dark))
     (:foreground "White" :weight bold :height 1.3)))
  "Face for level-2 headers delimiter.")

(defface markdown-header-delimiter-face-3
  '((((class color) (background light))
     (:foreground "Black" :weight bold :height 1.1))
    (((class color) (background dark))
     (:foreground "White" :weight bold :height 1.1)))
  "Face for level-3 headers delimiter.")

(defface markdown-header-face-1
  '((((class color) (background light))
     (:foreground "Black" :underline "Black" :weight bold :height 1.6))
    (((class color) (background dark))
     (:foreground "White" :underline "Black" :weight bold :height 1.6)))
  "Face for level-1 headers.")

(defface markdown-header-face-2
  '((((class color) (background light))
     (:foreground "Black" :weight bold :height 1.3))
    (((class color) (background dark))
     (:foreground "White" :weight bold :height 1.3)))
  "Face for level-2 headers.")

(defface markdown-header-face-3
  '((((class color) (background light))
     (:foreground "Black" :weight bold :height 1.1))
    (((class color) (background dark))
     (:foreground "White" :weight bold :height 1.1)))
  "Face for level-3 headers.")

