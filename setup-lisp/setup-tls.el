;; requires python2-certifi and gnutls-cli
;; https://glyph.twistedmatrix.com/2015/11/editor-malware.html

(setq tls-checktrust t)

(let ((trustfile "/usr/lib/python2.7/site-packages/certifi/cacert.pem"))
  (setq tls-program (format "gnutls-cli --x509cafile %s -p %%p %%h" trustfile))
  (setq gnutls-verify-error nil) ; strangely setting this to t disables the check...
  (setq gnutls-trustfiles (list trustfile)))

;; Verify

;; (let ((bad-hosts
;;        (loop for bad
;;              in `("https://wrong.host.badssl.com/"
;;                   "https://self-signed.badssl.com/")
;;              if (condition-case e
;;                     (url-retrieve
;;                      bad (lambda (retrieved) t))
;;                   (error nil))
;;              collect bad)))
;;   (if bad-hosts
;;       (error (format "tls misconfigured; retrieved %s ok"
;;                      bad-hosts))
;;     (url-retrieve "https://badssl.com"
;;                   (lambda (retrieved) t))))

(provide 'setup-tls)
