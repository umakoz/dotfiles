;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

(when (require 'coffee-mode nil t)
  (add-hook 'coffee-mode-hook
            '(lambda () 
               (setq tab-width 2)
               (setq coffee-tab-width 2)))

  ;; flymake-coffee
  (when (require 'flymake-coffee nil t)
    (add-hook 'coffee-mode-hook 'flymake-coffee-load)))
