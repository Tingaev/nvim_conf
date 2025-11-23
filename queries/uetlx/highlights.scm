; extends

(pair key: (key_string) @property)


(pair value: (string (dq_plain) @field))
(expr(path(identifier)) @field)
(array(string(dq_plain(string_fragment(identifier)))) @field)
(sq_string) @string

(call fn: (identifier) @function.call)

((number) @number)

((identifier) @boolean (#any-of? @boolean "true" "false"))
