;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

(when (require 'gist nil t)
  (setq gist-view-gist t)

  (global-set-key (kbd "s-g") 'gist-list)
  (global-set-key (kbd "s-r g") 'gist-region)
  (global-set-key (kbd "s-r p") 'gist-region-private)
  (global-set-key (kbd "s-b g") 'gist-buffer)
  (global-set-key (kbd "s-b p") 'gist-buffer-private))
