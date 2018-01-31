(in-package :lack.middleware.validation)

(defun emptyp (value)
  (or (null value)
      (and (stringp value)
           (string= (string-trim '(#\Space #\Tab #\Newline) value)
                    ""))))

(defun booleanp (v)
  (or (eq t v) (eq nil v))) ;; TODO: () => t. まぁどうしようも無いが。

(defun reply-json (status header object)
  (let ((json (to-json object)))
    `(,status ,(or header
                   '(:content-type "application/json"))
              (,json))))
