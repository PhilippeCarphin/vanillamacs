(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(load-file "~/.emacs.d/my-functions.el")

;;; First configuration: Scroll behavior
(setq scroll-step 1) ;; instead of the default behavior of jumping
(setq-default scroll-margin 10) ;; Prevent the cursor from getting too close to the edges

;;; Optional : Give classic C-{z|x|c|v} behavior.
;;; (C-c and C-x are only active while text is selected so it doesn't
;;; detract from their original emacs functions as prefixes
;; (cua-mode 1)

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
 '(package-selected-packages (quote (evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
