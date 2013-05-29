;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

(autoload 'dash-at-point "dash-at-point"
  "Search the word at point with Dash." t nil)

(global-set-key "\C-cd" 'dash-at-point)

;(add-to-list 'dash-at-point-mode-alist '(ruby-mode . "rails"))
