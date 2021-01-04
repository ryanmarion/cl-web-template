;;;; server definition

(in-package #:scratch-server)

;; what we're going to do here is get a hunchentoot server running.
;; let's just get it running locally for now.
;; ideally, we'd like to make this a bit more configurable down the line.

(defvar *server*)

;; :document-root should be configurable via env
(setf *server* (make-instance 'easy-routes:easy-routes-acceptor
                              :port 4242
                              :document-root #p"~/Documents/dev/cl/scratch/static/"))

;; helper functions
(defun start ()
  (if (not (hunchentoot:started-p *server*))
      (hunchentoot:start *server*)))

(defun stop ()
   (if (hunchentoot:started-p *server*)
       (hunchentoot:stop *server*)))
