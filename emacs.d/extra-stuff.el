;; Evil mode stuff.  This shouldn't be considered part of vanillamacs, just
;; that I can't work without it.
(require 'evil)
(evil-mode 1)

;; This is so that I can keep using org-mode my way as I do this
(defun notes ()
  "Open notes directory in dired"
  (interactive)
  (dired "~/Dropbox/Notes/Notes_BUCKET"))
(defun surround-strings (start end start-string end-string)
  (save-excursion (goto-char end)
                  (insert end-string)
                  (goto-char start)
                  (insert start-string)))
(defun org-make-code-block (lang start end)
  (surround-strings start end
                    (concat "#+BEGIN_SRC " lang "\n")
                    "#+END_SRC\n"))
(defun org-make-code-block-command (lang start end)
  (interactive (list (read-string "Enter a language (default C): " "" nil "c") (region-beginning) (region-end)))
  (org-make-code-block lang start end))
(defun org-set-make-code-block-key ()
  (define-key evil-visual-state-map (kbd "C-o") 'org-make-code-block-command))
(org-set-make-code-block-key)
