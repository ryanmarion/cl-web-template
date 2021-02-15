;;;; scratch.asd
(in-package :asdf)

(asdf:defsystem #:scratch
  :description "Describe scratch here"
  :author "rzm <ryanmarion012@gmail.com>"
  :license  "MIT"
  :version "0.0.1"
  :serial t
  :depends-on ("hunchentoot"
               "easy-routes"
               "spinneret"
               "asdf"
               "djula")
  :components ((:file "package")
               (:file "server")
               (:file "template-util")
               (:file "routes" :depends-on ("package"
                                            "template-util"))
               (:file "scratch")))
