;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

(add-hook 'c-mode-hook '(lambda ()
                          (c-set-style "cc-mode")
                          (c-set-offset 'case-label '+)
                          (setq indent-tabs-mode nil)
                          'helm-gtags-mode
                          'ac-cc-mode-setup))
