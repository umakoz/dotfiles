;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

(require 'go-mode-load)
(require 'go-autocomplete)
(require 'go-eldoc)

(add-hook 'go-mode-hook
          '(lambda()
             (flycheck-mode t)
             (go-eldoc-setup)
             (local-set-key (kbd "M-.") 'godef-jump)
             (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)
             (local-set-key (kbd "C-c i") 'go-goto-imports)
             (local-set-key (kbd "C-c d") 'godoc)))

(add-hook 'before-save-hook 'gofmt-before-save)
