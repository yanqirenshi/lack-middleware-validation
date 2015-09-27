(in-package :lack.middleware.validation)

(defun validation-email (name value &key (require nil) (default-value ""))
  (declare (ignore require default-value))
  (multiple-value-bind (ret)
      (clavier:validate (clavier:valid-email) value)
    (unless ret (validation-error "email やないよ。" name value)))
  value)

