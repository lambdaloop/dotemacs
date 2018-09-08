(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(auth-source-save-behavior nil)
 '(beacon-color "#f2777a")
 '(compilation-message-face 'default)
 '(custom-safe-themes
   '("bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "7b4d9b8a6ada8e24ac9eecd057093b0572d7008dbd912328231d0cada776065a" default))
 '(electric-indent-mode nil)
 '(fci-rule-color "#515151")
 '(flycheck-color-mode-line-face-to-color 'mode-line-buffer-id)
 '(frame-background-mode 'dark)
 '(global-undo-tree-mode t)
 '(highlight-changes-colors '("#FD5FF0" "#AE81FF"))
 '(highlight-tail-colors
   '(("#3C3D37" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#3C3D37" . 100)))
 '(hl-paren-background-colors '("#e8fce8" "#c1e7f8" "#f8e8e8"))
 '(hl-paren-colors '("#40883f" "#0287c8" "#b85c57"))
 '(magit-diff-use-overlays nil)
 '(org-agenda-custom-commands
   '(("d" "Agenda with only one deadline warning day" agenda ""
      ((org-agenda-start-day "+0")
       (org-agenda-span 1)
       (org-deadline-warning-days 7)))
     ("N" "Agenda and all TODOs"
      ((agenda ""
               ((org-agenda-span 7)))
       (todo "TODO"
             ((org-agenda-skip-function
               '(org-agenda-skip-entry-if 'scheduled)))))
      nil)
     ("p" "List all Projects" todo "PROJECT" nil)
     ("n" "List all next actions" todo "TODO"
      ((org-agenda-skip-function
        '(org-agenda-skip-entry-if 'scheduled))))))
 '(org-agenda-files
   '("~/Dropbox/org/research.org" "~/cs/projects/blog-hugo/blog-org/blog.org" "~/Dropbox/org/notes.org" "~/research/neuroecon/matrix/matrix.org" "~/Dropbox/org/daily.org" "~/research/neuroecon/rtfMRI/rtfMRI.org" "~/Dropbox/org/ideas.org" "~/Dropbox/org/life.org" "~/Dropbox/org/projects.org" "~/Dropbox/org/books.org"))
 '(org-capture-templates
   '(("j" "Journal entry" entry
      (file+datetree+prompt "~/Dropbox/org/daily.org")
      (file "~/Dropbox/org/templates/tpl-journal.org"))
     ("t" "Task" entry
      (file+headline "~/Dropbox/org/life.org" "Capture")
      (file "~/Dropbox/org/templates/tpl-task.org")
      :empty-lines-after 1)
     ("b" "Capture a bookmark" entry
      (file+headline "~/Dropbox/org/notes.org" "Bookmarks")
      (file "~/Dropbox/org/templates/tpl-bookmark.org")
      :empty-lines-after 1)
     ("w" "Weekly review" entry
      (file+datetree+prompt "~/Dropbox/org/daily.org")
      (file "~/Dropbox/org/templates/tpl-review.org"))))
 '(org-outline-path-complete-in-steps nil)
 '(org-refile-targets '((org-agenda-files :maxlevel . 2) (nil :maxlevel . 2)))
 '(org-refile-use-outline-path 'file)
 '(package-selected-packages
   '(ace-window zen-and-art-theme hide-mode-line multishell shell-switcher better-shell base16-theme doom-themes centered-window danneskjold-theme abyss-theme afternoon-theme borland-blue-theme forest-blue-theme hamburg-theme metalheart-theme northcode-theme underwater-theme dumb-jump import-popwin counsel-notmuch nm notmuch notmuch-labeler image+ xterm-color crux buffer-move artbollocks-mode ivy-posframe helm-org-rifle gruvbox-theme darkokai-theme monokai-alt-theme monokai-theme monotropic-theme dracula-theme ivy-rich counsel-dash counsel-pydoc golden-ratio counsel-org-capture-string counsel-tramp ido-clever-match helm-system-packages fancy-battery org org-edna nord-theme ivy-hydra korean-holidays academic-phrases ivy-dired-history ivy-historian ivy-mpdel ivy-pass ivy-todo ivy-yasnippet atom-dark-theme flatland-black-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized badger-theme avy-zap ereader nov exwm-edit darkroom launch company-shell company-jedi google-maps google-this esup calfw-gcal calfw-org diminish calfw image-archive image-dired+ fish-completion bash-completion elfeed elfeed-goodies elfeed-org benchmark-init ido-sort-mtime ido-yes-or-no ido-completing-read+ flatui-dark-theme flatland-theme molokai-theme moe-theme dired-du ido-hacks ido-describe-bindings ido-at-point ido-grid-mode ido-load-library esh-autosuggest dashboard org-dashboard exwm counsel god-mode helm-swoop evil-dvorak ein lua-mode auctex-latexmk anaphora matlab-mode csv-mode git-timemachine org-download org-plus-contrib gitignore-mode haskell-mode ivy-bibtex arduino-mode ag flyspell-correct neotree nyan-mode multi-term flx-ido org-bullets ess expand-region org-edit-latex auctex latex-extra bind-key undo-tree))
 '(paradox-github-token t)
 '(pos-tip-background-color "#A6E22E")
 '(pos-tip-foreground-color "#272822")
 '(show-paren-mode t)
 '(sml/active-background-color "#98ece8")
 '(sml/active-foreground-color "#424242")
 '(sml/inactive-background-color "#4fa8a8")
 '(sml/inactive-foreground-color "#424242")
 '(tramp-syntax 'default nil (tramp))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   '((20 . "#f2777a")
     (40 . "#f99157")
     (60 . "#ffcc66")
     (80 . "#99cc99")
     (100 . "#66cccc")
     (120 . "#6699cc")
     (140 . "#cc99cc")
     (160 . "#f2777a")
     (180 . "#f99157")
     (200 . "#ffcc66")
     (220 . "#99cc99")
     (240 . "#66cccc")
     (260 . "#6699cc")
     (280 . "#cc99cc")
     (300 . "#f2777a")
     (320 . "#f99157")
     (340 . "#ffcc66")
     (360 . "#99cc99")))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (unspecified "#272822" "#3C3D37" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0"))
 '(which-key-mode t)
 '(zoom-ignore-predicates
   '((lambda nil
       (>
        (count-lines
         (point-min)
         (point-max))
        20))))
 '(zoom-ignored-buffer-name-regexps '("^*Calc"))
 '(zoom-ignored-buffer-names '("zoom.el" "init.el"))
 '(zoom-ignored-major-modes '(dired-mode inferior-python-mode))
 '(zoom-size '(0.618 . 0.618)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil))))
 '(beeminder-blue ((t (:foreground "deep sky blue"))))
 '(beeminder-dirty ((t (:foreground "grey70" :slant italic))))
 '(beeminder-error ((t (:foreground "dark orange" :weight bold))))
 '(beeminder-green ((t (:foreground "light green"))))
 '(beeminder-red ((t (:foreground "firebrick1"))))
 '(beeminder-warning ((t (:foreground "yellow1" :weight bold))))
 '(beeminder-yellow ((t (:foreground "LightGoldenrod1"))))
 '(bold ((t (:weight ultra-bold))))
 '(cursor ((t :background "#eebb28")))
 '(dashboard-banner-logo-title-face ((t (:inherit org-document-title))))
 '(dashboard-heading-face ((t (:inherit org-level-1 :weight bold))))
 '(diff-added ((t :foreground "green" :underline nil)))
 '(diff-removed ((t :foreground "red" :underline nil)))
 '(font-lock-builtin-face ((t (:foreground "deep sky blue"))))
 '(font-lock-comment-face ((t (:foreground "#7bba6f"))))
 '(font-lock-constant-face ((t (:foreground "#00aecf"))))
 '(font-lock-warning-face ((t (:foreground "#e6e620"))))
 '(highlight ((t :background "black" :underline nil)))
 '(hl-line ((t :background "gray10")))
 '(magit-item-highlight ((t :background "black")))
 '(org-indent ((t (:inherit (org-hide \(org-hide\ fixed-pitch\))))))
 '(org-level-1 ((t (:foreground "#89E14B" :weight bold))))
 '(org-level-3 ((t (:inherit outline-3 :weight bold))))
 '(org-scheduled-previously ((t (:foreground "#ffb65c"))))
 '(outline-2 ((t (:inherit font-lock-variable-name-face :weight bold))))
 '(outline-4 ((t (:inherit font-lock-comment-face :weight bold))))
 '(outline-5 ((t (:inherit font-lock-type-face :weight bold))))
 '(outline-6 ((t (:inherit font-lock-constant-face :weight bold))))
 '(outline-7 ((t (:inherit font-lock-builtin-face :weight bold))))
 '(outline-8 ((t (:inherit font-lock-string-face :weight bold))))
 '(page-break-lines ((t (:inherit font-lock-comment-face :slant normal :weight normal :height 90))))
 '(show-paren-match ((t (:background "#949FAB" :foreground "white smoke" :weight bold))))
 '(subtle-highlight ((t (:foreground "antique white"))))
 '(switch-window-label ((t (:inherit font-lock-builtin-face :height 6.0))))
 '(term-color-blue ((t (:background "deep sky blue" :foreground "deep sky blue"))))
 '(variable-pitch ((t (:height 80 :width normal :family "Noto Sans")))))
