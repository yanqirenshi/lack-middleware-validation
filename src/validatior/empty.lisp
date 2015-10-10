(in-package :lack.middleware.validation)

(defun validator-empty (name value &key (require nil) (default-value ""))
  (if (emptyp value)
      (if require
          (validation-error (format* nil :required-field name) name value)
          default-value)
      value))
