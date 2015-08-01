(in-package :lack.middleware.validation)

(defun validation-integer (name value &key (require nil) (default-value 0))
  (let ((value (validation-empty name value
                                 :require require
                                 :default-value default-value)))
    (cond ((integerp value) value)
          ((stringp value)
           (let ((parsed-value (read-from-string value)))
             (if (integerp parsed-value)
                 parsed-value
                 (validation-error (format* nil :not-a-valid-integer) name value))))
          (t (validation-error (format* nil :not-a-valid-integer) name value)))))
