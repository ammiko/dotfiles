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
(global-display-line-numbers-mode t)
(setq display-line-numbers-type 'relative)
(set-face-attribute 'default nil :font "monospace" :height 140 :width 'medium)
(set-face-attribute 'fixed-pitch nil :font "monospace" :height 140 :width 'medium)
(set-face-attribute 'variable-pitch nil :font "Cantarell" :height 140 :weight 'regular)
(server-mode)
(dolist (mode '(vterm-mode-hook
		dired-mode-hook
		eshell-mode-hook)
	)
  (add-hook mode (lambda () (display-line-numbers-mode 0)
		 )
  )
)

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
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#1c1e26" "#e95678" "#09f7a0" "#fab795" "#21bfc2" "#6c6f93" "#59e3e3" "#c7c9cb"])
 '(custom-safe-themes
   '("1623aa627fecd5877246f48199b8e2856647c99c6acdab506173f9bb8b0a41ac" "c83c095dd01cde64b631fb0fe5980587deec3834dc55144a6e78ff91ebc80b19" "7d708f0168f54b90fc91692811263c995bebb9f68b8b7525d0e2200da9bc903c" "711efe8b1233f2cf52f338fd7f15ce11c836d0b6240a18fffffc2cbd5bfe61b0" "e1ef2d5b8091f4953fe17b4ca3dd143d476c106e221d92ded38614266cea3c8b" "7a994c16aa550678846e82edc8c9d6a7d39cc6564baaaacc305a3fdc0bd8725f" "6b80b5b0762a814c62ce858e9d72745a05dd5fc66f821a1c5023b4f2a76bc910" "54cf3f8314ce89c4d7e20ae52f7ff0739efb458f4326a2ca075bf34bc0b4f499" "d6603a129c32b716b3d3541fc0b6bfe83d0e07f1954ee64517aa62c9405a3441" "4a8d4375d90a7051115db94ed40e9abb2c0766e80e228ecad60e06b3b397acab" "e074be1c799b509f52870ee596a5977b519f6d269455b84ed998666cf6fc802a" "79278310dd6cacf2d2f491063c4ab8b129fee2a498e4c25912ddaa6c3c5b621e" "08a27c4cde8fcbb2869d71fdc9fa47ab7e4d31c27d40d59bf05729c4640ce834" "6c3b5f4391572c4176908bb30eddc1718344b8eaff50e162e36f271f6de015ca" "e72f5955ec6d8585b8ddb2accc2a4cb78d28629483ef3dcfee00ef3745e2292f" "7b3d184d2955990e4df1162aeff6bfb4e1c3e822368f0359e15e2974235d9fa8" "6084dce7da6b7447dcb9f93a981284dc823bab54f801ebf8a8e362a5332d2753" "730a87ed3dc2bf318f3ea3626ce21fb054cd3a1471dcd59c81a4071df02cb601" "2cdc13ef8c76a22daa0f46370011f54e79bae00d5736340a5ddfe656a767fddf" "93ed23c504b202cf96ee591138b0012c295338f38046a1f3c14522d4a64d7308" "2f1518e906a8b60fac943d02ad415f1d8b3933a5a7f75e307e6e9a26ef5bf570" "4f01c1df1d203787560a67c1b295423174fd49934deb5e6789abd1e61dba9552" "b5fff23b86b3fd2dd2cc86aa3b27ee91513adaefeaa75adc8af35a45ffb6c499" "bf387180109d222aee6bb089db48ed38403a1e330c9ec69fe1f52460a8936b66" "3c2f28c6ba2ad7373ea4c43f28fcf2eed14818ec9f0659b1c97d4e89c99e091e" "5b809c3eae60da2af8a8cfba4e9e04b4d608cb49584cb5998f6e4a1c87c057c4" "71e5acf6053215f553036482f3340a5445aee364fb2e292c70d9175fb0cc8af7" "d74c5485d42ca4b7f3092e50db687600d0e16006d8fa335c69cf4f379dbd0eee" "be9645aaa8c11f76a10bcf36aaf83f54f4587ced1b9b679b55639c87404e2499" "9efb2d10bfb38fe7cd4586afb3e644d082cbcdb7435f3d1e8dd9413cbe5e61fc" "cae81b048b8bccb7308cdcb4a91e085b3c959401e74a0f125e7c5b173b916bf9" "74ba9ed7161a26bfe04580279b8cad163c00b802f54c574bfa5d924b99daa4b9" "6c9cbcdfd0e373dc30197c5059f79c25c07035ff5d0cc42aa045614d3919dab4" "3df5335c36b40e417fec0392532c1b82b79114a05d5ade62cfe3de63a59bc5c6" "188fed85e53a774ae62e09ec95d58bb8f54932b3fd77223101d036e3564f9206" "e6ff132edb1bfa0645e2ba032c44ce94a3bd3c15e3929cdf6c049802cf059a2a" "76bfa9318742342233d8b0b42e824130b3a50dcc732866ff8e47366aed69de11" "c4bdbbd52c8e07112d1bfd00fee22bf0f25e727e95623ecb20c4fa098b74c1bd" "f2927d7d87e8207fa9a0a003c0f222d45c948845de162c885bf6ad2a255babfd" "4bca89c1004e24981c840d3a32755bf859a6910c65b829d9441814000cf6c3d0" "990e24b406787568c592db2b853aa65ecc2dcd08146c0d22293259d400174e37" "a3b6a3708c6692674196266aad1cb19188a6da7b4f961e1369a68f06577afa16" "d5a878172795c45441efcd84b20a14f553e7e96366a163f742b95d65a3f55d71" "c086fe46209696a2d01752c0216ed72fd6faeabaaaa40db9fc1518abebaf700d" "5036346b7b232c57f76e8fb72a9c0558174f87760113546d3a9838130f1cdb74" "01cf34eca93938925143f402c2e6141f03abb341f27d1c2dba3d50af9357ce70" "99ea831ca79a916f1bd789de366b639d09811501e8c092c85b2cb7d697777f93" default))
 '(fci-rule-color "#f9cec3")
 '(icomplete-mode t)
 '(jdee-db-active-breakpoint-face-colors (cons "#16161c" "#e95678"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#16161c" "#09f7a0"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#16161c" "#6a6a6a"))
 '(objed-cursor-color "#e95678")
 '(package-selected-packages
   '(all-the-icons-dired no-littering emojify vterm dired-hide-dotfiles magit peep-dired dired-open which-key doom-modeline all-the-icons doom-themes use-package))
 '(pdf-view-midnight-colors (cons "#c7c9cb" "#1c1e26"))
 '(rustic-ansi-faces
   ["#1c1e26" "#e95678" "#09f7a0" "#fab795" "#21bfc2" "#6c6f93" "#59e3e3" "#c7c9cb"])
 '(vc-annotate-background "#1c1e26")
 '(vc-annotate-color-map
   (list
    (cons 20 "#09f7a0")
    (cons 40 "#59e19c")
    (cons 60 "#a9cc98")
    (cons 80 "#fab795")
    (cons 100 "#f6ab8f")
    (cons 120 "#f39f89")
    (cons 140 "#f09383")
    (cons 160 "#c48788")
    (cons 180 "#987a8d")
    (cons 200 "#6c6f93")
    (cons 220 "#95668a")
    (cons 240 "#bf5e81")
    (cons 260 "#e95678")
    (cons 280 "#c95b74")
    (cons 300 "#a96071")
    (cons 320 "#89656d")
    (cons 340 "#f9cec3")
    (cons 360 "#f9cec3")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(use-package doom-themes
  :init (load-theme 'doom-vibrant t))

(use-package all-the-icons
  :ensure t)

(use-package doom-modeline
  :init (doom-modeline-mode t)
  :custom (doom-modeline-height 40)
)

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 1)
)

(use-package dired-open
  :config
  (setq dired-open-extensions '(("png" . "sxiv")
				("jpg" . "sxiv")
				("mkv" . "mpv")
				("webm" . "mpv")
				("mp4" . "mpv")
				("epub" . "zathura")
				("pdf" . "zathura"))))

(use-package magit)

(defun manga()
  (interactive)
  (save-window-excursion
  (async-shell-command "sxiv *")))

(use-package dired-hide-dotfiles)

(use-package all-the-icons-dired)

(use-package peep-dired)

(use-package dired
  :ensure nil
  :hook
  (dired-mode . dired-hide-details-mode)
  (dired-mode . dired-hide-dotfiles-mode)
  (dired-mode . all-the-icons-dired-mode)
  :config
  (dired-async-mode 1)
  :bind (:map dired-mode-map
	      ("b" . dired-jump)
	      ("C-." . dired-hide-dotfiles-mode)
	      ("C-c p" . peep-dired)
	      ("C-c m" . manga)
	)
)

(use-package vterm)

(use-package ibuffer
  :ensure nil
  :bind
  ("C-x C-b" . ibuffer)
)

;;(use-package ido
;;  :ensure nil
;;  :config
;;  (ido-mode 1)
;;  (setq ido-enable-flex-matching t)
;;  (setq ido-everywhere t)
;;  :bind
;;  ("s-b" . ido-switch-buffer)
;;  ("s-d" . ido-dired)
;;  ("s-f" . ido-find-file))

(use-package emojify
  :hook (after-init . global-emojify-mode)
)

(use-package icomplete
  :ensure nil
  :config
  (icomplete-mode t)
  (fido-mode t)
)

(use-package minibuffer
  :ensure nil
  :config
  (setq icomplete-separator " -> ")
  (setq completion-ignore-case t)
)
