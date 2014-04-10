;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

(when (require 'magit nil t)
  (define-key global-map (kbd "C-c m") 'magit-status))
