;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

;; Cocoa Emacs
(setq mac-pass-option-to-system nil
      mac-pass-command-to-system nil
      mac-pass-control-to-system nil
      ns-right-command-modifier 'meta
      ns-control-modifier 'control
      ns-option-modifier 'super
      ns-command-modifier 'hyper
      delete-by-moving-to-trash t
      trash-directory "~/.Trash/emacs"
      ns-pop-up-frames nil)

(define-key global-map [ns-drag-file] 'ns-find-file)
(global-set-key [(meta return)] 'ns-toggle-fullscreen)

; (mac-get-current-input-source)
;; インラインパッチ適応時の設定
;(setq default-input-method "MacOSX")
;(setq default-input-method "japanese")
;(mac-set-input-method-parameter "com.apple.inputmethod.Kotoeri.Roman" 'cursor-type 'bar)
;(mac-set-input-method-parameter "com.google.inputmethod.Japanese.base" 'title "あ")
;(mac-set-input-method-parameter "com.google.inputmethod.Japanese.base" 'cursor-type 'box)
;(mac-set-input-method-parameter "com.google.inputmethod.Japanese.base" 'cursor-color "red"))


;; フォント設定
(setq mac-allow-anti-aliasing t)
(setq fixed-width-use-QuickDraw-for-ascii t)
(set-face-attribute 'default nil
                    :family "Bitstream Vera Sans Mono"
                    :height 120)
(set-fontset-font
 (frame-parameter nil 'font)
 'japanese-jisx0208
 '("M+1VM+IPAG circle" . "iso10646-1"))
(set-fontset-font
 (frame-parameter nil 'font)
 'japanese-jisx0212
 '("M+1VM+IPAG circle" . "iso10646-1"))
(setq face-font-rescale-alist
      '(("^-apple-hiragino.*" . 1.2)
        ("^-apple-Bitstream_Vera_Sans_Mono-.*" . 1.0)
        ("^-apple-M\\+1VM\\+IPAG_circle-.*" . 1.2)
        (".*osaka-bold.*" . 1.2)
        (".*osaka-medium.*" . 1.2)
        (".*courier-bold-.*-mac-roman" . 1.0)
        (".*monaco cy-bold-.*-mac-cyrillic" . 0.9)
        (".*monaco-bold-.*-mac-roman" . 0.9)
        ("-cdac$" . 1.3)))
