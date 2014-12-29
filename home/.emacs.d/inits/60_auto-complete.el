;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

(when (require 'auto-complete nil t)
  (when (require 'auto-complete-config nil t)
    (add-to-list 'ac-dictionary-directories (expand-file-name "~/.emacs.d/ac-dict"))
    (ac-config-default)

    (add-to-list 'ac-modes 'coffee-mode)

    ;(global-set-key "\M-/" 'ac-start) ; 補完開始
    (setq ac-auto-start 2 ; 補完を開始する文字数
          ac-dwim t ; Do what i mean
          ac-use-menu-map t
          ac-use-overriding-local-map nil) ; don't override local map

    (define-key ac-complete-mode-map "\C-n" 'ac-next)
    (define-key ac-complete-mode-map "\C-p" 'ac-previous)
    (define-key ac-complete-mode-map "\t" 'yas/expand)

    ;; The sources for common all mode.
    (custom-set-variables
     '(ac-sources
       '(
         ac-source-yasnippet
         ac-source-imenu
         ac-source-abbrev
         ac-source-dictionary
         ac-source-words-in-same-mode-buffers
         ac-source-files-in-current-dir
         ac-source-filename
         )))

    (add-hook 'auto-complete-mode-hook 'ac-common-setup)
    (global-auto-complete-mode t)))
