(in-package :lack.middleware.validation)

(defun validator-url (name value &key (require nil) (default-value ""))
  (validator-string name value :require require :default-value default-value))
