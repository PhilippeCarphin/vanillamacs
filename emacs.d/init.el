;;; Configuring and initializing package system ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
;; Added this so that the package magit could be found
;; ref https://stackoverflow.com/a/24836870/5795941
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(package-refresh-contents)
(package-initialize)

;;; Loading external files ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(load-file "~/.emacs.d/my-functions.el")

;;; Optional : Give classic C-{z|x|c|v} behavior. ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; (C-c and C-x are only active while text is selected so it doesn't
;;; detract from their original emacs functions as prefixes
;; (cua-mode 1)

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

;;; Magit ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; The magit package and some keybindings suggested by the documentation
;;; Ref https://magit.vc/manual/magit/Getting-Started.html#Getting-Started
(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)
(setq vc-follow-symlinks t)


;;; Misc Configs ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Scroll behavior
(setq scroll-step 1) ;; instead of the default behavior of jumping
(setq-default scroll-margin 10) ;; Prevent the cursor from getting too close to the edges
;;; Set startup theme
(load-theme 'deeper-blue)
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Extra things that are not part of vanillamacs
;; Stuff to make my life easier and that custom-set stuff
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(load-file "~/.emacs.d/extra-stuff.el")

;; Stuff added by Custom.  First happened when I ran =package-install RET evil RET=
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (magit helm evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
