;;; -*- mode: emacs-lisp; coding: utf-8-unix; indent-tabs-mode: nil -*-

(when (require 'e2wm nil t)
  ; (global-set-key (kbd "H-e") 'e2wm:start-management)

  ; (setq e2wm:prefix-key "s-e")

  ;; キーバインド
  (e2wm:add-keymap
   e2wm:pst-minor-mode-keymap
   '(("s-1" . e2wm:dp-code)
     ("s-2" . e2wm:dp-two)
     ("s-3" . e2wm:dp-htwo)
     ("s-4" . e2wm:dp-doc)
     ("s-5" . e2wm:dp-dashboard)
     ("s-6" . e2wm:dp-magit)
     ;; ("s-7" . e2wm:dp-edbi)
     ("s-8" . e2wm:dp-array)
     ("s-p" . e2wm:pst-history-forward-command)
     ("s-n" . e2wm:pst-history-back-command)
     ("s-m" . e2wm:pst-window-select-main-command)
     ("s-i" . e2wm:dp-code-navi-imenu-command)
     ("s-f" . e2wm:dp-code-navi-files-command)
     ("s-r" . e2wm:pst-update-windows-command)
     ("s-q" . e2wm:stop-management)
     ) e2wm:prefix-key)


  ;; magit パースペクティブ
  (when (require 'e2wm-vcs nil t))



  ;; Emacs DBI パースペクティブ
  ;; https://github.com/kiwanami/emacs-edbi
  ;; (autoload 'e2wm:dp-edbi "e2wm-edbi" nil t)
  ;; (when (require 'edbi nil t)
  ;;   (setenv "DYLD_FALLBACK_LIBRARY_PATH" "/usr/local/oracle/instantclient_11_2")) ; Oracle Instant Clientパスの環境変数



  ;;
  ;; 公式の設定ひな形を引用
  ;; http://github.com/kiwanami/emacs-window-manager/raw/master/e2wm-config.el
  ;;

  ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; 機能干渉対応

  ;; For emacsclient
  ;; server-start を実行した後に、follow-mode を実行すると emacsclient と
  ;; の通信が出来なくなる。follow-mode が emacsclient のソケットプロセス
  ;; の入力を捨ててしまうことが原因。

  ;; 対策(1)
  ;; follow-intercept-processes を nil にすると、 follow-mode のプロセス
  ;; 乗っ取りを止めることが出来るが、外部プロセスの入力によって
  ;; follow-modeの位置がずれていくことがあるかもしれない。
  (setq follow-intercept-processes nil)

  ;; 対策(2)
  ;; follow-intercept-processes を nil にしたくない場合は、以下のように
  ;; follow-modeの関数を乗っ取ることでうまく動く。ただし、 follow-mode の
  ;; 実装が今後変わった場合には、動作は保証されない。
  ;; (eval-after-load "follow-mode"
  ;;   (defun follow-intercept-process-output ()
  ;;     "Intercept all active processes (Overrided by e2wm)."
  ;;     (interactive)
  ;;     (let ((list (process-list)))
  ;;       (while list
  ;;         (if (or (eq (process-filter (car list)) 'follow-generic-filter)
  ;;                 (eq (car list) server-process)) ; <- see the source at "server.el"
  ;;             nil
  ;;           (set-process-filter (car list) (process-filter (car list))))
  ;;         (setq list (cdr list))))
  ;;     (setq follow-intercept-processes t))
  ;;   )



  ;; For moccur
  ;; moccurの検索結果バッファでエンター（moccur-mode-goto-occurrence, moccur-grep-goto）し
  ;; たときの挙動を改善する。また、マッチのプレビュー表示でカーソールが移
  ;; 動しない問題はgoto-lineでウインドウの位置を修正するようにアドバイス。
  (eval-after-load "color-moccur"
    '(progn

       (defadvice moccur-mode-goto-occurrence (around e2wm:ad-override)
         ad-do-it
         (delete-window (selected-window)) ; Enterでmoccurのバッファを消す（消さない方が良ければこの行をコメント）
         (e2wm:pst-window-select-main))

       (defadvice moccur-grep-goto (around e2wm:ad-override)
         ad-do-it
         (delete-window (selected-window)) ; Enterでmoccurのバッファを消す（消さない方が良ければこの行をコメント）
         (e2wm:pst-window-select-main))
       
       (defadvice goto-line (around e2wm:ad-override)
         ad-do-it
         (let ((buf (or (ad-get-arg 2) (current-buffer))))
           (when (and
                  (e2wm:managed-p)
                  (eq (wlf:get-window (e2wm:pst-get-wm) 'sub) (selected-window))
                  (not (eql (selected-window) (get-buffer-window buf))))
             (set-window-point
              (get-buffer-window buf)
              (with-current-buffer buf (point))))))

       (when (e2wm:managed-p)
         (ad-activate-regexp "^e2wm:ad-override$"))
       ))



  ;; for terminal
  ;; https://gist.github.com/1247111
  ;; e2wmのフレームでもターミナルからcde
  (defun e2wm:current-buffer ()
    (cond
     ((e2wm:managed-p)
      (e2wm:history-get-main-buffer))
     ((featurep 'elscreen)
      (let* ((frame-confs (elscreen-get-frame-confs (selected-frame)))
             (num (nth 1 (assoc 'screen-history frame-confs)))
             (cur-window-conf (cadr (assoc num (assoc 'screen-property frame-confs))))
             (marker (nth 2 cur-window-conf)))
        (marker-buffer marker)))
     (t
      (nth 1
           (assoc 'buffer-list
                  (nth 1 (nth 1 (current-frame-configuration)))))))))
