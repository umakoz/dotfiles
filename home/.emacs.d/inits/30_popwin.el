;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

(when (require 'popwin nil t)
  (setq display-buffer-function 'popwin:display-buffer)

  (setq helm-samewindow nil)
  (push '("*helm*" :height 20) popwin:special-display-config)

  ;;(setq split-width-threshold nil)
  ;;(push '("*Moccur*" :height 20) popwin:special-display-config)

  (push '(dired-mode :position top) popwin:special-display-config))
