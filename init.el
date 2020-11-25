(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode t)
(global-display-line-numbers-mode t)
(set-face-attribute 'default nil :font "Fira Code Retina" :height 140)
(set-face-attribute 'fixed-pitch nil :font "Fira Code Retina" :height 140)
(set-face-attribute 'variable-pitch nil :font "Cantarell" :height 140 :weight 'regular)



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
   '(magit peep-diredx peep-dired dired-open which-key doom-modeline all-the-icons doom-themes use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(use-package doom-themes
  :init (load-theme 'doom-nord-light t))

(use-package all-the-icons)

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
				("mp4" . "mpv"))))

(use-package peep-dired
  :bind ("C-." . peep-dired))
				
(defun my-dired-mode-setup ()     "show less information in dired buffers"   (dired-hide-details-mode 1))
(add-hook 'dired-mode-hook 'my-dired-mode-setup)

(use-package magit)
