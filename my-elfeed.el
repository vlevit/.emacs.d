(require 'elfeed)

(require 'my-feeds)                     ; set elfeed-feeds

(defun my-elfeed-sticky (filter)
  (format "%s %s" my-elfeed-sticky-search-filter filter))

(setq my-elfeed-sticky-search-filter "-deleted")
(setq my-elfeed-search-filter (my-elfeed-sticky "@1-month-ago -news"))
(setq elfeed-search-filter my-elfeed-search-filter)

(define-key elfeed-search-mode-map "d"
  '(lambda ()
     (interactive)
     (let ((entries (elfeed-search-selected)))
       (cl-loop for entry in entries do (elfeed-tag entry 'deleted))
       (mapc #'elfeed-search-update-entry entries)
       (unless (use-region-p) (forward-line)))))

(define-key elfeed-search-mode-map "l"
  '(lambda ()
     (interactive)
     (elfeed-search-set-filter my-elfeed-search-filter)))

(define-key elfeed-search-mode-map "U"
  '(lambda ()
     (interactive)
     (unless (search "+unread" elfeed-search-filter)
       (elfeed-search-set-filter
        (format "%s %s" elfeed-search-filter "+unread")))))

(defvar my-elfeed-cycle-filters
      '("@2-months-ago +personal"
        "@1-month-ago +events"
        "@1-month-ago +gnome"
        "@1-month-ago +emacs"
        "@1-month-ago +software +news"
        "@2-months-ago +comics"
        "@2-months-ago +jobs"
        "@2-weeks-ago +news -software"
        ))

(defvar my-elfeed-counter 0)

(defun my-elfeed-search-filter-cycle (step)
  (interactive)
  (let ()
    (setq current-counter (+ my-elfeed-counter (or  step 1)))
    (setq my-elfeed-counter (mod current-counter (length my-elfeed-cycle-filters)))
    (elfeed-search-set-filter (my-elfeed-sticky (nth my-elfeed-counter my-elfeed-cycle-filters)))))

(defun my-elfeed-search-filter-cycle-forward ()
  (interactive)
  (my-elfeed-search-filter-cycle 1))

(defun my-elfeed-search-filter-cycle-backward ()
  (interactive)
  (my-elfeed-search-filter-cycle -1))

(define-key elfeed-search-mode-map "c" 'my-elfeed-search-filter-cycle-forward)
(define-key elfeed-search-mode-map "C" 'my-elfeed-search-filter-cycle-backward)


(add-hook 'elfeed-new-entry-hook
          (elfeed-make-tagger :before "2 weeks ago"
                              :remove 'unread))

(provide 'my-elfeed)
