;;    _     __  __  __  __  ___  _  __ ___
;;   / \   |  \/  ||  \/  ||_ _|| |/ // _ \
;;  / _ \  | |\/| || |\/| | | | | ' /| | | |
;; / ___ \ | |  | || |  | | | | | . \| |_| |
;;/_/   \_\|_|  |_||_|  |_||___||_|\_\\___/
;;
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode t)
;;(global-display-line-numbers-mode t)
(set-face-attribute 'default nil :font "Iosevka" :height 140 :weight 'medium)
(set-face-attribute 'fixed-pitch nil :font "Iosevka" :height 140 :weight 'medium)
(set-face-attribute 'variable-pitch nil :font "Cantarell" :height 140 :weight 'regular)

(dolist (mode '(vterm-mode-hook))
 (add-hook mode (lambda () (display-line-numbers-mode 0))))
(fset 'anime-name
   (kmacro-lambda-form [?\C-s ?A ?n ?i return ?\M-b ?\M-d ?\C-d ?\C-s ?- return ?\C-d ?\C-b ?\C-b ?\C-d ?\C-s ?_ return ?\C-b ?\C-  ?\C-s ?. ?\C-b ?\C-w ?\C-b] 0 "%d"))

;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))


;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(vterm dired-hide-dotfiles magit peep-dired dired-open which-key doom-modeline all-the-icons doom-themes use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(use-package doom-themes
  :init (load-theme 'doom-nord-light t))

(use-package all-the-icons
  :ensure t)

(use-package doom-modeline
  :init (doom-modeline-mode t)
  :custom((doom-modeline-height 15)))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 1))


(use-package dired-open
  :config
  (setq dired-open-extensions '(("png" . "imv")
				("jpg" . "imv")
				("mkv" . "mpv")
				("webm" . "mpv")
				("mp4" . "mpv"))))
;;				("AppImages" . "")

(use-package peep-dired
  :config
  (setq peep-dired-cleanup-on-disable t)
  :bind (:map dired-mode-map
	      ("C-." . peep-dired)))


(use-package magit)

(use-package dired
  :ensure nil
  :hook
  (dired-mode . dired-hide-details-mode)
  :config
  (dired-async-mode 1)
  :bind (:map dired-mode-map
	      ("b" . dired-jump)))

(use-package dired-hide-dotfiles
  :hook (dired-mode . dired-hide-dotfiles-mode))
;;  :bind ("SPC-h" . dired-hide-dotfiles-mode))

(use-package vterm)
(use-package ibuffer
  :ensure nil
  :bind
  ("C-x C-b" . ibuffer))
