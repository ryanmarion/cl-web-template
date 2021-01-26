;;;; a general utils/setup script

(in-package #:scratch-template)

;; SPINNERET

;; use 'with-page' to generate your templates when you're going with spinneret
(defmacro with-page ((&key title) &body body)
  `(with-html-string
      (:doctype)
      (:html
        (:head
         (:title ,title))
        (:body ,@body))))

(defun index ()
  (with-page (:title "Test Page")
  (:header
   (:h1 "Test Page"))
  (:div
   (:p "lorem ipsum"))
  (:footer
   (:p "Testing 123"))))

;;; DJULA

;; register the compilation directory for these templates
(djula:add-template-directory (asdf:system-relative-pathname "scratch" "templates/"))

(setf (getf djula:*default-template-arguments* :var) 'some-value)

;; register new templates that we compile
(defparameter +base.html+ (djula:compile-template* "base.html"))
(defparameter +welcome.html+ (djula:compile-template* "welcome.html"))
(defparameter +login.html+ (djula:compile-template* "login.html"))
(defparameter +register.html+ (djula:compile-template* "register.html"))
