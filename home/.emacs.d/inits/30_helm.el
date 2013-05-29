;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

;; https://github.com/emacs-helm/helm
(when (and (require 'helm-config nil t)
           (require 'helm nil t))
  (helm-mode 1)
  (setq helm-idle-delay 0.3)
  (setq helm-input-idle-delay 0)
  (setq helm-candidate-number-limit 1000)

  (global-set-key (kbd "C-x f") 'helm-for-files)
  (global-set-key (kbd "C-c j") 'helm-bookmarks)
  (global-set-key [f11] 'helm-imenu)

  ;; 自動補完を無効
  ;; http://fukuyama.co/nonexpansion
  (custom-set-variables '(helm-ff-auto-update-initial-value nil))
  ;; C-hでバックスペースと同じように文字を削除
  (define-key helm-c-read-file-map (kbd "C-h") 'delete-backward-char)
  ;; TABで任意補完。選択肢が出てきたらC-nやC-pで上下移動してから決定することも可能
  (define-key helm-c-read-file-map (kbd "TAB") 'helm-execute-persistent-action)


  ;; https://github.com/syohex/emacs-helm-ag
  (when (require 'helm-ag nil t)
    (global-set-key (kbd "C-;") 'helm-ag)
    (global-set-key (kbd "C-,") 'helm-ag-pop-stack))

  ;; https://github.com/emacs-helm/helm-ls-git
  (when (require 'helm-ls-git nil t)
    (global-set-key (kbd "C-x p") 'helm-ls-git-ls))

  ;; https://github.com/syohex/emacs-helm-gtags
  (when (require 'helm-gtags nil t)
      (setq helm-gtags-classify t)
      (global-set-key "\M-p" 'helm-gtags-select))

  ;; https://github.com/emacs-helm/helm-c-moccur
  (when (require 'helm-c-moccur nil t)
    (setq helm-c-moccur-enable-initial-pattern t)
    (setq helm-c-moccur-helm-idle-delay 0.1)
    (defalias 'aoccur 'helm-c-moccur-occur-by-moccur)
    (global-set-key (kbd "M-o") 'helm-c-moccur-occur-by-moccur)
    (global-set-key (kbd "C-M-o") 'helm-c-moccur-dmoccur)
    (add-hook 'dired-mode-hook
              '(lambda ()
                 (local-set-key (kbd "O") 'helm-c-moccur-dired-do-moccur-by-moccur)))
    (global-set-key (kbd "C-M-s") 'helm-c-moccur-isearch-forward)
    (global-set-key (kbd "C-M-r") 'helm-c-moccur-isearch-backward))


  ;; https://github.com/emacs-helm/helm-migemo
  (require 'helm-migemo nil t)



  ;; https://github.com/emacs-helm/helm-c-yasnippet
  (when (require 'helm-c-yasnippet nil t)
    (setq helm-c-yas-space-match-any-greedy t) ;スペース区切りで絞り込めるようにする
    (global-set-key (kbd "C-c y") 'helm-c-yas-complete))


  ;; https://github.com/emacs-helm/helm-descbinds
  (when (require 'helm-descbinds nil t)
    (helm-descbinds-mode 1)
    (global-set-key (kbd "<f12>") 'helm-descbinds))

  (global-set-key (kbd "M-y") 'helm-show-kill-ring))
