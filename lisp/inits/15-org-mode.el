;; 見た目の設定
(defface org-level-1
  '((((class color) (background light))
    (:foreground "Black" :weight bold :height 1.5 :color "tan"))
    (((class color) (background dark))
     (:foreground "White" :weight bold :height 1.5 :color "tan")))
  "Face for level-1 headers")

(defface org-level-2
  '((((class color) (background light))
    (:foreground "Black" :weight bold :height 1.3 :color "tan"))
    (((class color) (background dark))
     (:foreground "White" :weight bold :height 1.3 :color "tan")))
  "Face for level-2 headers")

(defface org-level-3
  '((((class color) (background light))
    (:foreground "Black" :weight bold :height 1.1 :color "tan"))
    (((class color) (background dark))
     (:foreground "White" :weight bold :height 1.1 :color "tan")))
  "Face for level-3 headers")

;; orgヘッダ行全体の背景をカスタマイズ
(require 'ov)
(defun lbp-at-specified-point (p)
  (save-excursion
    (goto-char p)
    (line-beginning-position)))
(defun lep-at-specified-point (p)
  (save-excursion
    (goto-char p)
    (line-end-position)))
(defun ov-regexp-line (regexp &optional beg end)
  (save-excursion
    (goto-char (or beg (point-min)))
    (let (ov-or-ovs finish)
      (ov-recenter (point-max))
      (while (and (not finish) (re-search-forward regexp end t))
        (setq ov-or-ovs (cons (ov-make (lbp-at-specified-point (match-beginning 0))
                                       (min (1+ (lep-at-specified-point (match-end 0))) (point-max))
                                       nil (not ov-sticky-front) ov-sticky-rear)
                              ov-or-ovs))
        (when (= (match-beginning 0) (match-end 0))
          (if (eobp)
              (setq finish t)
            (forward-char 1))))
      ov-or-ovs)))
(defun org-header-highlight ()
  (interactive)
  (setq ov1 (ov-regexp-line org-heading-regexp))
  (ov-set ov1 'face '(:background "tan")))
(defun org-header-unhighligh ()
  (interactive)
  (ov-clear))
(add-hook 'org-mode-hook 'org-header-highlight)

;; org-mode起動時はskkカナモードで, show-all
(add-hook 'org-mode-hook
	  (lambda ()
	    (skk-mode t)
	    (skk-latin-mode t)
	    (show-all)))

