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

### Statement

```
valid? value data-type &key require default-value
```

### Data Type

| data-type         | validator                  |
|-------------------+----------------------------|
| :integer          | validator-integer          |
| :float            | validator-float            |
| :double           | validator-double           |
| :string           | validator-string           |
| :boolean          | validator-boolean          |
| :email            | validator-email            |
| :url              | validator-url              |
| :postal-code      | validator-postal-code      |
| :telephone-number | validator-telephone-number |
| :date             | validator-date             |

### Require

| values | description              |
|--------+--------------------------|
| t      | valie is nil ⇒ error     |
| nil    | valie is nil ⇒ not error |

### Default value

value is nil ⇒ return default-value

## Installation

```common-lisp
(ql:quickload :lack-middleware-validation)
```

## Dependencies

## Arguments

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
