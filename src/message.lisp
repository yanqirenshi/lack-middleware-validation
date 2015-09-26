(in-package :lack.middleware.validation)

(defun refresh-message (message-data)
  (dolist (data message-data)
    (let ((code (getf data :code)))
      (when code
        (dolist (value (getf data :value))
          (print (getf value :language))
          (w2w:add-expression code
                              (getf value :language)
                              (getf value :controller)
                              :description (getf value :description)))))))

(refresh-message *message-data*)

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
