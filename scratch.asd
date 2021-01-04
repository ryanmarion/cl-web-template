;;;; scratch.asd
(in-package :asdf)

(asdf:defsystem #:scratch
  :description "Describe scratch here"
  :author "Your Name <your.name@example.com>"
  :license  "Specify license here"
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
