;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

(when (require 'yaml-mode nil t)

  (add-hook 'yaml-mode-hook
            '(lambda ()
               (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

  (when (require 'flymake-yaml nil t)
    (add-hook 'yaml-mode-hook 'flymake-yaml-load)))
