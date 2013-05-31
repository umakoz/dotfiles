;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

(when (require 'foreign-regexp nil t)

  (custom-set-variables
   '(foreign-regexp/regexp-type 'ruby)
   '(reb-re-syntax 'foreign-regexp)))
