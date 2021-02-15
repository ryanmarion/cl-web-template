(in-package #:scratch-template)

;;; Djula is the templating engine I picked for this project. It's a lot like Django's templating engine

;; register the compilation directory for these templates
(djula:add-template-directory (asdf:system-relative-pathname "scratch" "templates/"))

(setf (getf djula:*default-template-arguments* :var) 'some-value)

;; register new templates that we compile
(defparameter +index.html+ (djula:compile-template* "index.html"))
(defparameter +base.html+ (djula:compile-template* "base.html"))
(defparameter +welcome.html+ (djula:compile-template* "welcome.html"))
(defparameter +login.html+ (djula:compile-template* "login.html"))
(defparameter +register.html+ (djula:compile-template* "register.html"))
