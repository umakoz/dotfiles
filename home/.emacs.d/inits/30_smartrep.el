;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

(when (require 'smartrep nil t)
  (declare-function smartrep-define-key "smartrep")
  (global-unset-key "\C-t")
  (smartrep-define-key global-map "C-t"
                       '(("C-p"      . 'mc/mark-previous-like-this)
                         ("C-n"      . 'mc/mark-next-like-this)
                         ("C-<up>"   . 'mc/mark-previous-like-this)
                         ("C-<down>" . 'mc/mark-next-like-this)
                         ("C-P"      . 'mc/mark-previous-word-like-this)
                         ("C-N"      . 'mc/mark-next-word-like-this)
                         ("M-p"      . 'mc/mark-previous-symbol-like-this)
                         ("M-n"      . 'mc/mark-next-symbol-like-this)
                         ("*"        . 'mc/mark-all-like-this))))
