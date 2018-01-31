(in-package :cl-user)
(defpackage lack.middleware.validation
  (:use :cl)
  (:import-from #:jonathan
                #:to-json)
  (:import-from #:w2w
                #:error*
                #:format*)
  (:export #:*lack-middleware-validation*
           #:*message-data*
           #:validator
           #:validator-boolean
           #:validator-email
           #:validator-empty
           #:validator-number
           #:validator-integer
           #:validator-float
           #:validator-double
           #:validator-postal-code
           #:validator-require
           #:validator-string
           #:validator-telephone-number
           #:validator-url
           #:validation
           #:valid?
           #:validation-error
           #:validation-error-name
           #:validation-error-value
           #:validation-error-message))
(in-package :lack.middleware.validation)
