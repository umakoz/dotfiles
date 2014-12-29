;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

(global-set-key [?¥] [?\\]) ; ¥の代わりにバックスラッシュを入力する
(global-set-key [delete] #'delete-char)
(global-set-key (kbd "C-l") 'goto-line)
(global-set-key [(shift f3)] 'kmacro-start-macro)
(global-set-key [f3] 'kmacro-end-or-call-macro)
(global-set-key (kbd "C-_") 'redo)
(global-set-key (kbd "C-%") 'replace-string)
(global-set-key (kbd "M-i") 'indent-region)

;; 分割したウィンドウ間の移動
;; マイ.emacs探訪 - I am Cruby!
;; http://d.hatena.ne.jp/authorNari/20091225/1261667956
;(define-key global-map [(C S n)] 'windmove-down)
;(define-key global-map [(C S p)] 'windmove-up)
;(define-key global-map [(C S b)] 'windmove-left)
;(define-key global-map [(C S f)] 'windmove-right)

;; 分割したウィンドウの大きさを Ctrl-上下キーで変える
;; とりあえず暇だったし何となく始めたブログ
;; http://d.hatena.ne.jp/khiker/20100118/emacs_arrow
(define-key global-map [(C up)] 'shrink-window)
(define-key global-map [(C down)] 'enlarge-window)
(define-key global-map [(C left)]
  '(lambda (size) (interactive "p") (shrink-window size t)))
(define-key global-map [(C right)]
  '(lambda (size) (interactive "p") (enlarge-window size t)))
