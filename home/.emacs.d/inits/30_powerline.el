;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

(when (require 'powerline nil t)
  (defun arrow-right-xpm (color1 color2)
    "Return an XPM right arrow string representing."
    (format "/* XPM */
static char * arrow_right[] = {
\"12 18 2 1\",
\".	c %s\",
\" 	c %s\",
\".           \",
\"..          \",
\"...         \",
\"....        \",
\".....       \",
\"......      \",
\".......     \",
\"........    \",
\".........   \",
\".........   \",
\"........    \",
\".......     \",
\"......      \",
\".....       \",
\"....        \",
\"...         \",
\"..          \",
\".           \"};"  color1 color2))

  (defun arrow-left-xpm (color1 color2)
    "Return an XPM right arrow string representing."
    (format "/* XPM */
static char * arrow_right[] = {
\"12 18 2 1\",
\".	c %s\",
\" 	c %s\",
\"           .\",
\"          ..\",
\"         ...\",
\"        ....\",
\"       .....\",
\"      ......\",
\"     .......\",
\"    ........\",
\"   .........\",
\"   .........\",
\"    ........\",
\"     .......\",
\"      ......\",
\"       .....\",
\"        ....\",
\"         ...\",
\"          ..\",
\"           .\"};"  color2 color1))


  (defconst powerline-color0 "#548")
  (defconst powerline-color1 "#437")
  (defconst powerline-color2 "#326")

  (defvar arrow-right-0 (create-image (arrow-right-xpm powerline-color0 powerline-color1) 'xpm t :ascent 'center))
  (defvar arrow-right-1 (create-image (arrow-right-xpm powerline-color1 powerline-color2) 'xpm t :ascent 'center))
  (defvar arrow-right-2 (create-image (arrow-right-xpm powerline-color2 "None") 'xpm t :ascent 'center))
  (defvar arrow-left-1  (create-image (arrow-left-xpm powerline-color2 powerline-color1) 'xpm t :ascent 'center))
  (defvar arrow-left-2  (create-image (arrow-left-xpm "None" powerline-color2) 'xpm t :ascent 'center))

  (setq-default mode-line-format
                (list  '(:eval (concat (propertize " %* %b " 'face 'mode-line-color-0)
                                       (propertize " " 'display arrow-right-0)))
                       '(:eval (concat (propertize " %Z " 'face 'mode-line-color-1)
                                       (propertize " " 'display arrow-right-1)))
                       '(:eval (concat (propertize " %m " 'face 'mode-line-color-2)
                                       (propertize " " 'display arrow-right-2)))

                       ;; Justify right by filling with spaces to right fringe - 16
                       ;; (16 should be computed rahter than hardcoded)
                       '(:eval (propertize " " 'display '((space :align-to (- right-fringe 17)))))

                       '(:eval (concat (propertize " " 'display arrow-left-2)
                                       (propertize " %p " 'face 'mode-line-color-2)))
                       '(:eval (concat (propertize " " 'display arrow-left-1)
                                       (propertize "%4l:%2c  " 'face 'mode-line-color-1)))
                       ))

  (make-face 'mode-line-color-0)
  (set-face-attribute 'mode-line-color-0 nil
                      :foreground "#fff"
                      :background powerline-color0)

  (make-face 'mode-line-color-1)
  (set-face-attribute 'mode-line-color-1 nil
                      :foreground "#fff"
                      :background powerline-color1)

  (make-face 'mode-line-color-2)
  (set-face-attribute 'mode-line-color-2 nil
                      :foreground "#fff"
                      :background powerline-color2)

  (set-face-attribute 'mode-line nil
                      :foreground "#fff"
                      :background "#214"
                      :box nil)

  (set-face-attribute 'mode-line-inactive nil
                      :foreground "#fff"
                      :background "#000"))
