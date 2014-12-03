;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

(when (require 'undohist nil t)
  (undohist-initialize))

(when (require 'undo-tree nil t)
  (global-undo-tree-mode)

  (define-key undo-tree-visualizer-mode-map (kbd "j") 'undo-tree-visualize-redo)
  (define-key undo-tree-visualizer-mode-map (kbd "k") 'undo-tree-visualize-undo)
  (define-key undo-tree-visualizer-mode-map (kbd "h") 'undo-tree-visualize-switch-branch-left)
  (define-key undo-tree-visualizer-mode-map (kbd "l") 'undo-tree-visualize-switch-branch-right))
