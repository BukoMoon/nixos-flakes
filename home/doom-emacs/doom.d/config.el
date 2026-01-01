;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "BukoMoon"
      user-mail-address "louisadams228@gmail.com")

(setq doom-font (font-spec :family "CaskaydiaMono Nerd Font Mono" :size 15)
      doom-variable-pitch-font (font-spec :family "CaskaydiaMono Nerd Font Mono" :size 18)
      doom-unicode-font (font-spec :family "CaskaydiaMono Nerd Font Mono")
      doom-big-font (font-spec :family "CaskaydiaMono Nerd Font Mono" :size 22))

;; change theme background
(add-to-list 'custom-theme-load-path "~/.config/doom/themes/")
(load-theme 'noctalia t)

;; Maintain Terminal transparency
(after! doom-themes
  (unless (display-graphic-p)
    (set-face-background 'default "undefined")))

;; Transparency
(set-frame-parameter (selected-frame) 'alpha '(96 . 97))
(add-to-list 'default-frame-alist '(alpha . (96 . 97)))

;; Send files to trash instead of fully deleting
(setq delete-by-moving-to-trash t)
;; Save automatically
(setq auto-save-default t)

;; Performance optimizations
(setq gc-cons-threshold (* 256 1024 1024))
(setq read-process-output-max (* 4 1024 1024))
(setq comp-deferred-compilation t)
(setq comp-async-jobs-number 8)

;; Garbage collector optimization
(setq gcmh-idle-delay 5)
(setq gcmh-high-cons-threshold (* 1024 1024 1024))

;; Version control optimization
(setq vc-handled-backends '(Git))

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org")

(use-package org
  :ensure nil
  :custom (org-modules '(org-habit)))

(after! org
  (map! :map org-mode-map
        :n "<M-left>" #'org-do-promote
        :n "<M-right>" #'org-do-demote)
  )

;; LSP Performance optimizations and settings
(after! lsp-mode
  (setq lsp-idle-delay 0.5
        lsp-log-io nil
        lsp-completion-provider :capf
        lsp-enable-file-watchers nil
        lsp-enable-folding nil
        lsp-enable-text-document-color nil
        lsp-enable-on-type-formatting nil
        lsp-enable-snippet nil
        lsp-enable-symbol-highlighting nil
        lsp-enable-links nil
        ;; Go-specific settings
        lsp-go-hover-kind "FullDocumentation"  ; CHANGED: was "Synopsis"
        lsp-go-analyses '((nilness . t)        ; CHANGED: removed fieldalignment
                          (unusedwrite . t)
                          (unusedparams . t))
        ;; Register custom gopls settings
        lsp-gopls-completeUnimported t
        lsp-gopls-staticcheck t
        lsp-gopls-analyses '((unusedparams . t)
                             (unusedwrite . t))))
;; LSP UI settings for better performance
(after! lsp-ui
  (setq lsp-ui-doc-enable t
        lsp-ui-doc-position 'at-point
        lsp-ui-doc-max-height 8
        lsp-ui-doc-max-width 72
        lsp-ui-doc-show-with-cursor t
        lsp-ui-doc-delay 0.5
        lsp-ui-sideline-enable nil
        lsp-ui-peek-enable t))

(after! project
  ;; Master project detection function - extensible for all project types
  (add-hook 'project-find-functions
            (lambda (dir)
              (cond
               ;; Go projects
               ((locate-dominating-file dir "go.mod")
                (cons 'transient (locate-dominating-file dir "go.mod")))

               ;; Rust projects
               ((locate-dominating-file dir "Cargo.toml")
                (cons 'transient (locate-dominating-file dir "Cargo.toml")))

               ;; Node.js projects
               ((locate-dominating-file dir "package.json")
                (cons 'transient (locate-dominating-file dir "package.json")))

               ;; Python projects (multiple markers)
               ((or (locate-dominating-file dir "pyproject.toml")
                    (locate-dominating-file dir "setup.py")
                    (locate-dominating-file dir "requirements.txt"))
                (cons 'transient (or (locate-dominating-file dir "pyproject.toml")
                                     (locate-dominating-file dir "setup.py")
                                     (locate-dominating-file dir "requirements.txt"))))

               ;; Generic git projects (fallback)
               ((locate-dominating-file dir ".git")
                (cons 'transient (locate-dominating-file dir ".git")))))))

;; Enable Treesitter for Go in org
(after! tree-sitter
  (require 'tree-sitter-langs)
  (add-to-list 'tree-sitter-major-mode-language-alist '(org-mode . go)))

(use-package! svelte-mode
  :mode "\\.svelte\\'"
  :config
  (setq svelte-basic-offset 2)
  ;; Disable automatic reformatting
  (setq svelte-format-on-save nil)
  ;; Use prettier instead
  (add-hook 'svelte-mode-hook 'prettier-js-mode))

;; Configure prettier
(use-package! prettier-js
  :config
  (setq prettier-js-args
        '("--parser" "svelte"
          "--tab-width" "2"
          "--use-tabs" "true")))

;; Treemacs
(require 'treemacs-all-the-icons)
(setq doom-themes-treemacs-theme "all-the-icons")

;; Setup writeroom width and appearance
(after! writeroom-mode
  ;; Set width for centered text
  (setq writeroom-width 40)

  ;; Ensure the text is truly centered horizontally
  (setq writeroom-fringes-outside-margins nil)
  (setq writeroom-center-text t)

  ;; Add vertical spacing for better readability
  (setq writeroom-extra-line-spacing 4)  ;; Adds space between lines

  ;; Improve vertical centering with visual-fill-column integration
  (add-hook! 'writeroom-mode-hook
    (defun my-writeroom-settings ()
      "Configure various settings when entering/exiting writeroom-mode."
      (if writeroom-mode
          (progn
            ;; When entering writeroom mode
            (display-line-numbers-mode -1)       ;; Turn off line numbers
            (setq cursor-type 'bar)              ;; Change cursor to a thin bar for writing
            (hl-line-mode -1)                    ;; Disable current line highlighting
            (setq left-margin-width 0)           ;; Let writeroom handle margins
            (setq right-margin-width 0)
            (text-scale-set 1)                   ;; Slightly increase text size

            ;; Improve vertical centering
            (when (bound-and-true-p visual-fill-column-mode)
              (visual-fill-column-mode -1))      ;; Temporarily disable if active
            (setq visual-fill-column-width 40)   ;; Match writeroom width
            (setq visual-fill-column-center-text t)
            (setq visual-fill-column-extra-text-width '(0 . 0))

            ;; Set top/bottom margins to improve vertical centering
            ;; These larger margins push content toward vertical center
            (setq-local writeroom-top-margin-size
                        (max 10 (/ (- (window-height) 40) 3)))
            (setq-local writeroom-bottom-margin-size
                        (max 10 (/ (- (window-height) 40) 3)))

            ;; Enable visual-fill-column for better text placement
            (visual-fill-column-mode 1))

        ;; When exiting writeroom mode
        (progn
          (display-line-numbers-mode +1)       ;; Restore line numbers
          (setq cursor-type 'box)              ;; Restore default cursor
          (hl-line-mode +1)                    ;; Restore line highlighting
          (text-scale-set 0)                   ;; Restore normal text size
          (when (bound-and-true-p visual-fill-column-mode)
            (visual-fill-column-mode -1))))))  ;; Disable visual fill column mode

  ;; Hide modeline for a cleaner look
  (setq writeroom-mode-line nil)

  ;; Add additional global effects for writeroom
  (setq writeroom-global-effects
        '(writeroom-set-fullscreen        ;; Enables fullscreen
          writeroom-set-alpha             ;; Adjusts frame transparency
          writeroom-set-menu-bar-lines
          writeroom-set-tool-bar-lines
          writeroom-set-vertical-scroll-bars
          writeroom-set-bottom-divider-width))

  ;; Set frame transparency
  (setq writeroom-alpha 0.95))

;; zoom in/out like we do everywhere else.
(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
