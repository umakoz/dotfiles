;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

(when (require 'auto-highlight-symbol nil t)
  (global-auto-highlight-symbol-mode t))


(when (require 'highlight-symbol nil t)
  ;; 使いたい色を設定、repeatしてくれる
  (setq highlight-symbol-colors '("DarkOrange" "DodgerBlue1" "DeepPink1"))

  ;; 適宜keybindの設定
  (global-set-key (kbd "<f6>") 'highlight-symbol-at-point)
  (global-set-key (kbd "M-<f6>") 'highlight-symbol-remove-all))
