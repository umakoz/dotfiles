;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

(when (require 'expand-region nil t)
  (global-set-key (kbd "C-@") 'er/expand-region)
  (global-set-key (kbd "C-M-@") 'er/contract-region)) ;; リージョンを狭める
