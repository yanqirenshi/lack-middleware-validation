(in-package :lack.middleware.validation)

(defun validation-telephone-number (name value &key (require nil) (default-value ""))
  (declare (ignore require default-value))
  (multiple-value-bind (ret)
      (clavier:validate
       (make-instance 'clavier:or-validator
                      :x (clavier:matches-regex "^[0-9].+[-| ][0-9].+[-| ][0-9].+$")
                      :y (clavier:matches-regex "^[0-9].+$"))
       value)
    (unless ret (validation-error (format* nil :not-a-valid-telephone-number value) name value)))
  value)
