;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

(when (require 'powerline nil t)
  (powerline-default-theme)

  (setq powerline-default-separator 'arrow)

  (set-face-attribute 'mode-line nil
                      :foreground "#fff"
                      :background "#548"
                      :box nil)

  (set-face-attribute 'powerline-active1 nil
                      :foreground "#fff"
                      :background "#437"
                      :inherit 'mode-line)

  (set-face-attribute 'powerline-active2 nil
                      :foreground "#fff"
                      :background "#326"
                      :inherit 'mode-line))
