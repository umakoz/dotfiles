;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

;; variants of auto-save-buffers.
;; http://0xcc.net/unimag/12/
;; http://0xcc.net/misc/auto-save/auto-save-buffers.el
;; http://homepage3.nifty.com/oatu/emacs/archives/auto-save-buffers.el

(when (require 'auto-save-buffers-enhanced nil t)
  (setq auto-save-buffers-enhanced-interval 3) ; 指定のアイドル秒で保存
  ;(auto-save-buffers-enhanced-include-only-checkout-path t) ; VCS管理下のファイルだけを対象にする
  (auto-save-buffers-enhanced t))
