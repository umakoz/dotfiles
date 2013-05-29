;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

(when (require 'key-chord nil t)
  (setq key-chord-two-keys-delay 0.04)
  (key-chord-mode 1)
  (key-chord-define-global "jk" 'view-mode)
  (key-chord-define-global "df" 'describe-bindings))
