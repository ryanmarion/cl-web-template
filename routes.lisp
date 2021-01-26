;;;; defroutes
(in-package #:scratch)

;; basic routing
(easy-routes:defroute foo ("/foo" :method :get) ()
    (format nil "hello foo"))

;; hey we can make another - there's an easier way to do this, but it's NBD
(easy-routes:defroute bar ("/bar" :method :get) ()
    (format nil "hello bar"))

(defmacro with-page ((&key title) &body body)
  `(spinneret:with-html-string
      (:doctype)
      (:html
        (:head
         (:title ,title))
        (:body ,@body))))

;; this uses the spinneret templating engine
(easy-routes:defroute home ("/" :method :get) ()
  (scratch-template:index))

;; this uses the djula (django-esque) templating engine
(easy-routes:defroute bing ("/bing" :method :get) ()
  (djula:render-template* scratch-template:+welcome.html+ nil))

;; this uses the djula (django-esque) templating engine
(easy-routes:defroute login ("/login" :method :get) ()
  (djula:render-template* scratch-template:+login.html+ nil))

(easy-routes:defroute register ("/register" :method :get) ()
  (djula:render-template* scratch-template:+register.html+ nil))
