;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

(load-theme 'solarized-dark t)


;;(modify-all-frames-parameters (list (cons 'alpha  '(99 79 59 39))))
(modify-all-frames-parameters (list (cons 'alpha  '(99 99 99 99))))
;; 変更行をハイライト
;;(global-highlight-changes 'active)
;;(add-hook 'write-file-hooks 'highlight-changes-rotate-faces)
;; 現在行をハイライト
(global-hl-line-mode 1)
;(set-face-background 'hl-line "#330")
