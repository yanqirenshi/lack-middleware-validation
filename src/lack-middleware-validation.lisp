(in-package :lack.middleware.validation)

;;;;;
;;;;; Initialize messages
;;;;;
(w2w:add-messages *message-data*)


;;;;;
;;;;; Validation
;;;;;
(defvar *validator-plist*
  '(:integer validator-integer
    :float validator-float
    :double validator-double
    :string validator-string
    :boolean validator-boolean
    :email validator-email
    :url validator-url
    :postal-code validator-postal-code
    :telephone-number validator-telephone-number
    :date validator-date))

(defun validator (code)
  (let ((validator (getf *validator-plist* code)))
    (unless validator (error* :not-supported-type code))
    validator))

(defun (setf validator) (validator code)
  (setf (getf *validator-plist* code) validator))

(defmacro validation (value type &key (require nil) (default-value nil))
  (let ((value-name (gensym))
        (validator (validator type)))
    `(let ((,value-name (string-downcase (symbol-name ',value))))
       (funcall #',validator
                ,value-name
                ,value
                :require ,require
                :default-value ,default-value))))

(defmacro valid? (value type &key (require nil) (default-value nil))
  (let ((value-name (gensym))
        (validator (validator type)))
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
