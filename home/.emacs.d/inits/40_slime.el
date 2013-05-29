;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

(setq inferior-lisp-program "/opt/local/bin/clisp")
(add-to-list 'load-path "~/.emacs.d/elisp/slime")  ; your SLIME directory
(require 'slime)
(slime-setup)
(add-hook 'lisp-mode-hook (lambda ()
                            (slime-mode t)
                            (show-paren-mode)))