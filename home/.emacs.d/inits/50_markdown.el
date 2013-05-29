;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

(autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown files" t)

(add-to-list 'auto-mode-alist '("\\.md$\\|\\.markdown$" . gfm-mode))

;; markdownコマンドはhomebrewでインストールしたものを利用する
(setq markdown-command "/usr/local/bin/markdown")

;; プレビュー時のCSS
;(setq markdown-css-path "/path/to/bootstrap/css/bootstrap.css")

;; Markedでプレビューする
;; from http://support.markedapp.com/kb/how-to-tips-and-tricks/marked-bonus-pack-scripts-commands-and-bundles
(defun markdown-preview-file ()
  "run Marked on the current file and revert the buffer"
  (interactive)
  (shell-command
   (format "open -a /Applications/Marked.app %s"
       (shell-quote-argument (buffer-file-name)))))
(global-set-key "\C-cp" 'markdown-preview-file)
