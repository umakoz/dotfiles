;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

(when (require 'browse-url nil t)
  (global-set-key "\C-x\C-g" 'browse-url-at-point)

  (setq browse-url-browser-display t
        browse-url-new-window-flag nil))
