;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

(when(require 'anzu nil t)
  (global-anzu-mode +1)

  (custom-set-variables
   '(anzu-mode-lighter "")
   ;'(anzu-deactivate-region t)
   '(anzu-search-threshold 1000)
   '(anzu-use-migemo t))

  (global-set-key (kbd "M-%") 'anzu-query-replace)
  (global-set-key (kbd "C-M-%") 'anzu-query-replace-regexp)
  (global-set-key (kbd "C-x %") 'anzu-replace-at-cursor-thing))
