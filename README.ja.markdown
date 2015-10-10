# lack-middleware-validation

## Usage
add component.

```common-lisp
(builder
 :validation
 *web*)
```

add routing.

```common-lisp
(defroute ("/sign/in" :method :POST)
    (&key |email| |password|)
  (let ((email    (validation |email|    :string :require t))
        (password (validation |password| :string :require t)))
    (render-json (sign-in email password))))
```

## Installation

```common-lisp
(ql:quickload :lack-middleware-validation)
```

## Dependencies

## Validator-XXX

Validator-XXX は `src/validatior` に定義されている。

- `name`, `value` を受け取り、値のバリデーションを行う。
- `value` が 文字列 の場合、その値を対象の値に変換し、その値を返す。
  - 変換に失敗した場合はエラーを投げる。
- `require` が
  - `t` の場合、`value` が `nil` だと エラーを返す。
    - しかし `default-value` が `nil` 以外だとエラーを投げず default-value の値を返す。
  - `nil` の場合、なにもしない。

### Arguments

| type     | name            | default value |
|----------|-----------------|---------------|
| required | `name`          | --            |
| "        | `value`         | --            |
| key      | `require`       | nil           |
| "        | `default-value` | ""            |

## Author

+ Satoshi Iwasaki (yanqirenshi@gmail.com)

## Copyright

Copyright (c) 2015 Satoshi Iwasaki (yanqirenshi@gmail.com)

## License

Licensed under the MIT License.
