(in-package :lack.middleware.validation)

(defun string2float (string)
  (let ((value (read-from-string string)))
    (if (numberp value)
        (coerce value 'float)
        (error "fuck'n type error"))))

(defun value2float (value)
  (cond ((stringp value)
         (string2float value))
        ((numberp value)
         (coerce value 'float))
        (t (error "fuck'n type error"))))

(defun validator-float (name value &key (require nil) (default-value 0.0))
  (handler-case
      (validator-require name
                         (value2float value)
                         :require require
                         :default-value default-value)
    (error ()
      (validation-error* :not-a-valid-float name value))))


