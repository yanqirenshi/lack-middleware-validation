(in-package :lack.middleware.validation)

(defun validator-string (name value &key (require nil) (default-value ""))
  (let ((value (validator-empty name value :require require :default-value default-value)))
    (if (emptyp value)
        value
        (if (stringp value)
            value
            (validation-error (format* nil :not-a-valid-string) name value)))))

