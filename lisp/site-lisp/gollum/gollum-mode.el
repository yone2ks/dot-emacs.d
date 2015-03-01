;;; package --- Summary
;;; Commentary:

;;; Code:
(defvar gollum--wiki-directory "~/wiki/")
(defvar gollum--time-string-format "%Y-%m-%d-%H%M%S")
(defvar gollum--wiki-page-extension ".org")
(defvar gollum--wiki-title "Yonedatk Wiki")
(defvar gollum--wiki-page-coding-system "utf-8-unix")
(defvar gollum--wiki-title-macro-string (concat "<!-- --- title: " gollum--wiki-title " -->\n"))
(defvar gollum--wiki-title-insert t)

(defun gollum--set-codingy-system ()
  (cond ((equal gollum--wiki-page-coding-system "utf-8-dos")
	 (set-buffer-file-coding-system 'utf-8-dos))
	(t
	 (set-buffer-file-coding-system 'utf-8-unix))))

(defun gollum--get-current-time-string ()
  (format-time-string gollum--time-string-format (current-time)))

(defun gollum--create-wiki-page-name ()
   (concat (gollum--get-current-time-string) gollum--wiki-page-extension))

(defun gollum--create-wiki-page ()
  (interactive)
  (let ((gollum--created-wiki-buffer (get-buffer-create (gollum--create-wiki-page-name))))
    (set-buffer gollum--created-wiki-buffer)
    (gollum--set-codingy-system)
    (insert gollum--wiki-title-macro-string)
    (org-mode)
    (pop-to-buffer gollum--created-wiki-buffer)))

(defun gollum--save-wiki-page ()
  (interactive)
  (f-write-text (buffer-string) 'utf-8-unix (concat gollum--wiki-directory (buffer-name)))
  )



(provide 'gollum-mode)
;;; gollum-mode.el ends here
