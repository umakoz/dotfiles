;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

(fset 'yes-or-no-p 'y-or-n-p)

(setq-default indent-tabs-mode nil)

(setq completion-ignore-case t
      display-time-day-and-date nil
      ;;display-time-24hr-format t
      display-time-string-forms '(month "/" day " " dayname " " 24-hours ":" minutes)
      enable-recursive-minibuffers nil
      frame-title-format `(" %b " (buffer-file-name "( %f )"))
      gc-cons-threshold (* 32 1024 1024)
      large-file-warning-threshold (* 100 1024 1024) ;100MB
      inhibit-startup-screen t
      kill-ring-max 300
      kill-whole-line t
      next-line-add-newlines nil
      system-time-locale "C"
      ;visible-bell t
      ring-bell-function 'ignore
      x-select-enable-clipboard t
      use-dialog-box nil
      default-tab-width 4)

(mapc '(lambda (f)
         (let ((func (car f)) (args (cdr f)))
           (when (functionp func)
             (apply func args))))
      '((line-number-mode t)
        (global-font-lock-mode t)
        (temp-buffer-resize-mode t)
        (keyboard-translate ?\C-h ?\C-?) ; C-hをbackspaceにする
        (column-number-mode t)
        (display-time)
        (menu-bar-mode 1)
        (tool-bar-mode -1)
        (set-scroll-bar-mode 'right)
        (scroll-bar-mode -1)
        (windmove-default-keybindings))) ; emacsの画面をC-x-2などで分割したときにShift+矢印キーで分割ウィンドウの移動が可能

(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

;; 同一ファイル名のバッファ名を分かりやすく
(when (require 'uniquify nil t)
  (setq uniquify-buffer-name-style 'post-forward-angle-brackets
        uniquify-ignore-buffers-re "*[^*]+*"
        uniquify-min-dir-content 1))

;; http://www.emacsblog.org/2007/02/27/quick-tip-add-occur-to-isearch/
(define-key isearch-mode-map (kbd "C-o")
  (lambda ()
    (interactive)
    (let ((case-fold-search isearch-case-fold-search))
      (occur (if isearch-regexp isearch-string
               (regexp-quote isearch-string))))))

;;; 選択範囲をisearch
(defadvice isearch-mode (around isearch-mode-default-string (forward &optional regexp op-fun recursive-edit word-p) activate)
  (if (and transient-mark-mode mark-active (not (eq (mark) (point))))
      (progn
        (isearch-update-ring (buffer-substring-no-properties (mark) (point)))
        (deactivate-mark)
        ad-do-it
        (if (not forward)
            (isearch-repeat-backward)
          (goto-char (mark))
          (isearch-repeat-forward)))
    ad-do-it))

;; grep-edit
(require 'grep-edit nil t)

;;kill-ring に同じ内容の文字列を複数入れない
(defadvice kill-new (before ys:no-kill-new-duplicates activate)
  (setq kill-ring (delete (ad-get-arg 0) kill-ring)))
(setq-default minibuffer-setup-hook)

;; http://www.bookshelf.jp/cgi-bin/goto.cgi?file=meadow&node=delete%20history
(add-hook
 'minibuffer-setup-hook
 '(lambda ()
    (mapc
     '(lambda (arg)
        (set minibuffer-history-variable
             (cons arg
                   (remove arg
                           (symbol-value minibuffer-history-variable)))))
     (reverse (symbol-value minibuffer-history-variable)))))


;; バックアップはVCSとundoに任せて、ファイルは残さない
(setq make-backup-files nil)

;; redo
(require 'redo+)

;; install-elisp
(when (require 'install-elisp nil t)
  (setq install-elisp-repository-directory "~/.emacs.d/elisp/"))

;; yascroll
(when (require 'yascroll nil t)
  (global-yascroll-bar-mode 1))

;; Make Emacs stop asking "Active processes exist; kill them and exit anyway"
(add-hook 'comint-exec-hook 
      (lambda () (process-kill-without-query (get-buffer-process (current-buffer)))))
