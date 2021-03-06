(require 'cl)

(defmacro exwm-input-set-keys (keys)
  "Set a list of global keybindings for exwm"
  (cons 'progn
        (mapcar
         (lambda (var)
           (let ((key (car var))
                 (fun (cdr var)))
             `(exwm-input-set-key (kbd ,key) ,fun)))
         keys)))

(defun pick-mpd-song ()
  (let ((songs (shell-command-to-string "mpc -f '%position% - [%title%|%name%|%file%|%track%] - %artist%[ - %album%] %time%' playlist"))
        (ivy-sort-max-size 0))
    (split-string (completing-read "Pick a song: " (split-string songs "\n"))
                  " - ")
    ))

(defun play-mpd-song ()
  (interactive)
  (let* ((song (pick-mpd-song))
         (picked-id (car song)))
    (run-shell-command (format "mpc play %s" picked-id))
    (message "") ; clear the shell message
    ))


(defun pick-run-command ()
  (interactive)
  (run-shell-command
   (completing-read "Pick command: "
                    (split-string (shell-command-to-string "bash -c 'compgen -c'") "\n")))
  )

(defun run-shell-command (proc)
  (start-process-shell-command proc nil proc) )

(defun spawn (process)
  (lexical-let ((proc process))
    (lambda () (interactive)
      (run-shell-command proc) )
    ))


(defun spawn-other-window (process)
  (lexical-let ((proc process))
    (lambda () (interactive)
      (split-window-horizontally)
      (other-window 1)
      (run-shell-command process)
      (other-window -1)
      )
    ))

(defun update-workspace-bar (&rest args)
  (run-shell-command
   "/usr/bin/python3 ~/scripts/get_workspaces.py > /tmp/xmobar.ws")
  )

(add-hook 'exwm-workspace-switch-hook 'update-workspace-bar)
(add-hook 'exwm-workspace-list-change-hook 'update-workspace-bar)
(add-hook 'exwm-init-hook 'update-workspace-bar)
(advice-add 'switch-to-buffer :after 'update-workspace-bar)

;; setup workspace switch keys
(setq exwm-input-global-keys
      `(
        ;; Bind "s-0" to "s-9" to switch to a workspace by its index.
        ,@(mapcar (lambda (i)
                    `(,(kbd (format "s-%d" i)) .
                      (lambda ()
                        (interactive)
                        (exwm-workspace-switch-create ,(- i 1)))))
                  (number-sequence 1 9))
        ,@(mapcar (lambda (i)
                    `(,(kbd (format "<s-kp-%d>" i)) .
                      (lambda ()
                        (interactive)
                        (exwm-workspace-switch-create ,(- i 1)))))
                  (number-sequence 1 9))
        ,@(mapcar (lambda (i)
                       `(,(kbd (format "C-s-%d" i)) .
                         (lambda ()
                           (interactive)
                           (exwm-workspace-move exwm-workspace--current ,(- i 1))
                           (update-workspace-bar))))
                     (number-sequence 1 9))
        ,@(cl-mapcar (lambda (key i)
                       `(,(kbd (format "s-%s" key)) .
                         (lambda ()
                           (interactive)
                           (exwm-workspace-move-window ,i)
                           (update-workspace-bar))))
                     '("!" "@" "#" "$" "%" "^" "&" "*" "(")
                     (number-sequence 0 8))
        ;; Bind "s-&" to launch applications ('M-&' also works if the output
        ;; buffer does not bother you).
        ;; ([?\s-&] . (lambda (command)
        ;;              (interactive (list (read-shell-command "$ ")))
        ;;              (start-process-shell-command command nil command)))

        ))

(bind-keys :map exwm-mode-map
           ("C-q" . exwm-input-send-next-key))


(defun restart-xmobar ()
 (interactive)
 (run-shell-command "killall xmobar; nohup bash ~/scripts/run_xmobar.sh > /dev/null")
 (sit-for 0.2)
 (update-workspace-bar))

(defun reset-exwm-xmobar ()
  (interactive)
  (restart-xmobar)
  (exwm-reset)
  )

(defun spawn-ss (process)
  "Spawn a process to handle screens & update xmobar following"
  (lexical-let ((proc process))
    (lambda () (interactive)
      (run-shell-command proc)
      (run-at-time
       2 nil
       (lambda ()
         (reset-exwm-xmobar)
         (update-workspace-bar)
         )))
    ))


(defhydra hydra-launcher (:color blue)
  "launch"
  ("r" (run-shell-command "anki") "anki")
  ("f" (run-shell-command "firefox") "firefox")
  ("m" (run-shell-command "cantata") "mpd viewer")
  ("s" (run-shell-command "spotify --force-device-scale-factor=2") "spotify")
  ("z" (run-shell-command "zotero") "zotero")
  )

(exwm-input-set-keys
 (
  ;; basic stuff
  ("s-p" . 'counsel-linux-app)
  ("s-<backspace>" . 'reset-exwm-xmobar)
  ("C-s-Q" . 'save-buffers-kill-terminal)
  ("s-g" . 'keyboard-quit)
  
  ;; manage windows
  ("s-q" . (lambda () (interactive) (really-kill-this-buffer) (delete-window)))
  ("s-Q" . 'really-kill-this-buffer)
  ("s-k" . 'really-kill-this-buffer)
  ("s-SPC" . 'ivy-switch-buffer)
  ("s-o" . 'ace-window)
  ("s-O" . (lambda () (interactive) (ace-window 4)))
  ("s-n" . 'exwm-floating-toggle-floating)
  ("s-<return>" . 'delete-other-windows)
  ("s-," . (lambda () (interactive) (split-window-right) (other-window 1)))
  ("s-." . (lambda () (interactive) (split-window-below) (other-window 1)))
  ("s-w" . 'delete-window)
  ("s-0" . 'delete-window)
  ("s-<down-mouse-1>" . 'exwm-input-move-event)
  ("s-S-<down-mouse-1>" . 'exwm-input-resize-event)
  ;; ("s-<left>" . 'windmove-left)
  ;; ("s-<down>" . 'windmove-down)
  ;; ("s-<right>" . 'windmove-right)
  ;; ("s-<up>" . 'windmove-up)
  ("s-<left>" . 'switch-window-mvborder-left)
  ("s-<right>" . 'switch-window-mvborder-right)
  ("s-<up>" . 'switch-window-mvborder-up)
  ("s-<down>" . 'switch-window-mvborder-down)
  
  ;; launch stuff
  ("s-u" . 'hydra-launcher/body)
  ;; ("s-r" . (spawn "anki"))
  ;; ("s-i" . (spawn "firefox"))
  ;; ("s-l" . (spawn "cantata"))
  ;; ("s-L" . (spawn "spotify --force-device-scale-factor=2"))
  ;; ("s-z" . (spawn "zotero"))

  ;; the terminal
  ("s-C-<return>" . (spawn "xfce4-terminal"))
  ("s-m" . 'eshell-cwd)
  ("s-M" . 'shell-switcher-new-shell)
  ("M-S-s-<return>" . 'shell-switcher-switch-buffer)
  ("s-_" . (lambda () (interactive) (split-window-horizontally) (other-window 1) (shell-switcher-switch-buffer)))
  ;; ("s-M" . (lambda () (interactive) (multi-term)))
  ;; ("S-s-<return>" . 'multi-term-next)
  ;; ("s-_" . (lambda () (interactive) (split-window-horizontally) (other-window 1) (multi-term-next)))

  ;; convenient things
  ;; ("s-R" . (spawn "bash ~/scripts/pick_password.sh"))
  ("s-R" . 'password-store-copy)
  ("s-v" . (spawn "maim  -u /tmp/maim-$(date +%Y-%m-%d--%H-%M-%S).png"))
  ("s-V" . (spawn "maim  -u -s  /tmp/maim-$(date +%Y-%m-%d--%H-%M-%S).png"))
  ("C-s-l" . (spawn "slimlock"))

  ;; emacs functions
  ("s-e" . 'hydra-common-files/body)
  ("s-'" . 'counsel-org-capture)
  ("<XF86LaunchB>" . 'counsel-org-capture)
  ("s-c a" . 'org-agenda)
  ("s-b" . 'beeminder-list-goals)
  ("s-f" . 'counsel-find-file)
  ("s-F" . (lambda () (interactive) (split-window-right) (other-window 1) (counsel-find-file)))
  ("<XF86KbdBrightnessDown>" . (lambda () (interactive) (switch-to-buffer "*dashboard*")))
  ("<XF86LaunchA>" . (lambda (&optional arg) (interactive "P") (org-agenda arg "a")))
  ("<f3>" . (lambda (&optional arg) (interactive "P") (org-agenda arg "a")))

  ;; useful laptop functions
  ("<XF86MonBrightnessDown>" . (spawn "xbacklight -inc -2"))
  ("<XF86MonBrightnessUp>" . (spawn "xbacklight -inc +2"))
  ("<s-XF86MonBrightnessDown>" . (spawn "xbacklight -inc -0.2"))
  ("<s-XF86MonBrightnessUp>" . (spawn "xbacklight -inc +0.2"))

  ;; all the music stuff
  ;; ("s-P" . (spawn "bash ~/scripts/pick_music.sh"))
  ("s-P" . 'play-mpd-song)
  ;; ("s-c" . (spawn "bash ~/scripts/pick_google_music.sh"))
  ;; ("s-C" . (spawn "bash ~/scripts/pick_google_music_title.sh"))

  ("<XF86AudioLowerVolume>" . (spawn "amixer -c 1 set Master 1%-; bash ~/scripts/vol_xmobar.sh"))
  ("<XF86AudioRaiseVolume>" . (spawn "amixer -c 1 set Master 1%+; bash ~/scripts/vol_xmobar.sh"))
  ("<XF86AudioMute>" . (spawn "pactl set-sink-mute 1 toggle || amixer set Master toggle; bash ~/scripts/vol_xmobar.sh"))

  ("<XF86AudioPrev>" . (spawn "python ~/scripts/media.py prev &"))
  ("<XF86AudioNext>" . (spawn "python ~/scripts/media.py next &"))
  ("<XF86AudioPlay>" . (spawn "python ~/scripts/media.py toggle &"))

  ("s-<XF86AudioPlay>" . (spawn "python ~/scripts/media.py get-details > /tmp/xmonad.music"))
  ("s-<XF86AudioNext>" . (spawn "mpc random"))
  ("s-<XF86AudioPrev>" . (spawn "mpc repeat"))

  ("<f7>" . (spawn "python ~/scripts/media.py seek-prev && python ~/scripts/media.py get-time > /tmp/xmonad.music"))
  ("<f8>" . (spawn "python ~/scripts/media.py get-time > /tmp/xmonad.music"))
  ("<f9>" . (spawn "python ~/scripts/media.py seek-next && python ~/scripts/media.py get-time > /tmp/xmonad.music"))

  ("<S-f7>" . (spawn "python ~/scripts/media.py prev"))
  ("<S-f9>" . (spawn "python ~/scripts/media.py next"))
  ("<S-f8>" . (spawn "python ~/scripts/media.py toggle"))

  ("<f10>" . (spawn "pactl set-sink-mute 1 toggle || amixer set Master toggle; bash ~/scripts/vol_xmobar.sh"))
  ("<f11>" . (spawn "amixer -c 1 set Master 1%-; bash ~/scripts/vol_xmobar.sh"))
  ("<f12>" . (spawn "amixer -c 1 set Master 1%+; bash ~/scripts/vol_xmobar.sh"))

  ;; screen management
  ("s-\\" . (spawn-ss "xrandr --output DP1 --scale 1.8x1.8 --panning 4608x2592+0+0 --primary --auto --output eDP1 --off"))
  ("s-/" . (spawn-ss "xrandr --output DP1 --off --auto --output eDP1 --primary --auto"))

  ("C-s-\\" . (spawn-ss "xrandr --output HDMI2 --scale 2x2 --panning 3840x2160+0+0 --primary --auto --output eDP1 --off"))
  ("C-s-/" . (spawn-ss "xrandr --output HDMI2 --off --auto --output eDP1 --primary --auto"))

  ))


(setq exwm-input-simulation-keys
      '(
        ([?\C-t] . [up])
        ([?\C-n] . [down])
        ;; ([?\C-x h] . ?\C-a)
        ;; ([?\C-a] . [home])
        ([?\C-e] . [end])
        ;; ([?\C-c ?\C-c] . ?\C-c)
        ;; ([?\C-k] . [S-end delete])
))

(defun exwm-send-c-c ()
  (interactive)
  (exwm-input--fake-key ?\C-c))

(defun exwm-send-c-x ()
  (interactive)
  (exwm-input--fake-key ?\C-x))

(bind-key "C-c C-c" 'exwm-send-c-c exwm-mode-map)
(bind-key "s-c s-c" 'exwm-send-c-c exwm-mode-map)
(bind-key "C-x C-x" 'exwm-send-c-x exwm-mode-map)

;; remove C-t binding for firefox
(add-hook 'exwm-manage-finish-hook
          (lambda ()
            (when (and exwm-class-name
                       (string= exwm-class-name "Firefox"))
              (exwm-input-set-local-simulation-keys
               (cons '([?\C-t] . ?\C-t)
                     (remove '([?\C-t] . [up]) exwm-input-simulation-keys))
               ))))


(provide 'my-exwm-keys)

