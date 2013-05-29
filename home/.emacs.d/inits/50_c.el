;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

(add-hook 'c-mode-hook '(lambda ()
                          (c-set-style "stroustrup")
                          (c-set-offset 'case-label '+)
                          (setq indent-tabs-mode nil)
                          (define-key c-mode-map "\C-m" 'newline-and-indent)
                          (gtags-mode 1)))
