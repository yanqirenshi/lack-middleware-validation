(in-package :lack.middleware.validation)

(defun validator-require (name value &key require default-value)
  (declare (ignore name))
  (or value
      (if require
          (or default-value (error "Fuck'n error."))
          nil)))
