(in-package :lack.middleware.validation)

(setf w2w::*world* (w2w:make-world :hiroshima))

(defvar *message-data*
  '((:code :not-supported-type
     :contents ((:language :hiroshima :controller "このタイプには対応しとらんけぇ タイプ=~a" :description "")
                (:language :en :controller "Not supported type. type=~a" :description "")))
    (:code :not-a-valid-url
     :contents ((:language :hiroshima :controller "これを URL として認めるわけにはイカんじゃろぉ。" :description "")
                (:language :en        :controller "is not a valid URL." :description "")))
    (:code :not-a-valid-string
     :contents ((:language :hiroshima :controller "残念じゃけど文字列じゃないね。" :description "")
                (:language :en        :controller "is not a valid String." :description "")))
    (:code :not-a-valid-integer
     :contents ((:language :hiroshima :controller "残念じゃけど整数(Integer)じゃないね。" :description "")
                (:language :en        :controller "is not a valid Integer." :description "")))
    (:code :not-a-valid-telephone-number
     :contents ((:language :hiroshima :controller "これ、電話番号じゃないじゃろうがね。" :description "")
                (:language :en        :controller "Is not a valid telephone number." :description "")))
    (:code :not-a-valid-postal-code
     :contents ((:language :hiroshima :controller "こりゃぁ郵便番号じゃなかろぉ。" :description "")
                (:language :en        :controller "Is not a valid postal code." :description "")))
    (:code :required-field
     :contents ((:language :hiroshima :controller "~A は必須項目じゃけぇね。ちゃんと入力せんといけんよ。" :description "")
                (:language :en        :controller "~A is a Required field." :description "")))
    ;;
    ;;
    ;; template. please copy use.
    ;;
    (:code nil
     :contents ((:language :hiroshima
                 :controller ""
                 :description "")
                (:language :en
                 :controller ""
                 :description "")))))

(defun refresh-message (message-data)
  (dolist (data message-data)
    (let ((code (getf data :code)))
      (when code
        (dolist (contents (getf data :contents))
          (w2w:add-message (w2w:make-message code
                                             (getf contents :language)
                                             (getf contents :controller)
                                             :description (getf contents :description))))))))

(refresh-message *message-data*)


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

