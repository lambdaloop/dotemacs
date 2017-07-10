(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(compilation-message-face (quote default))
 '(custom-safe-themes
   (quote
    ("c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "7b4d9b8a6ada8e24ac9eecd057093b0572d7008dbd912328231d0cada776065a" default)))
 '(fci-rule-color "#515151")
 '(flycheck-color-mode-line-face-to-color (quote mode-line-buffer-id))
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
   (quote
    (("#3C3D37" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#3C3D37" . 100))))
 '(hl-paren-background-colors (quote ("#e8fce8" "#c1e7f8" "#f8e8e8")))
 '(hl-paren-colors (quote ("#40883f" "#0287c8" "#b85c57")))
 '(magit-diff-use-overlays nil)
 '(org-agenda-custom-commands
   (quote
    (("d" "Agenda with only one deadline warning day" agenda ""
      ((org-agenda-start-day "+0")
       (org-agenda-span 1)
       (org-deadline-warning-days 7)))
     ("N" "Agenda and all NEXTs"
      ((agenda "" nil)
       (todo "NEXT"
             ((org-agenda-skip-function
               (quote
                (org-agenda-skip-entry-if
                 (quote scheduled)))))))
      nil)
     ("p" "List all Projects" todo "PROJECT" nil)
     ("n" "List all next actions" todo "NEXT|TODO"
      ((org-agenda-overriding-header ""))))))
 '(org-agenda-files
   (quote
    ("~/Dropbox/org/notes.org" "~/research/destress/inquire.org" "~/cs/projects/blog/blog.org" "~/research/neuroecon/matrix/matrix.org" "~/Dropbox/org/daily.org" "~/research/neuroecon/general/neuroecon.org" "~/research/neuroecon/rtfMRI/rtfMRI.org" "~/Dropbox/org/ideas.org" "~/research/gazzaley/meditation/meditation.org" "~/Dropbox/org/life.org" "~/Dropbox/org/projects.org" "~/Dropbox/org/books.org")))
 '(org-capture-templates
   (quote
    (("j" "Journal entry" entry
      (file+datetree+prompt "~/Dropbox/org/daily.org")
      (file "~/Dropbox/org/templates/tpl-journal.txt"))
     ("t" "Task" entry
      (file+headline "~/Dropbox/org/life.org" "Capture")
      (file "~/Dropbox/org/templates/tpl-task.txt")
      :empty-lines-after 1)
     ("b" "Capture a bookmark" entry
      (file+headline "~/Dropbox/org/notes.org" "Bookmarks")
      (file "~/Dropbox/org/templates/tpl-bookmark.txt")
      :empty-lines-after 1)
     ("w" "Weekly review" entry
      (file+datetree+prompt "~/Dropbox/org/daily.org")
      (file "~/Dropbox/org/templates/tpl-review.txt")))))
 '(org-refile-targets (quote ((nil :level . 3) (org-agenda-files :level . 2))))
 '(package-selected-packages
   (quote
    (writeroom-mode ag flyspell-correct neotree nyan-mode smart-mode-line multi-term flx-ido org-bullets zotxt ess expand-region org-edit-latex auctex latex-extra bind-key page-break-lines use-package undo-tree org)))
 '(pos-tip-background-color "#A6E22E")
 '(pos-tip-foreground-color "#272822")
 '(sml/active-background-color "#98ece8")
 '(sml/active-foreground-color "#424242")
 '(sml/inactive-background-color "#4fa8a8")
 '(sml/inactive-foreground-color "#424242")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#f2777a")
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
     (360 . "#99cc99"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (unspecified "#272822" "#3C3D37" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(variable-pitch ((t (:height 100 :width normal :family "Noto Sans")))))
