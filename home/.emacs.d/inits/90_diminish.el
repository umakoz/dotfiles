;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

(when (require 'diminish nil t)
  (eval-after-load "abbrev" '(diminish 'abbrev-mode))
  (eval-after-load "auto-highlight-symbol" '(diminish 'auto-highlight-symbol-mode))
  (eval-after-load "auto-complete" '(diminish 'auto-complete-mode))
  (eval-after-load "git-gutter" '(diminish 'git-gutter-mode))
  (eval-after-load "helm" '(diminish 'helm-mode))
  (eval-after-load "magit" '(diminish 'magit-auto-revert-mode))
  (eval-after-load "smartparens" '(diminish 'smartparens-mode))
  (eval-after-load "undo-tree" '(diminish 'undo-tree-mode))
  (eval-after-load "volatile-highlights" '(diminish 'volatile-highlights-mode))
  (eval-after-load "yasnippet" '(diminish 'yas-minor-mode))
  (eval-after-load "whitespace" '(diminish 'global-whitespace-mode)))
