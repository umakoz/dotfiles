;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

(when (require 'ag nil t)
  (setq ag-highlight-search t  ; 検索結果の中の検索語をハイライトする
        ag-reuse-window nil    ; 現在のウィンドウを検索結果表示に使う
        ag-reuse-buffers nil)) ; 現在のバッファを検索結果表示に使う

(when (require 'wgrep-ag nil t)
  (autoload 'wgrep-ag-setup "wgrep-ag")
  (add-hook 'ag-mode-hook 'wgrep-ag-setup)

  ;; agの検索結果バッファで"r"で編集モードに。
  ;; C-x C-sで保存して終了、C-x C-kで保存せずに終了
  (define-key ag-mode-map (kbd "r") 'wgrep-change-to-wgrep-mode)

  ;; キーバインドを適当につけておくと便利。"\C-xg"とか
  (global-set-key  (kbd "C-x g") 'ag))
