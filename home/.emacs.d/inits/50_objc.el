;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

(when (require 'emaXcode nil t))

(add-hook 'objc-mode-hook '(lambda ()
                            (c-set-style "cc-mode")
                            (c-set-offset 'case-label '+)
                            (setq indent-tabs-mode nil)

                            'helm-gtags-mode
                            (add-to-list 'ac-modes 'objc-mode)
                            'ac-cc-mode-setup))
