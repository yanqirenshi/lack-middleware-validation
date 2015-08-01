(in-package :lack.middleware.validation)

(defun validation-url (name value &key (require nil) (default-value ""))
  (validation-string name value :require require :default-value default-value))
