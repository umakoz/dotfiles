;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

(when (require 'bm nil t)
  (require 'bm-ext nil t)
  (global-set-key (kbd "<C-f2>") 'bm-toggle)
  (global-set-key "\C-xm" 'bm-toggle)
  (global-set-key (kbd "<f2>")   'bm-next)
  (global-set-key (kbd "<S-f2>") 'bm-previous))
