(in-package :lack.middleware.validation)

(defun validator-date (name value &key (require nil) (default-value nil))
  (let ((value (validator-empty name value :require require :default-value default-value)))
    (if (emptyp value)
        nil
        (handler-case
            (typecase value
              (string (local-time:parse-timestring value))
              (integer (local-time:universal-to-timestamp value))
              (t (error "not supported value type")))
          (error () (validation-error (format* nil :not-a-valid-date) name value))))))
