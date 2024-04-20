;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; To install a package with Doom you must declare them here, run 'doom sync' on
;; the command line, then restart Emacs for the changes to take effect.
;; Alternatively, use M-x doom/reload.


;; Doom's packages are pinned to a specific commit and updated from release to
;; release. The `unpin!' macro allows you to unpin single packages...
;(unpin! pinned-package)
;; ...or multiple packages
;(unpin! pinned-package another-pinned-package)
;; ...Or *all* packages (NOT RECOMMENDED; will likely break things)
;(unpin! t)


;; To install SOME-PACKAGE from MELPA, ELPA or emacsmirror:
;(package! some-package)

;; To install a package directly from a particular repo, you'll need to specify
;; a `:recipe'. You'll find documentation on what `:recipe' accepts here:
;; https://github.com/raxod502/straight.el#the-recipe-format
;(package! another-package
;  :recipe (:host github :repo "username/repo"))

;; If the package you are trying to install does not contain a PACKAGENAME.el
;; file, or is located in a subdirectory of the repo, you'll need to specify
;; `:files' in the `:recipe':
;(package! this-package
;  :recipe (:host github :repo "username/repo"
;           :files ("some-file.el" "src/lisp/*.el")))

;; If you'd like to disable a package included with Doom, for whatever reason,
;; you can do so here with the `:disable' property:
;(package! builtin-package :disable t)

;; You can override the recipe of a built in package without having to specify
;; all the properties for `:recipe'. These will inherit the rest of its recipe
;; from Doom or MELPA/ELPA/Emacsmirror:
;(package! builtin-package :recipe (:nonrecursive t))
;(package! builtin-package-2 :recipe (:repo "myfork/package"))

;; Specify a `:branch' to install a package from a particular branch or tag.
;; This is required for some packages whose default branch isn't 'master' (which
;; our package manager can't deal with; see raxod502/straight.el#279)
;(package! builtin-package :recipe (:branch "develop"))

;; (package! org-roam
;;   :recipe (:host github :repo "jethrokuan/org-roam" :branch "develop"))

;; (package! org-roam
;;   :recipe (:host github :repo "org-roam/org-roam" :branch "master"))

;; (unpin! org-roam)
;; (package! org-roam-ui)

(package! org-roam
  :recipe (:host github :repo "org-roam/org-roam"
           :files (:defaults "extensions/*")))

(package! org-roam-ui
  :recipe (:host github :repo "org-roam/org-roam-ui"))

(package! org-roam-bibtex
  :recipe (:host github :repo "org-roam/org-roam-bibtex"))

(unpin! bibtex-completion helm-bibtex ivy-bibtex)

(package! ivy-prescient)
;; (package! company-prescient)

(package! ivy-bibtex)
(package! org-ref)


(package! vterm :pin "f41849c")
(package! vterm-toggle)

(package! matlab-mode)

(package! gdscript-mode)

(package! graphviz-dot-mode)

(package! emojify)

(package! pipenv :disable t)

(package! nyan-mode)

(package! ob-async)

(package! picpocket)

;; (package! ob-ipython
;;   :recipe (:host github :repo "moritzschaefer/ob-ipython"))

(package! quarto-mode)

(package! jupyter
  :recipe (:host github :repo "emacs-jupyter/jupyter"
           :branch "next"))

(package! ox-ipynb
  :recipe (:host github :repo "jkitchin/ox-ipynb"))

(package! olivetti)

(package! sdcv-mode
  :recipe (:host github :repo "gucong/emacs-sdcv"))

(package! org-ql)

(package! crux)

;; (package! avk-emacs-themes)
;; (package! dracula-theme)
;; (package! material-theme)
(package! moe-theme)
(package! gruvbox-theme)
(package! poet-theme)
(package! color-theme-sanityinc-tomorrow)

(package! switch-window)

(package! org-roam-server)
(package! org-super-agenda)

;; (package! beeminder
;;   :recipe (:host github :repo "mbork/beeminder.el"))


(package! toc-mode
  :recipe (:host github :repo "dalanicolai/toc-mode"))

(package! calibredb)

(package! auto-yasnippet)

(package! gitconfig-mode
	  :recipe (:host github :repo "magit/git-modes"
			 :files ("gitconfig-mode.el")))
(package! gitignore-mode
	  :recipe (:host github :repo "magit/git-modes"
			 :files ("gitignore-mode.el")))

(package! ef-themes
  :recipe (:host nil :repo "https://git.sr.ht/~protesilaos/ef-themes"))

(package! chat
  :recipe (:host github :repo "iwahbe/chat.el"))

(package! spacious-padding
  :recipe (:host nil :repo "https://git.sr.ht/~protesilaos/spacious-padding"))

;; (package! gptel
;;   :recipe (:host github :repo "karthink/gptel"))

;; (package! llm :recipe (:host github :repo "ahyatt/llm"))

(package! claude-shell :recipe (:host github :repo "arminfriedl/claude-shell"))

(package! yuck-mode)

(package! org
  :recipe (:host github :repo "emacs-straight/org-mode")
  )

(unpin! org)



(package! dockerfile-mode)
