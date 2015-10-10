(in-package :lack.middleware.validation)

(define-condition validation-error (simple-error)
  ((name :initarg :name
         :initform nil
         :reader validation-error-name)
   (value :initarg :value
          :initform nil
          :reader validation-error-value)
   (message :initarg :message
            :initform nil
            :reader validation-error-message))
  (:documentation "")
  (:report
   (lambda (condition stream)
     (format stream "~a ~a=~S"
             (validation-error-message condition)
             (validation-error-name condition)
             (validation-error-value condition)))))

(defun validation-error (message name value)
  (error 'validation-error
         :name name
         :value value
         :message message))

(defun validation-error* (message-code name value)
  (assert (keywordp message-code))
  (validation-error (format* nil message-code) name value))

(defun http-status-reason (code)
  code)

(defun response-validation-error (env error &key (code 400))
  (declare (ignore env))
  (reply-json code
              (list :code code
                    :reason (http-status-reason code)
                    :message (format nil "~a" error))))

(defun response-other-error (env error &key (code 500))
  (declare (ignore env))
  (reply-json code
              (list :code code
                    :reason (http-status-reason code)
                    :error-type "server error"
                    :message (format nil "~a" error))))
