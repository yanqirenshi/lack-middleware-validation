(in-package :lack.middleware.validation)

(w2w:add-messages *message-data*)

;;;
;;; TODO: このしたのものは何だ？ utility じゃないか？
;;;
(defun emptyp (value)
  (or (null value)
      (and (stringp value)
           (string= (string-trim '(#\Space #\Tab #\Newline) value)
                    ""))))

(defun validation-empty (name value &key (require nil) (default-value ""))
  (if (emptyp value)
      (if require
          (validation-error (format* nil :required-field name) name value)
          default-value)
      value))
