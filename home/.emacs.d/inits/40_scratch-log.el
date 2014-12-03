;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

;; スクラッチバッファに書いた内容のログを取る等
;; http://d.hatena.ne.jp/kitokitoki/20100612/p1
(when (require 'scratch-log nil t)
  ;; (setq sl-scratch-log-file "~/.emacs.d/.scratch-log")
  ;; (setq sl-prev-scratch-string-file "~/.emacs.d/.scratch-log-prev")

  ;; nil なら emacs 起動時に，最後に終了したときの スクラッチバッファの内容を復元しない。初期値は t です。
  ;; (setq sl-restore-scratch-p nil)
  ;; nil なら スクラッチバッファを削除できるままにする。初期値は t です。
  ;; (setq sl-prohibit-kill-scratch-buffer-p nil)
  )
