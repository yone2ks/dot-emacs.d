;; setting for skk
(require 'skk-autoloads)
(require 'skk)
(setq skk-preload t)
(bind-key* "C-x C-j" 'skk-mode)
(bind-key* "C-x j" 'skk-mode)
(bind-key* "C-x t" 'skk-tutorial)
(setq skk-large-jisyo "~/.emacs.d/lisp/site-lisp/skk-dict/SKK-JISYO.L")
(setq skk-cdb-large-jisyo "~/.emacs.d/lisp/site-lisp/skk-dict/SKK-JISYO.L.cdb")
(setq skk-japanese-message-and-error t)
(setq skk-auto-insert-paren t)
(setq skk-show-tooltip t)
(setq skk-show-inline t)
  (setq skk-kuten-touten-alist
    '(
      (jp . ("。" . "、" ))
      (en . (". " . ", "))
      ))
(setq-default skk-kutouten-type 'en)
(setq skk-server-host "localhost")
(setq skk-server-portnum 1178)
(if (featurep 'ns)
    (progn
      (setq skk-server-prog "/opt/local/libexec/dbskkd-cdb")
      ))
(if (featurep 'gtk)
    (progn
      (setq skk-server-prog "/usr/sbin/dbskkd-cdb")
      ))
(setq skk-server-jisyo "~/.emacs.d/site-lisp/skk/dict/SKK-JISYO.cdb")
;; setting for skk-sticky
(setq skk-sticky-key ";")
;; setting for some hooks
(add-hook 'find-file-hook
          (lambda () (skk-mode t) (skk-latin-mode t)))
(add-hook 'lisp-interaction-mode-hook
          (lambda () (skk-mode t) (skk-latin-mode t)))
