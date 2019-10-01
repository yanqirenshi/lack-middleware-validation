(in-package :lack.middleware.validation)

;;;;;
;;;;; Initialize messages
;;;;;
(w2w:add-messages *message-data*)


;;;;;
;;;;; Validation
;;;;;
(defvar *validator-plist*
  '(:integer          validator-integer
    :float            validator-float
    :double           validator-double
    :string           validator-string
    :boolean          validator-boolean
    :email            validator-email
    :url              validator-url
    :postal-code      validator-postal-code
    :telephone-number validator-telephone-number
    :date             validator-date))

(defun validator (code)
  (let ((validator (getf *validator-plist* code)))
    (unless validator (error* :not-supported-type code))
    validator))

(defun (setf validator) (validator code)
  (setf (getf *validator-plist* code) validator))

(defmacro validate (value type &key (require nil) (default-value nil) (url-decode nil))
  (let ((value-name (gensym))
        (value-tmp  (gensym))
        (validator  (validator type)))
    `(let* ((,value-tmp (if ,url-decode
                            (quri:url-decode ,value)
                            ,value))
            (,value-name ,value-tmp))
       (funcall #',validator
                ,value-name
                ,value-tmp
                :require ,require
                :default-value ,default-value))))

(defmacro validation (value type &key (require nil) (default-value nil) (url-decode nil))
  (warn "~S は廃棄予定です。 ~S を利用してください。" 'validation 'validate)
  (let ((value-name (gensym))
        (value-tmp  (gensym))
        (validator  (validator type)))
    `(let* ((,value-tmp (if ,url-decode
                            (quri:url-decode ,value)
                            ,value))
            (,value-name ,value-tmp))
       (funcall #',validator
                ,value-name
                ,value-tmp
                :require ,require
                :default-value ,default-value))))

(defmacro valid? (value type &key (require nil) (default-value nil) (url-decode nil))
  (warn "~S は廃棄予定です。 ~S を利用してください。" 'validation 'validate)
  (let ((value-name (gensym))
        (value-tmp  (gensym))
        (validator  (validator type)))
    `(let* ((,value-tmp (if ,url-decode
                            (quri:url-decode ,value)
                            ,value))
            (,value-name ,value-tmp))
       (funcall #',validator
                ,value-name
                ,value-tmp
                :require ,require
                :default-value ,default-value))))

;;;;;
;;;;; Middleware
;;;;;
(defparameter *lack-middleware-validation*
  (lambda (app &key header)
    (lambda (env)
      (handler-case
          (funcall app env)
        (validation-error (error)
          (response-validation-error env error header))
        (error (error)
          (response-other-error env error header))))))
