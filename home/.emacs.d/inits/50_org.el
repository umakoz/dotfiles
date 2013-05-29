;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

;;(add-to-list 'load-path "~/.emacs.d/elisp/org/lisp")
;;(when (require 'org-install nil t)
  (setq org-hide-leading-stars t
        org-odd-levels-only t
        org-log-done 'time)

  (global-set-key (kbd "C-c l") 'org-store-link)
  (global-set-key (kbd "C-c c") 'org-capture)
  (global-set-key (kbd "C-c a") 'org-agenda)
  (global-set-key (kbd "C-c b") 'org-iswitchb);;)
