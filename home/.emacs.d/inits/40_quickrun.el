;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

(when (require 'quickrun nil t)
  ; (setq quickrun-debug t)

  ;; popwinで表示
  (push '("*quickrun*") popwin:special-display-config)

  ;; region選択されていたら quickrun-region されていなかったら quickrun を実行する
  (defun quickrun-sc (start end)
    (interactive "r")
    (if mark-active
        (quickrun :start start :end end)
      (quickrun)))

  ;; Override ruby command for bundler
  (quickrun-add-command "ruby/bundle"
    '((:command . "bundle exec ruby")
       (:compile-only . "%c -wc %s")
       (:description . "Run Ruby script with Bundler"))
    :mode 'ruby-mode)
  (quickrun-set-default "ruby" "ruby/bundle")

  (global-set-key (kbd "<f5>") 'quickrun-sc))
