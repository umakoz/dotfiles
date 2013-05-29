;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

(when (require 'recentf nil t)
  (setq recentf-max-saved-items 2000)
  (setq recentf-auto-cleanup 600)
  (setq recentf-exclude '(".recentf"))
  (setq recentf-auto-save-timer
        (run-with-idle-timer 600 t 'recentf-save-list))
  (recentf-mode 1)
  (require 'recentf-ext))
