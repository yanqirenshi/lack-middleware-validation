#|
  This file is a part of lack-middleware-validation project.
  Copyright (c) 2015 Satoshi Iwasaki (yanqirenshi@gmail.com)
|#

(in-package :cl-user)
(defpackage lack-middleware-validation-test-asd
  (:use :cl :asdf))
(in-package :lack-middleware-validation-test-asd)

(defsystem lack-middleware-validation-test
  :author "Satoshi Iwasaki"
  :license "MIT"
  :depends-on (:lack-middleware-validation
               :prove)
  :components ((:module "t"
                :components
                ((:test-file "lack-middleware-validation"))))
  :description "Test system for lack-middleware-validation"

  :defsystem-depends-on (:prove-asdf)
  :perform (test-op :after (op c)
                    (funcall (intern #.(string :run-test-system) :prove-asdf) c)
                    (asdf:clear-system c)))
