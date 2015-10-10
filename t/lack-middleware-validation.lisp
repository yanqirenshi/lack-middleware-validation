(in-package :cl-user)
(defpackage lack-middleware-validation-test
  (:use :cl
        :lack.middleware.validation
        :prove))
(in-package :lack-middleware-validation-test)

;; NOTE: To run this test file, execute `(asdf:test-system :lack-middleware-validation)' in your Lisp.

(plan nil)

;;;;;
;;;;; boolean
;;;;;
;;
;; booleanp
;;
(macrolet ((booleanp (value)
             (lack.middleware.validation::booleanp value)))
  (is (booleanp t) t)
  (is (booleanp nil) t)
  (is (booleanp ()) t)
  (is (booleanp "t") nil)
  (is (booleanp 1) nil))

;;
;; string2boolean
;;
(macrolet ((string2boolean (value)
             (lack.middleware.validation::string2boolean value)))
  (is (string2boolean "true") t)
  (is (string2boolean "t") t)
  (is (string2boolean "null") nil)
  (is (string2boolean "nil") nil)
  (is (string2boolean "TRUE") t)
  (is (string2boolean "T") t)
  (is (string2boolean "NULL") nil)
  (is (string2boolean "NIL") nil)
  (is-error (lack.middleware.validation::string2boolean "") 'error)
  (is-error (lack.middleware.validation::string2boolean "1") 'error))

;;
;; value2boolean
;;
;; TODO:

;;
;; validator-boolean
;;
(is (lack.middleware.validation::validator-boolean "test" "true") t)
(is (lack.middleware.validation::validator-boolean "test" "null") nil)
(is (lack.middleware.validation::validator-boolean "test" t) t)
(is (lack.middleware.validation::validator-boolean "test" nil) nil)
(is-error (lack.middleware.validation::validator-boolean "test" "") 'validation-error)

(finalize)
