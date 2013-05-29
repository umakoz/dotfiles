;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

;; whitespace
(when (require 'whitespace nil t)
    ;; see whitespace.el for more details
    (setq whitespace-style '(tabs tab-mark newline newline-mark spaces space-mark))
    (setq whitespace-display-mappings
          '((space-mark ?\u3000 [?\u25a1])
            (newline-mark ?\n    [?\u21B5 ?\n] [?$ ?\n])
            ;; WARNING: the mapping below has a problem.
            ;; When a TAB occupies exactly one column, it will display the
            ;; character ?\xBB at that column followed by a TAB which goes to
            ;; the next TAB column.
            ;; If this is a problem for you, please, comment the line below.
            (tab-mark ?\t [?\x00BB ?\t] [?\\ ?\t])))
    (setq whitespace-space-regexp "\\(\u3000+\\)")
    (defvar whitespace-default-face 'whitespace-default-face)
    (make-face 'whitespace-default-face)
    (set-face-foreground 'whitespace-default-face "darkcyan")
    (setq whitespace-tab 'whitespace-default-face)
    (setq whitespace-newline 'whitespace-default-face)
    (setq whitespace-space 'whitespace-default-face)
    (global-whitespace-mode t))
