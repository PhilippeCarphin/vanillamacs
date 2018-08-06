;;; Configuring and initializing package system ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-refresh-contents)
(package-initialize)
;; You must run these commands the first time
;; M-x RET package-install RET org-bullets RET
;; M-x RET package-install RET htmlize RET
;; M-x RET package-install RET helm RET
;; M-x RET package-install RET evil RET
(load-theme 'deeper-blue)

;;; The bell ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; the bell is REALLY annoying but I suggest leaving it on at least for the
;;; first day to get a sense of when you need to press C-g.  Then turn it off
;;; forever with this:
(setq ring-bell-function 'ignore) ;; Turn the bell off
;; (setq ring-bell-function 'nil) ;; leave the bell on

;;; Helm ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'helm-config)
;;; This remaps some regular functions to their helm equivalent
(helm-mode 1)
;;; And here are a couple more
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x f") 'helm-recentf)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "M-x") 'helm-M-x)

;;; Org mode ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(require 'htmlize)
;;; This is for xdg-open to work when doing 'C-c C-e h o'
;;; ref : https://askubuntu.com/questions/646631/emacs-doesnot-work-with-xdg-open
(setq process-connection-type nil)
;;; Recenter screen when pressing shift-tab (worth it))
(advice-add 'org-global-cycle :after 'recenter)
;;; Define the command 'notes' to open helm-find-files in the notes directory
(defun notes ()
  "Open helm-find-files in a the notes directory"
  (interactive)
  (helm-find-files-1 "~/Dropbox/Notes/Notes_BUCKET/"))
;;; activate Babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((shell . t)
   (python . t)))
;;; Include exporting to man format
(require 'ox-man)
;;; Include exporting to markdown
(require 'ox-md)

;;; Ctrl-{Z|X|C|V} like in windows (C-c and C-x still work the same when no text
;;; is selected.
(cua-mode 1)


;;; Enable evil-mode
(require 'evil)
(evil-mode 1)

;;; Misc Configs ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Scroll behavior
(setq scroll-step 1) ;; instead of the default behavior of jumping
(setq-default scroll-margin 10) ;; Prevent the cursor from getting too close to the edges
;;; A set of miscellaneous configurations
(electric-pair-mode 1)
;;; make typing delete/overwrites selected text
(delete-selection-mode 1)
;;; make cursor movement stop in between camelCase words.
(global-subword-mode 1)
;;; auto insert closing bracket
(electric-pair-mode 1)
;;; turn on highlighting current line
(global-hl-line-mode 1)
;;; turn on bracket match highlight
(show-paren-mode 1)
;;; remember cursor position, for emacs 25.1 or later
(save-place-mode 1)
;;; Turn on line number mode
(display-line-numbers-mode)
;;; Column number in modeline
(column-number-mode 1)
