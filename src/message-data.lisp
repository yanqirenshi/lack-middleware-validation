(in-package :lack.middleware.validation)

(defvar *message-data*
  '((:code :not-supported-type
     :value ((:language :hiroshima
              :controller "このタイプには対応しとらんけぇ タイプ=~a"
              :description "")
             (:language :en
              :controller "Not supported type. type=~a"
              :description "")))
    (:code :not-a-valid-url
     :value ((:language :hiroshima
              :controller "これを URL として認めるわけにはイカんじゃろぉ。"
              :description "")
             (:language :en
              :controller "is not a valid URL."
              :description "")))
    (:code :not-a-valid-string
     :value ((:language :hiroshima
              :controller "残念じゃけど文字列じゃないね。"
              :description "")
             (:language :en
              :controller "is not a valid String."
              :description "")))
    (:code :not-a-valid-integer
     :value ((:language :hiroshima
              :controller "残念じゃけど整数(Integer)じゃないね。"
              :description "")
             (:language :en
              :controller "is not a valid Integer."
              :description "")))
    (:code :not-a-valid-telephone-number
     :value ((:language :hiroshima
              :controller "これ、電話番号じゃないじゃろうがね。"
              :description "")
             (:language :en
              :controller "Is not a valid telephone number."
              :description "")))
    (:code :not-a-valid-postal-code
     :value ((:language :hiroshima
              :controller "こりゃぁ郵便番号じゃなかろぉ。"
              :description "")
             (:language :en
              :controller "Is not a valid postal code."
              :description "")))
    (:code :required-field
     :value ((:language :hiroshima
              :controller "~A は必須項目じゃけぇね。ちゃんと入力せんといけんよ。"
              :description "")
             (:language :en
              :controller "~A is a Required field."
              :description "")))
    ;; template. please copy use.
    (:code nil
     :value ((:language :hiroshima
              :controller ""
              :description "")
             (:language :en
              :controller ""
              :description "")))))
