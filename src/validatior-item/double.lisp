(in-package :lack.middleware.validation)

(defun validation-double (name value &key (require nil) (default-value ""))
  (declare (ignore name value require default-value))
  (error* :not-supported-type :boolean))
