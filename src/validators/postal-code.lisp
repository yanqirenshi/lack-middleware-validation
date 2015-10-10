(in-package :lack.middleware.validation)

(defun validator-postal-code (name value &key (require nil) (default-value ""))
  (declare (ignore require default-value))
  (multiple-value-bind (ret)
      (clavier:validate
       (make-instance 'clavier:or-validator
                      :x (clavier:matches-regex "^[0-9]{3}[-| ][0-9]{4}$")
                      :y (clavier:matches-regex "^[0-9]{7}$"))
       value)
    (unless ret (validation-error (format* nil :not-a-valid-postal-code) name value)))
  value)
