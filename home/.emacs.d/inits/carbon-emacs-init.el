;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

(setq mac-pass-control-to-system nil
      mac-pass-command-to-system nil
      mac-option-modifier 'meta
      mac-command-modifier 'meta
      mac-control-modifier 'control)
(mac-add-ignore-shortcut '(command))

;; フォント設定
(require 'carbon-font nil t)
;(setq mac-allow-anti-aliasing nil)
(defvar carbon-font-encode-family-list-bitvl
  '((ascii . "Bitstream Vera Sans Mono")
    (japanese-jisx0208 . "ヒラギノ角ゴ pro w3")
    (katakana-jisx0201 . "ヒラギノ角ゴ pro w3")
    (japanese-jisx0212 . "ヒラギノ角ゴ pro w3")
    ;(japanese-jisx0208 . "M+1VM+IPAG circle regular")
    ;(katakana-jisx0201 . "M+1VM+IPAG circle regular")
    ;(japanese-jisx0212 . "M+1VM+IPAG circle regular")
    (chinese-gb2312 . "stheiti*")
    (chinese-big5-1 . "lihei pro*")
    (korean-ksc5601 . "applegothic*")))
(carbon-font-create-fontset "bitvl"
                            carbon-font-defined-sizes
                            carbon-font-encode-family-list-bitvl)
(fixed-width-set-default-fontset "-*-*-medium-r-normal--12-*-*-*-*-*-bitvl")

;; http://groups.google.com/group/carbon-emacs/msg/287876a967948923
;; http://www.computerartisan.com/meadow/diary.txt
(defun frame-fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen 'fullboth)
  (when nt-p (w32-send-sys-command 61488)))

(defun frame-restore ()
  (interactive)
  (set-frame-parameter nil 'fullscreen nil)
  (when nt-p (w32-send-sys-command 61728)))

(defun toggle-fullscreen ()
  (interactive)
  (if (frame-parameter nil 'fullscreen)
      (frame-restore)
    (frame-fullscreen)))

(global-set-key [(meta return)] 'toggle-fullscreen)
;(add-hook 'window-setup-hook #'frame-fullscreen)

;; http://lists.sourceforge.jp/mailman/archives/macemacsjp-english/2006-April/000569.html
(defun hide-others ()
  (interactive)
  (do-applescript
   "tell application \"System Events\"
          set visible of every process whose (frontmost is false) and (visible is true) to false
        end tell"))

(defun hide-emacs ()
  (interactive)
  (do-applescript
   "tell application \"System Events\"
          set theFrontProcess to process 1 whose (frontmost is true) and (visible is true)
          set visible of theFrontProcess to false
        end tell"))
