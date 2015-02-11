; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-
;;;; init.el - init file for emacs

;; load-pathの設定(add ~/.emacs.d/lisp)
(let ( (default-directory
         (file-name-as-directory (concat user-emacs-directory "lisp"))))
  (add-to-list 'load-path default-directory)
  (normal-top-level-add-subdirs-to-load-path))

;; cask
(require 'cask "~/.cask/cask.el")
(cask-initialize)

;; for init-loader.el
(require 'init-loader)
(if (not (equal (init-loader-error-log) "")) ; エラーがあったときだけログバッファを表示
    (init-loader-show-log))
(init-loader-load "~/.emacs.d/lisp/inits") 

;;; ends here
