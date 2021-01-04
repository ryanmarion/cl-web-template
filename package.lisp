;;;; package.lisp

(defpackage #:scratch-template
  (:use #:cl #:spinneret)
  (:export :index :+welcome.html+ :+login.html+ :+register.html+))

(defpackage #:scratch
  (:use #:cl))

(defpackage #:scratch-server
  (:use #:cl)
  (:export :start :stop))
