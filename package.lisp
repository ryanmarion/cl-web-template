;;;; package.lisp

(defpackage #:scratch-template
  (:use #:cl #:spinneret)
  (:export :+index.html+ :+welcome.html+ :+login.html+ :+register.html+))

(defpackage #:scratch-core
  (:use #:cl))

(defpackage #:scratch-server
  (:use #:cl)
  (:export :start :stop))
