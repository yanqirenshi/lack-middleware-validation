(in-package :lack.middleware.validation)

(defun string2number (string type)
  (let ((value (read-from-string string)))
    (if (numberp value)
        (coerce value type)
        (error "fuck'n type error"))))

(defun value2number (value type)
  (cond ((stringp value)
         (string2number value type))
        ((numberp value)
         (coerce value type))
        (t (error "fuck'n type error"))))

(defun error-code-at (type)
  (case type
    (integer :not-a-valid-integer)
    (float :not-a-valid-float)
    (double-float :not-a-valid-double)
    (otherwise (error "fuck'n type error"))))

(defun validator-number (name value &key (require nil) (default-value 0) (type 'integer))
  (handler-case
      (validator-require name
                         (value2number value type)
                         :require require
                         :default-value default-value)
    (error ()
      (validation-error* (error-code-at type) name value))))

(defun validator-integer (name value &key (require nil) (default-value 0))
  (validator-number name value
                    :require require
                    :default-value default-value
                    :type 'integer))

(defun validator-float (name value &key (require nil) (default-value 0.0))
  (validator-number name value
                    :require require
                    :default-value default-value
                    :type 'float))

(defun validator-double (name value &key (require nil) (default-value 0.0d0))
  (validator-number name value
                    :require require
                    :default-value default-value
                    :type 'double-float))
