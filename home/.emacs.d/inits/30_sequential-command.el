;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

(when (require 'sequential-command-config nil t)
  (define-sequential-command seq-home
    back-to-indentation beginning-of-line beginning-of-buffer seq-return)
  (global-set-key "\C-a" 'seq-home)
  (global-set-key "\C-e" 'seq-end)
  (global-set-key "\M-u" 'seq-upcase-backward-word)
  (global-set-key "\M-c" 'seq-capitalize-backward-word)
  (global-set-key "\M-l" 'seq-downcase-backward-word)
  (when (require 'org nil t)
    (define-key org-mode-map "\C-a" 'org-seq-home)
    (define-key org-mode-map "\C-e" 'org-seq-end)))
