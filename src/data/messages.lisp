(in-package :lack.middleware.validation)

(defvar *message-data*
  '((:code :not-supported-type
     :values ((:language :hiroshima
               :controller "このタイプには対応しとらんけぇ タイプ=~a"
               :description "")
              (:language :en
               :controller "Not supported type. type=~a"
               :description "")))
    (:code :not-a-valid-url
     :values ((:language :hiroshima
               :controller "これを URL として認めるわけにはイカんじゃろぉ。"
               :description "")
              (:language :en
               :controller "is not a valid URL."
               :description "")))
    (:code :not-a-valid-string
     :values ((:language :hiroshima
               :controller "残念じゃけど文字列じゃないね。"
               :description "")
              (:language :en
               :controller "is not a valid String."
               :description "")))
    (:code :not-a-valid-integer
     :values ((:language :hiroshima
               :controller "残念じゃけど整数(Integer)じゃないね。"
               :description "")
              (:language :en
               :controller "is not a valid Integer."
               :description "")))
    (:code :not-a-valid-telephone-number
     :values ((:language :hiroshima
               :controller "これ、電話番号じゃないじゃろうがね。"
               :description "")
              (:language :en
               :controller "Is not a valid telephone number."
               :description "")))
    (:code :not-a-valid-postal-code
     :values ((:language :hiroshima
               :controller "こりゃぁ郵便番号じゃなかろぉ。"
               :description "")
              (:language :en
               :controller "Is not a valid postal code."
               :description "")))
    (:code :not-a-valid-boolean
     :values ((:language :hiroshima
               :controller "残念じゃけど Boolean じゃないね。"
               :description "")
              (:language :en
               :controller "is not a valid Boolean."
               :description "")))
    (:code :not-a-valid-double
     :values ((:language :hiroshima
               :controller "残念じゃけど Double じゃないね。"
               :description "")
              (:language :en
               :controller "is not a valid Double."
               :description "")))
    (:code :not-a-valid-float
     :values ((:language :hiroshima
               :controller "残念じゃけど Float じゃないね。"
               :description "")
              (:language :en
               :controller "is not a valid Float."
               :description "")))
    (:code :required-field
     :values ((:language :hiroshima
               :controller "~A は必須項目じゃけぇね。ちゃんと入力せんといけんよ。"
               :description "")
              (:language :en
               :controller "~A is a Required field."
               :description "")))
    ;; template. please copy use.
    (:code nil
     :values ((:language :hiroshima
               :controller ""
               :description "")
              (:language :en
               :controller ""
               :description "")))))
