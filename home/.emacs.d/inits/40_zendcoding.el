;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

;; https://github.com/rooney/zencoding
(when (require 'zencoding-mode nil t)
  (add-hook 'sgml-mode-hook 'zencoding-mode) ;; Auto-start on any markup modes
  (define-key zencoding-mode-keymap (kbd "<C-return>") 'zencoding-expand-yas) ;; yasnippet協調
  (define-key zencoding-mode-keymap (kbd "C-z") 'zencoding-expand-line)
  (define-key zencoding-preview-keymap (kbd "C-z") 'zencoding-preview-accept))
