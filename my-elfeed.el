(require 'elfeed)

(setq elfeed-feeds
      '(

        ;; vlevit.org
        ("http://vlevit.org/ru/blog.rss" vlevitorg ru blog)
        ("http://vlevit.org/en/blog.rss" vlevitorg en blog)
        ("http://www.vlevit.org/ru/blog/comments.rss" vlevitorg ru comments)
        ("http://www.vlevit.org/en/blog/comments.rss" vlevitorg en comments)

        ;; Events
        ("http://vkontakte-feed.appspot.com/feed/edutainment_odessa/wall" bla-bla-club events)
        ("http://vkontakte-feed.appspot.com/feed/planeta_igr_com/wall" planetaigr events)

        ;; Software

        ;; planets
        ("http://planet.emacsen.org/atom.xml" emacs planet)

        ;; gnome
        ("http://afaikblog.wordpress.com/feed/" gnome)
        ("http://blogs.gnome.org/mclasen/feed/" gnome)
        ("http://blogs.gnome.org/danni/feed/" gnome python)

        ;; news
        ("http://www.opennet.ru/opennews/opennews_all.rss" opennet software news)

        ;; comics
        ("http://xkcd.com/atom.xml" xkcd comics)
        ("http://what-if.xkcd.com/feed.atom" what-if comics)

        ;; news
        ("http://rss.unian.net/site/news_rus.rss" unian news)
        ("http://podrobnosti.ua/rss/" podrobnosti news)
        ("http://www.unn.com.ua/rss/news_ru.xml" unn news)
        ("http://russian.rt.com/rss/" rt news)
        ;; ("http://www.048.ua/rss" 048 odessa news) doesn't work with elfeed
        ("http://dumskaya.net/rssnews" dumskaya news odessa)
        ))

(define-key elfeed-search-mode-map "l"
  '(lambda ()
     (interactive)
     (elfeed-search-set-filter "@1-month-ago -news")))


(defvar my-elfeed-cycle-filters
      '("@2-months-ago +vlevitorg"
        "@1-month-ago +events"
        "@1-month-ago +gnome"
        "@1-month-ago +emacs"
        "@1-month-ago +software +news"
        "@2-months-ago +comics"
        "@2-weeks-ago +news -software"
        ))

(defvar my-elfeed-counter 0)

(defun my-elfeed-search-filter-cycle (step)
  (interactive)
  (let ()
    (setq current-counter (+ my-elfeed-counter (or  step 1)))
    (setq my-elfeed-counter (mod current-counter (length my-elfeed-cycle-filters)))
    (elfeed-search-set-filter (nth my-elfeed-counter my-elfeed-cycle-filters))))

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
