(in-package :lack.middleware.validation)

(defun validator-float (name value &key (require nil) (default-value ""))
  (declare (ignore name value require default-value))
  (error* :not-supported-type :boolean))


