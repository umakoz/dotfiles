;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

;エスケープシーケンスを処理
(autoload 'ansi-color-for-comint-mode-on "ansi-color"
  "Set `ansi-color-for-comint-mode' to t." t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
