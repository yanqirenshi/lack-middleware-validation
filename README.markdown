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
