;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

(when (require 'gtags nil t)
  (global-set-key "\M-t" 'gtags-find-tag)
  (global-set-key "\M-r" 'gtags-find-rtag)
  ;(global-set-key "\M-s" 'gtags-find-symbol)
  (global-set-key "\M-p" 'gtags-find-pattern)
  (global-set-key "\M-i" 'gtags-find-file))
