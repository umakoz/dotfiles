;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

(when (require 'migemo nil t)
  (setq migemo-command "/usr/local/bin/cmigemo")
  ;(setq migemo-options '("-q" "--emacs" "-i" "¥a"))
  (setq migemo-options '("-q" "--emacs"))
  (setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")
  (setq migemo-coding-system 'utf-8-unix)
  (setq migemo-user-dictionary nil)
  (setq migemo-regex-dictionary nil)
  (load-library "migemo")
  (migemo-init))
