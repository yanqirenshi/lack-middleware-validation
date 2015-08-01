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
                 (:file "message" :depends-on ("package"))
                 (:file "condition" :depends-on ("message"))
                 (:module "validatior-item"
                  :components ((:file "boolean")
                               (:file "double")
                               (:file "email")
                               (:file "float")
                               (:file "integer")
                               (:file "postal-code")
                               (:file "string")
                               (:file "telephone-number")
                               (:file "url"))
                  :depends-on ("condition"))
                 (:file "lack-middleware-validation" :depends-on ("validatior-item")))))
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
