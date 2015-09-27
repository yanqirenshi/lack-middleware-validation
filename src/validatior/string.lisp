(in-package :lack.middleware.validation)

(defun validation-string (name value &key (require nil) (default-value ""))
  (let ((value (validation-empty name value :require require :default-value default-value)))
    (if (stringp value)
        value
        (validation-error (format* nil :not-a-valid-string) name value))))

