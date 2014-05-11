(require 'elfeed)

(defun my-elfeed-sticky (filter)
  (format "%s %s" my-elfeed-sticky-search-filter filter))

(setq my-elfeed-sticky-search-filter "-deleted")
(setq my-elfeed-search-filter (my-elfeed-sticky "@1-month-ago -news"))
(setq elfeed-search-filter my-elfeed-search-filter)

(setq elfeed-feeds
      '(

        ;; vlevit.org
        ("http://vlevit.org/ru/blog.rss" vlevitorg ru blog)
        ("http://vlevit.org/en/blog.rss" vlevitorg en blog)
        ("http://www.vlevit.org/ru/blog/comments.rss" vlevitorg ru comments)
        ("http://www.vlevit.org/en/blog/comments.rss" vlevitorg en comments)

        ;; Events
        ("http://vkontakte-feed.appspot.com/feed/edutainment_odessa/wall" bla-bla-club events)
        ;; ("http://vkontakte-feed.appspot.com/feed/planeta_igr_com/wall" planetaigr events)

        ;; Software

        ("https://www.archlinux.org/feeds/news/" arch news)

        ;; planets
        ("http://planet.emacsen.org/atom.xml" emacs planet)

        ;; gnome
        ("http://afaikblog.wordpress.com/feed/" gnome)
        ("http://blogs.gnome.org/mclasen/feed/" gnome)
        ("http://blogs.gnome.org/danni/feed/" gnome python)

        ;; DOU
        ("http://feeds.feedburner.com/DevelopersOrgUa" dou software news)
        ("http://dou.ua/calendar/feed/Python/" dou  events python)
        ("http://dou.ua/calendar/feed/JavaScript/" dou events javascript)
        ("http://dou.ua/calendar/feed/Linux/" dou events linux)
        ("http://dou.ua/calendar/feed/все%20темы/Одесса" dou events odessa)
        ("http://jobs.dou.ua/vacancies/feeds/?cities=Одесса&search=Python" dou python odessa jobs)
        ("http://jobs.dou.ua/vacancies/feeds/?search=Python&remote" dou python remote jobs)

        ;; news
        ("http://www.opennet.ru/opennews/opennews_all.rss" opennet software news)
        ;; comics
        ("http://xkcd.com/atom.xml" xkcd comics)
        ("http://what-if.xkcd.com/feed.atom" what-if comics)

        ;; music
        ("http://www.rssitfor.me/getrss?name=tobydriver" music twitter tobydriver)

        ;; news
        ("http://podrobnosti.ua/rss/hot.rss/" podrobnosti news)
        ;; ("http://rss.unian.net/site/news_rus.rss" unian news)
        ;; ("http://podrobnosti.ua/rss/" podrobnosti news)
        ;; ("http://www.unn.com.ua/rss/news_ru.xml" unn news)
        ;; ("http://russian.rt.com/rss/" rt news)
        ;; ;; ("http://www.048.ua/rss" 048 odessa news) ;; doesn't work with elfeed
        ;; ("http://dumskaya.net/rssnews" dumskaya news odessa)
        ))

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
      '("@2-months-ago +vlevitorg"
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
