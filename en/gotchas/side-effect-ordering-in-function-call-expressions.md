# Side effect ordering in function call expressions

Consider the following code:

```pony
class Foo
  fun fn(x: U64) => None

actor Main
  new create(env: Env) =>
    var x: U64 = 0
    try foo()?.fn(x = 42) end
    env.out.print(x.string())

  fun foo(): Foo ? => error
```

What do you think it will print? Probably `0` right? Or maybe you realized this code is in the gotchas section so it must be `42`. If you went with `42`, you'd be right. Why?

Expressions for arguments in function calls are evaluated before the expression for the function receiver. The use of assignment expressions like `x = 42` is quite rare so we don't think many folks will be bitten by this, however, its definitely something you want to be aware of.
