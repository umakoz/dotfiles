;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

(setq dired-bind-jump t
      dired-recursive-copies 'always
      dired-recursive-deletes 'always
      dired-guess-shell-alist-user
      '(("\\.tar\\.gz\\'"  "tar tzvf")
        ("\\.taz\\'" "tar ztvf")
        ("\\.tar\\.bz2\\'" "tar tjvf")
        ("\\.zip\\'" "unzip -l")
        ("\\.\\(g\\|\\) z\\'" "zcat")))

;; sorter
(add-hook 'dired-load-hook
          (lambda ()
            (require 'sorter nil t)))

;; dired-x
;(when (locate-library "dired-x")
;  (add-hook 'dired-load-hook
;            (lambda ()
;              (load "dired-x"))))
(when (require 'dired-x nil t))

;; dired+
(when (require 'dired+ nil t))

;; wdired
(when (require 'wdired nil t)
  (add-hook 'dired-mode-hook
            (lambda ()
              (define-key (current-local-map) "r"
                'wdired-change-to-wdired-mode))))

;; スペースでマークする (FD like)
(defun dired-toggle-mark (arg)
  "Toggle the current (or next ARG) files."
  ;; S.Namba Sat Aug 10 12:20:36 1996
  (interactive "P")
  (let ((dired-marker-char
         (if (save-excursion (beginning-of-line)
                             (looking-at " "))
             dired-marker-char ?\040)))
    (dired-mark arg)
    (dired-previous-line 1)))

(add-hook 'dired-mode-hook
          (lambda ()
            (define-key (current-local-map) " "
              'dired-toggle-mark)))

;;; dired を使って、一気にファイルの coding system (漢字) を変換する
;; dired で m でマークを付け，T とします．これで，マークを付けたファイルの
;; 文字コードを変換できます．
(when (require 'dired-aux nil t)
  (add-hook 'dired-mode-hook
            (lambda ()
              (define-key (current-local-map) "T"
                'dired-do-convert-coding-system))))

  (defvar dired-default-file-coding-system nil
    "*Default coding system for converting file (s).")

(defvar dired-file-coding-system 'no-conversion)

(defun dired-convert-coding-system ()
  (let ((file (dired-get-filename))
        (coding-system-for-write dired-file-coding-system)
        failure)
    (condition-case err
        (with-temp-buffer
          (insert-file file)
          (write-region (point-min) (point-max) file))
      (error (setq failure err)))
    (if (not failure)
        nil
      (dired-log "convert coding system error for %s:\n%s\n" file failure)
      (dired-make-relative file))))

(defun dired-do-convert-coding-system (coding-system &optional arg)
  "Convert file (s) in specified coding system."
  (interactive
   (list (let ((default (or dired-default-file-coding-system
                            buffer-file-coding-system)))
           (read-coding-system
            (format "Coding system for converting file (s) (default, %s): "
                    default)
            default))
         current-prefix-arg))
  (check-coding-system coding-system)
  (setq dired-file-coding-system coding-system)
  (dired-map-over-marks-check
   (function dired-convert-coding-system) arg 'convert-coding-system t))

; "r"入力でファイル名リネーム
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

; バッファを新しく開かない
(defun dired-find-alternate-file ()
"In dired, visit this file or directory instead of the dired buffer."
(interactive)
(set-buffer-modified-p nil)
(find-alternate-file (dired-get-filename)))

; 本日変更ファイルを強調
(defface my-face-f-2 '((t (:foreground "GreenYellow"))) nil :group 'basic-faces)
(defvar my-face-f-2 'my-face-f-2)
(defun my-dired-today-search (arg)
"Fontlock search function for dired."
(search-forward-regexp
  (concat (format-time-string "%b %e" (current-time)) " [0-9]....") arg t))

(add-hook 'dired-mode-hook
          '(lambda ()
            (font-lock-add-keywords major-mode
             (list '(my-dired-today-search . my-face-f-2)))))
