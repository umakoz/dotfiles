;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

;; based upon
;;   http://d.hatena.ne.jp/antipop/20080321/1206090430

(when (require 'yasnippet nil t)
  ;(add-to-list 'yas-snippet-dirs "~/.emacs.d/yasnippet/my_snippets")
  (setq yas/next-field-key "TAB")  ; default => "TAB"
        ;yas/use-menu nil
        ;yas/trigger-key "SPC"     ; default => "TAB"
        ;yas/buffer-local-condition
        ;; コメントやリテラルではスニペットを展開しない
        ;'(or (not (or (string= "font-lock-comment-face"
        ;                       (get-char-property (point) 'face))
        ;              (string= "font-lock-string-face"
        ;                       (get-char-property (point) 'face))))
        ;     '(require-snippet-condition . force-in-comment)))

  (global-unset-key (kbd "s-y"))
  (global-set-key (kbd "s-y n") 'yas/new-snippet)
  (global-set-key (kbd "s-y f") 'yas/visit-snippet-file)

  (and (require 'dropdown-list nil t)
       (setq yas/prompt-functions '(yas/dropdown-prompt
                                    yas/completing-prompt)))

  ;; yasnippet展開中はflymakeを無効にする
  (defvar flymake-is-active-flag nil)
  (defadvice yas/expand-snippet
    (before inhibit-flymake-syntax-checking-while-expanding-snippet activate)
    (setq flymake-is-active-flag
          (or flymake-is-active-flag
              (assoc-default 'flymake-mode (buffer-local-variables))))
    (when flymake-is-active-flag
      (flymake-mode-off)))
  (add-hook 'yas/after-exit-snippet-hook
            '(lambda ()
               (when flymake-is-active-flag
                 (flymake-mode-on)
                 (setq flymake-is-active-flag nil))))


  ;; auto-completeを展開中にyasnippetを無効にする https://gist.github.com/750077
  ;; yasnippet and auto-complete
  (defvar ac-yas-expand-autostart-backup nil "保存用")

  (defun ac-yas-expand-start ()
    "yasnippet展開開始時にはACを止める"
    (setq ac-yas-expand-autostart-backup ac-auto-start)
    (setq ac-auto-start nil))

  (defun ac-yas-expand-end ()
    "yasnippet展開終了時にACを再開させる"
    (setq ac-auto-start ac-yas-expand-autostart-backup))

  (defun ac-yas-expand-install ()
    (interactive)
    (add-hook 'yas/before-expand-snippet-hook 'ac-yas-expand-start)
    (add-hook 'yas/after-exit-snippet-hook 'ac-yas-expand-end))

  (defun ac-yas-expand-uninstall ()
    (interactive)
    (remove-hook 'yas/before-expand-snippet-hook 'ac-yas-expand-start)
    (remove-hook 'yas/after-exit-snippet-hook 'ac-yas-expand-end))

  ;;(ac-yas-expand-install)



  ;; yasnippetで同じパターンを連続入力する
  ;; http://d.hatena.ne.jp/rubikitch/20090702/1246477577
  (defvar yas/oneshot-snippet nil)
  (defun yas/register-oneshot-snippet (s e)
    (interactive "r")
    (setq yas/oneshot-snippet (buffer-substring-no-properties s e))
    (delete-region s e)
    (yas/expand-oneshot-snippet)
    (message "%s" (substitute-command-keys "Press \\[yas/expand-oneshot-snippet] to expand.")))
  
  (defun yas/expand-oneshot-snippet ()
    (interactive)
    (if (string< "0.6" yas/version)
        (yas/expand-snippet yas/oneshot-snippet)
      (yas/expand-snippet (point) (point) yas/oneshot-snippet)))
  
  ;; (require 'sequential-command)
  (define-sequential-command kill-ring-save-x
    kill-ring-save yas/register-oneshot-snippet)
  (define-key esc-map "w" 'kill-ring-save-x) ; M-w
  (define-key global-map "\C-x\C-y" 'yas/expand-oneshot-snippet)


  ;; yasnippet.elを256倍にパワーアップ！連続展開と条件分岐テンプレートを使おう
  ;; http://d.hatena.ne.jp/rubikitch/20101204/yasnippet
  (defun yas/expand-link (key)
    "Hyperlink function for yasnippet expansion."
    (delete-region (point-at-bol) (1+ (point-at-eol)))
    (insert key)
    (yas/expand))

  (defun yas/expand-link-choice (&rest keys)
    "Hyperlink to select yasnippet template."
    (yas/expand-link (completing-read "Select template: " keys nil t)))
  ;; (yas/expand-link-choice "defgp" "defcm")


  ;; yasnippet初期化
  (yas-global-mode 1))
  ;;(yas/initialize)
  ;;(mapc 'yas/load-directory yas/root-directory))
