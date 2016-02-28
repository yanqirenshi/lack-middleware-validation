#|
This file is a part of lack-middleware-validation project.
Copyright (c) 2015 Satoshi Iwasaki (yanqirenshi@gmail.com)
|#

#|
Author: Satoshi Iwasaki (yanqirenshi@gmail.com)
|#

(in-package :cl-user)
(defpackage lack-middleware-validation-asd
  (:use :cl :asdf))
(in-package :lack-middleware-validation-asd)

(defsystem lack-middleware-validation
  :version "0.1"
  :author "Satoshi Iwasaki"
  :license "MIT"
  :depends-on (:clavier
               :jonathan
               :world2world)
  :components ((:module "src"
                :components
                ((:file "package")
                 (:file "util" :depends-on ("package"))
                 (:file "condition" :depends-on ("util"))
                 (:module "validators"
                  :components ((:file "require")
                               (:file "empty" :depends-on ("require"))
                               (:file "boolean" :depends-on ("empty"))
                               (:file "number" :depends-on ("empty"))
                               (:file "email" :depends-on ("empty"))
                               (:file "postal-code" :depends-on ("empty"))
                               (:file "string" :depends-on ("empty"))
                               (:file "date" :depends-on ("empty"))
                               (:file "telephone-number" :depends-on ("empty"))
                               (:file "url" :depends-on ("empty")))
                  :depends-on ("condition"))
                 (:module "data"
                  :components ((:file "messages"))
                  :depends-on ("validators"))
                 (:file "lack-middleware-validation" :depends-on ("data")))))
  :description ""
  :long-description
  #.(with-open-file (stream (merge-pathnames
                             #p"README.markdown"
                             (or *load-pathname* *compile-file-pathname*))
                            :if-does-not-exist nil
                            :direction :input)
      (when stream
        (let ((seq (make-array (file-length stream)
                               :element-type 'character
                               :fill-pointer t)))
          (setf (fill-pointer seq) (read-sequence seq stream))
          seq)))
  :in-order-to ((test-op (test-op lack-middleware-validation-test))))
