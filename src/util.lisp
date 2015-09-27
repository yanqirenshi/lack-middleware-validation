(in-package :lack.middleware.validation)

(defun emptyp (value)
  (or (null value)
      (and (stringp value)
           (string= (string-trim '(#\Space #\Tab #\Newline) value)
                    ""))))

(defun validation-empty (name value &key (require nil) (default-value ""))
  (if (emptyp value)
      (if require
          (validation-error (format* nil :required-field name) name value)
          default-value)
      value))

(defun reply-json (status object)
  (let ((json (to-json object)))
    `(,status (:content-type "application/json") ,json)))


