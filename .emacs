(setq inhibit-startup-screen t)
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))

  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("bd7b7c5df1174796deefce5debc2d976b264585d51852c962362be83932873d9" "cc0dbb53a10215b696d391a90de635ba1699072745bf653b53774706999208e3" "11986184025c9e658eeff90e95ab8e9592f40b3564a5854f9ce1eab1804abd79" "2642a1b7f53b9bb34c7f1e032d2098c852811ec2881eec2dc8cc07be004e45a0" "24fc62afe2e5f0609e436aa2427b396adf9a958a8fa660edbaab5fb13c08aae6" "c9ddf33b383e74dac7690255dd2c3dfa1961a8e8a1d20e401c6572febef61045" "36ca8f60565af20ef4f30783aa16a26d96c02df7b4e54e9900a5138fb33808da" default)))
 '(ecb-non-semantic-exclude-modes (quote (fundamental-mode text-mode)))
 '(ecb-options-version "2.50")
 '(org-agenda-files (quote ("~/aws-services/aws-services.org")))
 '(package-selected-packages
   (quote
    (ecb php-mode dired-sidebar smart-tab ox-pandoc epresent org-brain org markdown-mode monokai-theme minimal-theme metalheart-theme atom-dark-theme arc-dark-theme ample-theme emmet-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'monokai t)
(add-hook 'org-mode-hook (lambda()
(local-set-key [3 97] (quote org-agenda))))

(setq org-todo-keywords
      '((sequence "TODO" "IN-PROGRESS" "WAITING" "DONE")))

(defun display-buffer-at-bottom--display-buffer-at-bottom-around (orig-fun &rest args)
"Bugfix for ECB: cannot use display-buffer-at-bottom', call display-buffer-use-some-window' instead in ECB frame."
(if (and ecb-minor-mode (equal (selected-frame) ecb-frame))
(apply 'display-buffer-use-some-window args)
(apply orig-fun args)))
(advice-add 'display-buffer-at-bottom :around #'display-buffer-at-bottom--display-buffer-at-bottom-around)

(global-set-key "" (quote ecb-activate))
