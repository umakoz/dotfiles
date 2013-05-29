;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

(cua-mode t)
(setq cua-enable-cua-keys nil)

; change keybind C-RET
(define-key cua--rectangle-keymap [(control return)] nil)
(define-key cua--region-keymap    [(control return)] nil)
(define-key cua-global-keymap     [(control return)] nil)
(define-key cua--rectangle-keymap (kbd "M-SPC") 'cua-clear-rectangle-mark)
(define-key cua--region-keymap    (kbd "M-SPC") 'cua-toggle-rectangle-mark)
(define-key cua-global-keymap     (kbd "M-SPC") 'cua-set-rectangle-mark)
