(in-package :lack.middleware.validation)

(defun string2double (string)
  (let ((value (read-from-string string)))
    (if (numberp value)
        (coerce value 'double-float)
        (error "fuck'n type error"))))

(defun value2double (value)
  (cond ((stringp value)
         (string2double value))
        ((numberp value)
         (coerce value 'double-float))
        (t (error "fuck'n type error"))))

(defun validator-double (name value &key (require nil) (default-value 0.0d0))
  (handler-case
      (validator-require name
                         (value2double value)
                         :require require
                         :default-value default-value)
    (error ()
      (validation-error* :not-a-valid-double name value))))
