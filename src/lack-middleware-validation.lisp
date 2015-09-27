(in-package :lack.middleware.validation)

;;;;;
;;;;; Initialize messages
;;;;;
(w2w:add-messages *message-data*)


;;;;;
;;;;; Validation
;;;;;
(defvar *validator-plist*
  '(:integer validation-integer
    :float validation-float
    :double validation-double
    :string validation-string
    :boolean validation-boolean
    :email validation-email
    :url validation-url
    :postal-code validation-postal-code
    :telephone-number validation-telephone-number))

(defun get-validator (type)
  (let ((validator (getf *validator-plist* type)))
    (unless validator (error* :not-supported-type type))
    validator))


(defmacro validation (value type &key (require nil) (default-value nil))
  (let ((value-name (gensym))
        (validator (get-validator type)))
    (print validator)
    `(let ((,value-name (string-downcase (symbol-name ',value))))
       (funcall #',validator
                ,value-name
                ,value
                :require ,require
                :default-value ,default-value))))

;;;;;
;;;;; Middleware
;;;;;
(defvar *lack-middleware-validation*
  (lambda (app)
    (lambda (env)
      (handler-case
          (funcall app env)
        (validation-error (e) (response-validation-error env e))
        (error            (e) (response-other-error      env e))))))
